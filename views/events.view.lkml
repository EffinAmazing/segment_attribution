view: events {

  # this view is a combination of page and track calls
  # it also maps anonymous events to a user_id if the visitor who triggered the events is identified

  # ADD LAG TIME HERE

  derived_table: {
    persist_for: "12 hours"
    sql:
      with events as (
      --union tracks and pages into a single events table
        select
          id,
          user_id,
          received_at,
          anonymous_id,
          event,
          context_page_url,
          context_page_referrer,
          context_campaign_name,
          context_campaign_medium,
          context_campaign_source
        from ${tracks.SQL_TABLE_NAME}
        union all
        select
          id,
          user_id,
          received_at,
          anonymous_id,
          'page' as event,
          context_page_url,
          context_page_referrer,
          context_campaign_name,
          context_campaign_medium,
          context_campaign_source
        from ${pages.SQL_TABLE_NAME}
      ),
      id_mapped_events as (
      --join the unioned track and pages with id_map to fill in user_id retroactively for identified users
        select e.id, e.received_at, e.anonymous_id, e.event, context_page_url,
          context_page_referrer, context_campaign_name, context_campaign_medium, context_campaign_source,
          coalesce(e.user_id, i.user_id) as user_id,
          coalesce(e.user_id, i.user_id, e.anonymous_id) as visitor_id
        from events e
          left join ${id_map.SQL_TABLE_NAME} i
            on i.anonymous_id = e.anonymous_id
      )
      select *,
        timestamp_diff(received_at, lag(received_at) over (partition by visitor_id order by received_at asc), minute) as mins_since_prev_event
      from id_mapped_events
    ;;
  }


  #
  # KEYS
  #

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: user_id {
    type: string
    description: "The user_id that was recorded with the event OR the mapped user_id for users who were identified after the event occured. This is null if the visitor has never been identified."
    sql: ${TABLE}.user_id ;;
  }

  dimension: anonymous_id {
    type: string
    sql: ${TABLE}.anonymous_id ;;
  }

  dimension: visitor_id {
    type: string
    description: "The identity of the user - this is the User ID if known, or the Segment Anonymous ID if the visitor has never been identified."
    sql: ${TABLE}.visitor_id ;;
  }


  #
  # DIMENSIONS
  #

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension_group: received {
    type: time
    timeframes: [raw, time, date]
  }

  dimension: mins_since_prev_event {
    type: number
    description: "The number of minutes since the previous event for this visitor. We use this to create sessions."
    sql: ${TABLE}.mins_since_prev_event ;;
  }


  #
  # MEASURES
  #

  measure: count {
    type: count
  }

}
