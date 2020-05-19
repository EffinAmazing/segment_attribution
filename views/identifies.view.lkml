view: identifies {
  derived_table: {
    persist_for: "12 hours"
    sql:
      with i as (
        select *,
          row_number() over (partition by id order by loaded_at desc) as rn
        from @{segment_schema_name}.identifies
      )
      select *
      from i
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

  dimension: address_city {
    type: string
    sql: ${TABLE}.address_city ;;
  }

  dimension: address_country {
    type: string
    sql: ${TABLE}.address_country ;;
  }

  dimension: address_postal_code {
    type: string
    sql: ${TABLE}.address_postal_code ;;
  }

  dimension: address_state {
    type: string
    sql: ${TABLE}.address_state ;;
  }

  dimension: address_street {
    type: string
    sql: ${TABLE}.address_street ;;
  }

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

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: customer_lifetime_value {
    type: number
    sql: ${TABLE}.customer_lifetime_value ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: purchase_count {
    type: number
    sql: ${TABLE}.purchase_count ;;
  }

  dimension_group: received {
    type: time
    description: "Time when the identify call was received."
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


  #
  # MEASURES
  #

  measure: count {
    type: count
  }

}
