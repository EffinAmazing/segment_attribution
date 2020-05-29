view: id_map {
  derived_table: {
    persist_for: "12 hours"
    sql:
      with i as (
        select
          user_id,
          anonymous_id,
          received_at,
          row_number() over (partition by anonymous_id order by received_at) as rn
        from ${identifies.SQL_TABLE_NAME}
        where user_id is not null
          and anonymous_id is not null
      )
      select *
      from i
      where rn = 1 /* only get the first time each anonymous_id is associated with a user_id */
    ;;
  }


  #
  # KEYS
  #

  dimension: anonymous_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.anonymous_id ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }


  #
  # DIMENSIONS
  #

  dimension_group: first_identify {
    type: time
    description: "The time of the first identify call for the given anonymous_id."
    timeframes: [raw, time, date]
    sql: ${TABLE}.received_at ;;
  }

}
