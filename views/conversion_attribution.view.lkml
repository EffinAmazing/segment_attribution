view: conversion_attribution {
  derived_table: {
    persist_for: "12 hours"
    sql:
    select
      c.id as conversion_id,
      s.id as session_id,
      row_number() over (partition by c.id order by s.received_at asc) as index_asc,
      row_number() over (partition by c.id order by s.received_at desc) as index_desc,
      count(1) over (partition by c.id) as num_sessions
    from ${sessions.SQL_TABLE_NAME} s
      left join ${conversion_event.SQL_TABLE_NAME} c
        on s.user_id = c.user_id
        and s.received_at <= c.received_at

    /* this logic limits the attribution window to 30 days */
    /* change 30 to your desired attribution window or remove this for all-time attribution */
    where s.received_at >= dateadd(days, -30, c.received_at)
    ;;
  }

  dimension: primary_key {
    primary_key: yes
    type: string
    sql: ${conversion_id}||${session_id} ;;
  }

  dimension: conversion_id {
    type: string
    sql: ${TABLE}.conversion_id ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: index_asc {
    type: number
    sql: ${TABLE}.index_asc ;;
  }

  dimension: index_desc {
    type: number
    sql: ${TABLE}.index_desc ;;
  }

  dimension: num_sessions {
    type: number
    sql: ${TABLE}.num_sessions ;;
  }

  filter: attribution_model {
    type: string
    suggestions: ["First Touch", "Last Touch", "40-20-40", "Linear"]
  }

  dimension: attribution_credit {
    type: number
    sql:
      case
        when ${attribution_model} = 'First Touch'
          then case when ${index_asc} = 1 then 1 else 0 end
        when ${attribution_model} = 'Last Touch'
          then case when ${index_desc} = 1 then 1 else 0 end
        when ${attribution_model} = 'Linear'
          then 1.00/${num_sessions}
        when ${attribution_model} = '40-20-40'
          then
            case
              when ${num_sessions} = 1 then 1
              when ${num_sessions} = 2 then .5
              when ${num_sessions} > 2 then
                case
                  when ${index_asc} = 1 or ${index_desc} = 1 then .4
                  else 0.2/(${num_sessions} - 2)
                end
            end
      end
    ;;
  }

}
