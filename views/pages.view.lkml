view: pages {
  derived_table: {
    persist_for: "12 hours"
    sql:
      with p as (
        select *,
          row_number() over (partition by id order by loaded_at desc) as rn
        from @{segment_schema_name}.pages
      )
      select *
      from p
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

  dimension: campaign_content {
    type: string
    sql: ${TABLE}.context_campaign_content ;;
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.context_user_agent ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: path {
    type: string
    sql: ${TABLE}.path ;;
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

  dimension: referrer {
    type: string
    sql: ${TABLE}.referrer ;;
  }

  dimension: search {
    type: string
    sql: ${TABLE}.search ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }


  #
  # MEASURES
  #

  measure: count {
    type: count
  }
}
