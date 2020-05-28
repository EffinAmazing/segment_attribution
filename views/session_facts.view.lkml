view: session_facts {
  derived_table: {
    persist_for: "12 hours"
    sql:
      select

      from ${sessions.SQL_TABLE_NAME}
    ;;
  }


  #
  # KEYS
  #

  #
  # DIMENSIONS
  #

  #
  # MEASURES
  #


}
