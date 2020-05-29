view: conversion_event {
  derived_table: {
    persist_for: "12 hours"
    sql:
      with o as (
        select
          id,
          user_id,
          received_at,
          @{conversion_value} as conversion_value,
          row_number() over (partition by id order by loaded_at desc) as rn
        from @{segment_schema_name}.@{conversion_event}
      )
      select *,
        row_number() over (partition by user_id order by received_at asc) as conversion_num
      from o
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

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }


  #
  # DIMENSIONS
  #

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

  dimension: conversion_value {
    type: number
    description: "The monetary value of the conversion."
    value_format_name: usd_0
    sql: ${TABLE}.conversion_value ;;
  }

  dimension: conversion_num {
    type: number
    description: "The conversion index number: 1 meaning it's the first time this user_id converted, 2 the second time, etc."
    sql: ${TABLE}.conversion_num ;;
  }


  #
  # MEASURES
  #

  measure: count {
    type: count
    label: "Number of Conversions"
  }

  measure: total_conversion_value {
    type: sum
    value_format_name: usd_0
    sql: ${conversion_value} ;;
  }
}
