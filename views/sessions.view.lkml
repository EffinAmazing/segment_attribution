view: sessions {
  derived_table: {
    persist_for: "12 hours"
    sql:
      with sessions as (
        select
          user_id,
          visitor_id,
          anonymous_id,
          received_at,
          event,
          id as event_id,
          mins_since_prev_event,
          row_number() over (partition by visitor_id order by received_at) as session_num
        from ${events.SQL_TABLE_NAME}
        where mins_since_prev_event > 30
        /* This WHERE statement can be adjusted: How many minutes of inactivity until a new session is started? */
      )
      select *,
        visitor_id||'--sess'||cast(session_num as string) as id
      from sessions
    ;;
  }


  #
  # KEYS
  #

  dimension: id {
    type: string
    primary_key: yes
    description: "The Session ID is a combination of the Visitor ID (user_id if known, or falls back to anonymous_id) and the session start time."
    sql: ${TABLE}.id ;;
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}.event_id ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: visitor_id {
    type: string
    sql: ${TABLE}.visitor_id ;;
  }

  dimension: anonymous_id {
    type: string
    sql: ${TABLE}.anonymous_id ;;
  }


  #
  # DIMENSIONS
  #

  dimension: event {
    type: string
    description: "The first event in this session."
    sql: ${TABLE}.event ;;
  }

  dimension: mins_since_prev_event {
    type: number
    description: "The number of minutes since the previous session ended."
    sql: ${TABLE}.mins_since_prev_event ;;
  }

  dimension_group: start {
    type: time
    timeframes: [raw, time, date, month]
    description: "The time of the first event in this session."
    sql: ${TABLE}.received_at ;;
  }

  dimension: session_num {
    type: number
    description: "The numbered session for this visitor, 1 would mean it is their first session ever."
    sql: ${TABLE}.session_num ;;
  }

  dimension: is_first_session {
    type: yesno
    sql: ${session_num} = 1 ;;
  }


  #
  # MEASURES
  #

  measure: count {
    type: count
  }

  measure: count_first_session {
    type: count
    filters: [is_first_session: "Yes"]
  }

}
