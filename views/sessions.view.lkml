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
          row_number() over (partition by visitor_id order by received_at asc) as session_num,
          lower(context_page_referrer) as referrer,
          context_page_url as url,
          net.host(lower(context_page_referrer)) as referrer_host,
          lower(context_campaign_name) as campaign_name,
          lower(context_campaign_medium) as campaign_medium,
          lower(context_campaign_source) as campaign_source
        from ${events.SQL_TABLE_NAME}
        /******
        ** This WHERE statement can be adjusted
        ** the default is 30 which means sessions are reset after 30 minutes of inactivity
        *******/
        where mins_since_prev_event > 30
      )
      select *,
        visitor_id||'--sess'||cast(session_num as string) as id,
        /*******
        ** The case statement below needs to be updated to match your definition of marketing channels
        ** the logic here is used in Sessions and all children of sessions,
        ** most importantly for this block the Channel are used in the conversion_attribution view and dashboard
        ********/
        case
          when campaign_medium in ('ppc', 'cpc')
            or referrer_host = 'googleads.g.doubleclick.net'
            or referrer_host like '%googlesyndication.com'
            or url like '%fbclid%'
            or url like '%gclid%'
            then 'Paid'
          when campaign_medium = 'email' then 'Email'
          when referrer_host like '%@{site_domain}' then 'Internal'
          when (campaign_name is null and campaign_medium is null and campaign_source is null) then
            case
              when referrer is null then 'Direct'
              when referrer_host like 'www.google.%'
                or referrer_host = 'www.bing.com'
                or referrer_host like '%search.yahoo.com'
                or referrer_host = 'duckduckgo.com'
                then 'Organic Search'
              when referrer_host like '%facebook.com'
                or referrer_host like '%instagram.com'
                or referrer_host like '%youtube.com'
                or referrer_host like '%pinterest.com'
                then 'Organic Social'
              when referrer is not null then 'Referral'
            end
          else 'Other'
        end as channel
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
    timeframes: [raw, time, date, week, month]
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

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: campaign_medium {
    type: string
    sql: ${TABLE}.campaign_medium ;;
  }

  dimension: campaign_source {
    type: string
    sql: ${TABLE}.campaign_source ;;
  }

  dimension: has_campaign {
    type: yesno
    sql: ${campaign_medium} is not null
      or ${campaign_name} is not null
      or ${campaign_source} is not null ;;
  }

  dimension: referrer {
    type: string
    sql: ${TABLE}.referrer ;;
  }

  dimension: referrer_host {
    type: string
    sql: ${TABLE}.referrer_host ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
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
