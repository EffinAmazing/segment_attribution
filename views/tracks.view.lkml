view: tracks {
  derived_table: {
    persist_for: "12 hours"
    sql:
      with t as (
        select *,
          row_number() over (partition by id order by loaded_at desc) as rn
        from @{segment_schema_name}.tracks
      )
      select *
      from t
      where rn = 1
    ;;
  }


  #
  # KEYS
  #

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: anonymous_id {
    type: string
    sql: ${TABLE}.anonymous_id ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }


  #
  # DIMENSIONS
  #

  dimension: campaign_content {
    type: string
    sql: ${TABLE}.context_campaign_content ;;
  }

  dimension: campaign_medium {
    type: string
    sql: ${TABLE}.context_campaign_medium ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.context_campaign_name ;;
  }

  dimension: campaign_source {
    type: string
    sql: ${TABLE}.context_campaign_source ;;
  }

  dimension: campaign_term {
    type: string
    sql: ${TABLE}.context_campaign_term ;;
  }

  dimension: context_page_path {
    type: string
    sql: ${TABLE}.context_page_path ;;
  }

  dimension: context_page_referrer {
    type: string
    sql: ${TABLE}.context_page_referrer ;;
  }

  dimension: context_page_title {
    type: string
    sql: ${TABLE}.context_page_title ;;
  }

  dimension: context_page_url {
    type: string
    sql: ${TABLE}.context_page_url ;;
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.context_user_agent ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: event_text {
    type: string
    sql: ${TABLE}.event_text ;;
  }

  dimension_group: received {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.received_at ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timestamp ;;
  }


  #
  # MEASURES
  #

  measure: count {
    type: count
  }
}
