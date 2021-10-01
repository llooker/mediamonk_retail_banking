- dashboard: card_type_lookup
  title: Card Type Lookup
  layout: newspaper
  query_timezone: user_timezone
  elements:
  - title: Spend by Category with Other Cards
    name: Spend by Category with Other Cards
    model: retail_banking
    explore: card_transactions
    type: looker_column
    fields: [card_transactions.category, card_transactions.total_amount, card.type]
    pivots: [card.type]
    filters:
      card.type: -"Null",-Looker Junior
    sorts: [card_transactions.category 0, card_transactions.total_amount desc 0, card.type]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields: [{table_calculation: of_total_transaction_in_category, label: "%\
          \ of Total Transaction in Category", expression: "${card_transactions.total_amount}/${card_transactions.total_amount:total}",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: pivot
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
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
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: of_total_transaction_in_category,
            id: Looker Emerald - 1 - of_total_transaction_in_category, name: Looker
              Emerald}, {axisId: of_total_transaction_in_category, id: Looker Ruby
              - 2 - of_total_transaction_in_category, name: Looker Ruby}, {axisId: of_total_transaction_in_category,
            id: Looker Ruby Preferred - 3 - of_total_transaction_in_category, name: Looker
              Ruby Preferred}, {axisId: of_total_transaction_in_category, id: Looker
              Business Reserve - 4 - of_total_transaction_in_category, name: Looker
              Business Reserve}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: [Home - card_transactions.total_amount]
    font_size: '12'
    series_types: {}
    series_colors: {}
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
    hidden_fields: [card_transactions.total_amount]
    listen: {}
    row: 26
    col: 0
    width: 12
    height: 7
  - title: Clients by Age Tier
    name: Clients by Age Tier
    model: retail_banking
    explore: card_transactions
    type: looker_column
    fields: [client.number_of_clients, client.age_tier, client.gender]
    pivots: [client.gender]
    filters:
      client.age_tier: "-Undefined"
    sorts: [client.age_tier, client.gender]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
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
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: client.number_of_clients,
            id: client.number_of_clients, name: Number of Clients}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_colors:
      F - client.number_of_clients: "#FFD95F"
      M - client.number_of_clients: "#E57947"
    defaults_version: 1
    listen:
      Card Type: card.type
    row: 7
    col: 6
    width: 12
    height: 8
  - name: Who are our customers?
    type: text
    title_text: Who are our customers?
    row: 0
    col: 0
    width: 24
    height: 3
  - name: What do customers spend the most money and when?
    type: text
    title_text: What do customers spend the most money and when?
    row: 15
    col: 0
    width: 24
    height: 4
  - name: When do we lose customers?
    type: text
    title_text: When do we lose customers?
    row: 33
    col: 0
    width: 24
    height: 4
  - title: Which cards do they come from?
    name: Which cards do they come from?
    model: retail_banking
    explore: card_order_sequence
    type: marketplace_viz_sankey::sankey-marketplace
    fields: [card_order_sequence.type, repeat_card_purchase.type, card_order_sequence.number_of_credit_cards]
    sorts: [card_order_sequence.type desc]
    limit: 500
    query_timezone: America/Los_Angeles
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    color_range: ["#3EB0D5", "#E57947", "#75E2E2", "#FBB555", "#FBB555"]
    label_type: name
    show_null_points: true
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    limit_displayed_rows: false
    legend_position: center
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
    defaults_version: 0
    series_types: {}
    listen:
      Card Type: repeat_card_purchase.type
    row: 3
    col: 18
    width: 6
    height: 6
  - title: Transactions before Cancellation
    name: Transactions before Cancellation
    model: retail_banking
    explore: card_transactions
    type: looker_scatter
    fields: [card_transactions.days_before_cancellation, card_transactions.count]
    filters:
      card_transactions.days_before_cancellation: "<0,NOT NULL"
      card.is_cancelled: 'Yes'
    sorts: [card_transactions.days_before_cancellation desc]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
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
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: card_transactions.count,
            id: card_transactions.count, name: Number of Transactions}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: ''
    series_colors:
      card_transactions.count: "#E57947"
    defaults_version: 1
    listen:
      Card Type: card.type
    row: 37
    col: 0
    width: 12
    height: 7
  - title: Which cards do they go to?
    name: Which cards do they go to?
    model: retail_banking
    explore: card_order_sequence
    type: marketplace_viz_sankey::sankey-marketplace
    fields: [card_order_sequence.type, repeat_card_purchase.type, card_order_sequence.number_of_credit_cards]
    sorts: [card_order_sequence.type desc]
    limit: 500
    query_timezone: America/Los_Angeles
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    color_range: ["#3EB0D5", "#E57947", "#75E2E2", "#FBB555", "#FBB555"]
    label_type: name
    show_null_points: true
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    limit_displayed_rows: false
    legend_position: center
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
    defaults_version: 0
    series_types: {}
    listen:
      Card Type: card_order_sequence.type
    row: 9
    col: 18
    width: 6
    height: 6
  - title: Spend by Category
    name: Spend by Category
    model: retail_banking
    explore: card_transactions
    type: looker_column
    fields: [card_transactions.category, card_transactions.total_amount, client.is_urban]
    pivots: [client.is_urban]
    fill_fields: [client.is_urban]
    sorts: [card_transactions.category 0, card_transactions.total_amount desc 0, client.is_urban]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields: [{table_calculation: of_total_transaction_in_category, label: "%\
          \ of Total Transaction in Category", expression: "${card_transactions.total_amount}/${card_transactions.total_amount:total}",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
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
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: of_total_transaction_in_category,
            id: Looker Emerald - 1 - of_total_transaction_in_category, name: Looker
              Emerald}, {axisId: of_total_transaction_in_category, id: Looker Ruby
              - 2 - of_total_transaction_in_category, name: Looker Ruby}, {axisId: of_total_transaction_in_category,
            id: Looker Ruby Preferred - 3 - of_total_transaction_in_category, name: Looker
              Ruby Preferred}, {axisId: of_total_transaction_in_category, id: Looker
              Business Reserve - 4 - of_total_transaction_in_category, name: Looker
              Business Reserve}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: [Home - card_transactions.total_amount]
    font_size: '12'
    series_types: {}
    series_colors:
      of_total_transaction_in_category: "#9ED7D7"
      No - of_total_transaction_in_category: "#9ED7D7"
      Yes - of_total_transaction_in_category: "#FBB556"
    series_labels:
      No - of_total_transaction_in_category: Rural Zipcodes
      Yes - of_total_transaction_in_category: Urban Zipcodes
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
    hidden_fields: [card_transactions.total_amount]
    listen:
      Card Type: card.type
    row: 19
    col: 0
    width: 12
    height: 7
  - title: Highest Average Transactions by Customer Zipcode
    name: Highest Average Transactions by Customer Zipcode
    model: retail_banking
    explore: card_transactions
    type: looker_map
    fields: [card.months_as_customer, card_transactions.count, client.location]
    sorts: [card_transactions.count desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: average_transactions_per_month, label: Average
          Transactions per Month, expression: "${card_transactions.count}/${card.months_as_customer}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 39.717917958223524
    map_longitude: -104.90074396133423
    map_zoom: 11
    defaults_version: 1
    hidden_fields: [card_transactions.count, card.months_as_customer]
    series_types: {}
    map: auto
    map_projection: ''
    quantize_colors: false
    listen:
      Card Type: card.type
    row: 7
    col: 0
    width: 6
    height: 8
  - title: Number of Transactions
    name: Number of Transactions
    model: retail_banking
    explore: card_transactions
    type: single_value
    fields: [card_transactions.count, card_transactions.transaction_quarter]
    fill_fields: [card_transactions.transaction_quarter]
    filters:
      card_transactions.transaction_quarter: before 0 days ago
    sorts: [card_transactions.transaction_quarter desc]
    limit: 2
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Last Quarter
    series_types: {}
    defaults_version: 1
    hidden_fields: [card_transactions.transaction_quarter]
    listen:
      Card Type: card.type
    row: 3
    col: 0
    width: 6
    height: 4
  - title: Total $ Spent
    name: Total $ Spent
    model: retail_banking
    explore: card_payments
    type: single_value
    fields: [card_payments.total_interest_charged]
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
      Card Type: card.type
    row: 3
    col: 6
    width: 6
    height: 4
  - title: Number of New Customers
    name: Number of New Customers
    model: retail_banking
    explore: card_transactions
    type: single_value
    fields: [card.number_of_credit_cards, card.create_quarter]
    fill_fields: [card.create_quarter]
    filters:
      card.create_quarter: before 0 days ago
    sorts: [card.create_quarter desc]
    limit: 2
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Last Quarter
    series_types: {}
    defaults_version: 1
    hidden_fields: [card.create_quarter]
    listen:
      Card Type: card.type
    row: 3
    col: 12
    width: 6
    height: 4
  - title: Merchants with Highest Spend
    name: Merchants with Highest Spend
    model: retail_banking
    explore: card_transactions
    type: looker_grid
    fields: [card_transactions.merchant, card_transactions.total_amount, card_transactions.category]
    sorts: [card_transactions.total_amount desc, card_transactions.category]
    limit: 10
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      card_transactions.total_amount:
        is_active: true
        palette:
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 1
    map_latitude: 37.37888785004527
    map_longitude: -97.30590820312501
    map_zoom: 6
    series_types: {}
    listen:
      Card Type: card.type
    row: 26
    col: 12
    width: 12
    height: 7
  - title: Cohort Analysis
    name: Cohort Analysis
    model: retail_banking
    explore: card_transactions
    type: looker_line
    fields: [card_transactions.months_since_signup, card_transactions.count, card.number_of_credit_cards,
      client.age_tier]
    pivots: [client.age_tier]
    fill_fields: [client.age_tier]
    filters:
      card_transactions.months_since_signup: "[0, 24]"
    sorts: [card_transactions.months_since_signup, client.age_tier]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: transaction_by_credit_card, label: Transaction
          by Credit Card, expression: "${card_transactions.count}/ ${card_transactions.months_since_signup}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: transaction_by_credit_card,
            id: Below 20 - 0 - transaction_by_credit_card, name: Below 20}, {axisId: transaction_by_credit_card,
            id: 20 to 29 - 1 - transaction_by_credit_card, name: 20 to 29}, {axisId: transaction_by_credit_card,
            id: 30 to 39 - 2 - transaction_by_credit_card, name: 30 to 39}, {axisId: transaction_by_credit_card,
            id: 40 to 49 - 3 - transaction_by_credit_card, name: 40 to 49}, {axisId: transaction_by_credit_card,
            id: 50 to 59 - 4 - transaction_by_credit_card, name: 50 to 59}, {axisId: transaction_by_credit_card,
            id: 60 or Above - 5 - transaction_by_credit_card, name: 60 or Above}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    series_types: {}
    series_colors:
      card_transactions.count: "#7363A9"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [card_transactions.count, card.number_of_credit_cards]
    listen:
      Card Type: card.type
    row: 19
    col: 12
    width: 12
    height: 7
  - title: Transactions without Cancellation
    name: Transactions without Cancellation
    model: retail_banking
    explore: card_transactions
    type: looker_scatter
    fields: [card_transactions.count, card_transactions.days_since_signup]
    sorts: [card_transactions.days_since_signup]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
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
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: card_transactions.count,
            id: card_transactions.count, name: Number of Transactions}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_colors:
      card_transactions.count: "#E57947"
    defaults_version: 1
    listen:
      Card Type: card.type
    row: 37
    col: 12
    width: 12
    height: 7
  filters:
  - name: Card Type
    title: Card Type
    type: field_filter
    default_value: Looker Ruby
    allow_multiple_values: true
    required: false
    model: retail_banking
    explore: card_transactions
    listens_to_filters: []
    field: card.type
