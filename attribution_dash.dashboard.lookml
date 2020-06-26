
- dashboard: attribution_dash
  title: Attribution
  layout: newspaper
  elements:
  - title: Number of Conversions
    name: Number of Conversions
    model: attribution
    explore: conversion_attribution
    type: single_value
    fields: [conversion_attribution.share_of_conversions]
    filters: {}
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: "#,###"
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#62bad4",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_sequential3},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Date Range: conversion_event.received_date
      Attribution Model: conversion_attribution.attribution_model
      Channel: sessions.channel
    row: 0
    col: 12
    width: 4
    height: 5
  - title: Value of Conversions
    name: Value of Conversions
    model: attribution
    explore: conversion_attribution
    type: single_value
    fields: [conversion_attribution.share_of_revenue]
    filters: {}
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date Range: conversion_event.received_date
      Attribution Model: conversion_attribution.attribution_model
      Channel: sessions.channel
    row: 0
    col: 16
    width: 4
    height: 5
  - title: Total Sessions
    name: Total Sessions
    model: attribution
    explore: sessions
    type: single_value
    fields: [sessions.count]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date Range: sessions.start_date
      Channel: sessions.channel
    row: 0
    col: 0
    width: 4
    height: 5
  - title: New Visitors
    name: New Visitors
    model: attribution
    explore: sessions
    type: single_value
    fields: [sessions.count_first_session]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    series_types: {}
    listen:
      Date Range: sessions.start_date
      Channel: sessions.channel
    row: 0
    col: 4
    width: 4
    height: 5
  - title: Weekly Sessions
    name: Weekly Sessions
    model: attribution
    explore: sessions
    type: looker_line
    fields: [sessions.count, sessions.count_first_session, sessions.start_week]
    filters:
      sessions.start_week: before 0 weeks ago
    sorts: [sessions.start_week desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
      options:
        steps: 5
    series_types: {}
    series_colors: {}
    series_labels:
      sessions.count_first_session: New Visitors
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date Range: sessions.start_date
      Channel: sessions.channel
    row: 11
    col: 0
    width: 8
    height: 7
  - title: Weekly Conversions
    name: Weekly Conversions
    model: attribution
    explore: conversion_attribution
    type: looker_line
    fields: [conversion_event.received_week, conversion_event.total_conversion_value,
      conversion_event.count]
    filters:
      conversion_event.received_week: before 0 weeks ago
    sorts: [conversion_event.received_week desc]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: 4a543302-b64d-409c-9863-679b5b230aac
      options:
        steps: 5
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: conversion_event.total_conversion_value,
            id: conversion_event.total_conversion_value, name: Total Conversion Value}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: conversion_event.count, id: conversion_event.count, name: Number
              of Conversions}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hide_legend: true
    series_types: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date Range: conversion_event.received_date
      Attribution Model: conversion_attribution.attribution_model
      Channel: sessions.channel
    row: 11
    col: 8
    width: 8
    height: 7
  - title: Monthly Sessions
    name: Monthly Sessions
    model: attribution
    explore: sessions
    type: looker_column
    fields: [sessions.count, sessions.count_first_session, sessions.start_month]
    fill_fields: [sessions.start_month]
    sorts: [sessions.start_month]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
      options:
        steps: 5
    series_types: {}
    series_colors: {}
    series_labels:
      sessions.count_first_session: New Visitors
    x_axis_datetime_label: "%b '%y"
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date Range: sessions.start_date
      Channel: sessions.channel
    row: 18
    col: 0
    width: 8
    height: 7
  - title: Monthly Conversions
    name: Monthly Conversions
    model: attribution
    explore: conversion_attribution
    type: looker_column
    fields: [conversion_event.received_month, conversion_event.total_conversion_value,
      conversion_event.count]
    fill_fields: [conversion_event.received_month]
    sorts: [conversion_event.received_month]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: 4a543302-b64d-409c-9863-679b5b230aac
      options:
        steps: 5
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: conversion_event.total_conversion_value,
            id: conversion_event.total_conversion_value, name: Total Conversion Value}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: conversion_event.count, id: conversion_event.count, name: Number
              of Conversions}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hide_legend: true
    series_types: {}
    series_colors: {}
    x_axis_datetime_label: "%b '%y"
    show_dropoff: false
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date Range: conversion_event.received_date
      Attribution Model: conversion_attribution.attribution_model
      Channel: sessions.channel
    row: 18
    col: 8
    width: 8
    height: 7
  - title: Conversions by Channel
    name: Conversions by Channel
    model: attribution
    explore: conversion_attribution
    type: looker_grid
    fields: [sessions.channel, conversion_attribution.share_of_conversions, conversion_attribution.share_of_revenue]
    filters: {}
    sorts: [sessions.channel]
    limit: 500
    dynamic_fields: [{table_calculation: average_value_per_conversion, label: Average
          Value per Conversion, expression: "${conversion_attribution.share_of_revenue}/${conversion_attribution.share_of_conversions}",
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number}]
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      conversion_attribution.share_of_conversions: Attributed Conversions
      conversion_attribution.share_of_revenue: Attributed Revenue
      average_value_per_conversion: Revenue per Conv
    series_cell_visualizations:
      conversion_attribution.share_of_conversions:
        is_active: true
        palette:
          palette_id: 4a543302-b64d-409c-9863-679b5b230aac
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      conversion_attribution.share_of_revenue:
        is_active: true
        palette:
          palette_id: 4a543302-b64d-409c-9863-679b5b230aac
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      average_value_per_conversion:
        is_active: true
        palette:
          palette_id: 4a543302-b64d-409c-9863-679b5b230aac
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: conversion_attribution.share_of_revenue,
            id: conversion_attribution.share_of_revenue, name: Attributed Conversion
              Value}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: conversion_attribution.share_of_conversions, id: conversion_attribution.share_of_conversions,
            name: Attributed Conversions}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Date Range: conversion_event.received_date
      Attribution Model: conversion_attribution.attribution_model
      Channel: sessions.channel
    row: 5
    col: 8
    width: 9
    height: 6
  - title: Sessions by Channel
    name: Sessions by Channel
    model: attribution
    explore: sessions
    type: looker_grid
    fields: [sessions.count, sessions.count_first_session, sessions.channel]
    filters: {}
    sorts: [sessions.channel]
    limit: 500
    dynamic_fields: [{table_calculation: new_session_rate, label: New Session Rate,
        expression: "${sessions.count_first_session}/${sessions.count}", value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number}]
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      sessions.count_first_session: New Visitors
      new_session_rate: "% New"
    series_cell_visualizations:
      sessions.count:
        is_active: true
        palette:
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      sessions.count_first_session:
        is_active: true
        palette:
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      new_session_rate:
        is_active: true
        palette:
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    x_axis_datetime_label: "%b '%y"
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    listen:
      Date Range: sessions.start_date
      Channel: sessions.channel
    row: 5
    col: 0
    width: 8
    height: 6
  - name: Overall Site Conversion Rate
    title: Overall Site Conversion Rate
    merged_queries:
    - model: attribution
      explore: sessions
      type: single_value
      fields: [sessions.count, sessions.channel]
      filters: {}
      limit: 500
      total: true
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      defaults_version: 1
    - model: attribution
      explore: conversion_attribution
      type: table
      fields: [sessions.channel, conversion_attribution.share_of_conversions]
      filters: {}
      limit: 500
      total: true
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: sessions.channel
        source_field_name: sessions.channel
    type: single_value
    series_types: {}
    hidden_fields: [sessions.count, conversion_attribution.share_of_conversions]
    sorts: [sessions.channel]
    total: true
    dynamic_fields: [{table_calculation: overall_conv_rate, label: Overall Conv Rate,
        expression: 'sum(${conversion_attribution.share_of_conversions})/sum(${sessions.count})',
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Date Range: sessions.start_date
      Channel: sessions.channel
    - Date Range: conversion_event.received_date
      Attribution Model: conversion_attribution.attribution_model
      Channel: sessions.channel
    row: 0
    col: 8
    width: 4
    height: 5
  - title: Average Conversion Value
    name: Average Conversion Value
    model: attribution
    explore: conversion_attribution
    type: single_value
    fields: [conversion_attribution.share_of_conversions, conversion_attribution.share_of_revenue]
    filters: {}
    limit: 500
    dynamic_fields: [{table_calculation: avg_conv_value, label: Avg Conv Value, expression: "${conversion_attribution.share_of_revenue}/${conversion_attribution.share_of_conversions}",
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: [conversion_attribution.share_of_revenue, conversion_attribution.share_of_conversions]
    listen:
      Date Range: conversion_event.received_date
      Attribution Model: conversion_attribution.attribution_model
      Channel: sessions.channel
    row: 0
    col: 20
    width: 4
    height: 5
  - name: Weekly Conversion Rate & Revenue per Session
    title: Weekly Conversion Rate & Revenue per Session
    merged_queries:
    - model: attribution
      explore: sessions
      type: looker_line
      fields: [sessions.start_week, sessions.count]
      fill_fields: [sessions.start_week]
      filters:
        sessions.start_week: before 0 weeks ago
      sorts: [sessions.start_week desc]
      limit: 500
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: false
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ''
      stacking: ''
      limit_displayed_rows: false
      legend_position: center
      point_style: none
      show_value_labels: true
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      show_null_points: true
      interpolation: linear
      color_application:
        collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
        palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
        options:
          steps: 5
      series_types: {}
      series_colors: {}
      series_labels:
        sessions.count_first_session: New Visitors
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      defaults_version: 1
      join_fields: []
    - model: attribution
      explore: conversion_attribution
      type: table
      fields: [conversion_event.received_week, conversion_attribution.share_of_conversions,
        conversion_attribution.share_of_revenue]
      fill_fields: [conversion_event.received_week]
      filters: {}
      sorts: [conversion_event.received_week desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: conversion_event.received_week
        source_field_name: sessions.start_week
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: conv_rate, id: conv_rate,
            name: Conv Rate}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: revenue_per_session, id: revenue_per_session, name: Revenue
              per Session}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    x_axis_label: ''
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    hide_legend: true
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    type: looker_line
    hidden_fields: [sessions.count, conversion_attribution.share_of_conversions, conversion_attribution.share_of_revenue]
    dynamic_fields: [{table_calculation: conv_rate, label: Conv Rate, expression: "${conversion_attribution.share_of_conversions}/${sessions.count}",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}, {table_calculation: revenue_per_session, label: Revenue
          per Session, expression: "${conversion_attribution.share_of_revenue}/${sessions.count}",
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number}]
    row: 11
    col: 16
    width: 8
    height: 7
  - name: Monthly Conversion Rate & Revenue per Session
    title: Monthly Conversion Rate & Revenue per Session
    merged_queries:
    - model: attribution
      explore: sessions
      type: looker_line
      fields: [sessions.count, sessions.start_month]
      fill_fields: [sessions.start_month]
      limit: 500
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: false
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ''
      stacking: ''
      limit_displayed_rows: false
      legend_position: center
      point_style: none
      show_value_labels: true
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      show_null_points: true
      interpolation: linear
      color_application:
        collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
        palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
        options:
          steps: 5
      series_types: {}
      series_colors: {}
      series_labels:
        sessions.count_first_session: New Visitors
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      defaults_version: 1
      join_fields: []
    - model: attribution
      explore: conversion_attribution
      type: table
      fields: [conversion_attribution.share_of_conversions, conversion_attribution.share_of_revenue,
        conversion_event.received_month]
      fill_fields: [conversion_event.received_month]
      filters: {}
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: conversion_event.received_month
        source_field_name: sessions.start_month
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: conv_rate, id: conv_rate,
            name: Conv Rate}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: revenue_per_session, id: revenue_per_session, name: Revenue
              per Session}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    x_axis_label: Week Starting
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    hide_legend: true
    legend_position: center
    series_types:
      revenue_per_session: column
      conv_rate: column
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    x_axis_datetime_label: "%b '%y"
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    type: looker_line
    hidden_fields: [sessions.count, conversion_attribution.share_of_conversions, conversion_attribution.share_of_revenue]
    dynamic_fields: [{table_calculation: conv_rate, label: Conv Rate, expression: "${conversion_attribution.share_of_conversions}/${sessions.count}",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}, {table_calculation: revenue_per_session, label: Revenue
          per Session, expression: "${conversion_attribution.share_of_revenue}/${sessions.count}",
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number}]
    listen:
    - Date Range: sessions.start_date
      Channel: sessions.channel
    - Date Range: conversion_event.received_date
      Attribution Model: conversion_attribution.attribution_model
      Channel: sessions.channel
    row: 18
    col: 16
    width: 8
    height: 7
  - name: Conversion Rates
    title: Conversion Rates
    merged_queries:
    - model: attribution
      explore: sessions
      type: looker_grid
      fields: [sessions.count, sessions.channel]
      filters: {}
      sorts: [sessions.count desc]
      limit: 500
      column_limit: 50
      show_view_names: false
      show_row_numbers: true
      transpose: false
      truncate_text: true
      hide_totals: false
      hide_row_totals: false
      size_to_fit: true
      table_theme: white
      limit_displayed_rows: false
      enable_conditional_formatting: false
      header_text_alignment: left
      header_font_size: '12'
      rows_font_size: '12'
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      color_application:
        collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
        palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
        options:
          steps: 5
      show_sql_query_menu_options: false
      show_totals: true
      show_row_totals: true
      series_labels:
        sessions.count_first_session: New Visitors
      series_cell_visualizations:
        sessions.count:
          is_active: true
          palette:
            palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
            collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
        sessions.count_first_session:
          is_active: true
          palette:
            palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
            collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
        new_session_rate:
          is_active: true
          palette:
            palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
            collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: false
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ''
      stacking: ''
      legend_position: center
      series_types: {}
      point_style: none
      series_colors: {}
      show_value_labels: true
      label_density: 25
      x_axis_scale: auto
      x_axis_datetime_label: "%b '%y"
      y_axis_combined: true
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      show_null_points: true
      interpolation: linear
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      defaults_version: 1
    - model: attribution
      explore: conversion_attribution
      type: table
      fields: [sessions.channel, conversion_attribution.share_of_conversions, conversion_attribution.share_of_revenue]
      filters: {}
      sorts: [conversion_attribution.share_of_conversions desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: sessions.channel
        source_field_name: sessions.channel
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_labels:
      value_per_session: Revenue per Session
    series_cell_visualizations:
      conv_rate:
        is_active: true
        palette:
          palette_id: e8e36076-7664-4a50-27e6-f1725c419a1b
          collection_id: legacy
          custom_colors:
          - "#44B0D3"
          - "#B03D9E"
      value_per_session:
        is_active: true
        palette:
          palette_id: e6a8bbae-6cec-a99d-ae4a-9248db413233
          collection_id: legacy
          custom_colors:
          - "#44B0D3"
          - "#B03D9E"
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: looker_grid
    series_types: {}
    hidden_fields: [sessions.count, conversion_attribution.share_of_conversions, conversion_attribution.share_of_revenue]
    sorts: [sessions.channel]
    dynamic_fields: [{table_calculation: conv_rate, label: Conv Rate, expression: "${conversion_attribution.share_of_conversions}/${sessions.count}",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}, {table_calculation: value_per_session, label: Value per
          Session, expression: "${conversion_attribution.share_of_revenue}/${sessions.count}",
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number}]
    listen:
    - Date Range: sessions.start_date
      Channel: sessions.channel
    - Date Range: conversion_event.received_date
      Attribution Model: conversion_attribution.attribution_model
      Channel: sessions.channel
    row: 5
    col: 17
    width: 7
    height: 6
  filters:
  - name: Date Range
    title: Date Range
    type: date_filter
    default_value: 6 months
    allow_multiple_values: true
    required: false
  - name: Attribution Model
    title: Attribution Model
    type: field_filter
    default_value: first
    allow_multiple_values: true
    required: false
    model: attribution
    explore: conversion_attribution
    listens_to_filters: []
    field: conversion_attribution.attribution_model
  - name: Channel
    title: Channel
    type: field_filter
    default_value: Direct,Email,Organic Search,Other,Referral,Internal,Paid,Organic
      Social
    allow_multiple_values: true
    required: false
    model: attribution
    explore: sessions
    listens_to_filters: []
    field: sessions.channel
