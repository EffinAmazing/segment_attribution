view: id_map {
  derived_table: {
    persist_for: "12 hours"
    sql:
      select
        user_id,
        anonymous_id,
        min(received_at) as ts
      from ${identifies.SQL_TABLE_NAME}
      where user_id is not null
        and anonymous_id is not null
      group by 1, 2
    ;;
  }
}
