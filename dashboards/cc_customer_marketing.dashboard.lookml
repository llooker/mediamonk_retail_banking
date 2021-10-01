- dashboard: cc_customer_marketing
  title: CC Customer Marketing
  layout: newspaper
  preferred_viewer: dashboards
  load_configuration: wait
  query_timezone: America/New_York
  elements:
  - title: Types of Cards by Age
    name: Types of Cards by Age
    model: retail_banking
    explore: account
    type: looker_column
    fields: [card.type, account.number_of_accounts, client.age_tier]
    pivots: [card.type]
    fill_fields: [client.age_tier]
    filters:
      card.type: -"Null"
    sorts: [card.type 0, client.age_tier]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: account.number_of_accounts,
            id: account.number_of_accounts, name: Number of Accounts}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    series_colors: {}
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      account.number_of_accounts:
        is_active: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: []
    hide_totals: false
    hide_row_totals: false
    listen: {}
    row: 15
    col: 0
    width: 12
    height: 6
  - title: Number of New Customers
    name: Number of New Customers
    model: retail_banking
    explore: card_transactions
    type: single_value
    fields: [card.number_of_credit_cards, card.create_quarter, quarterly_goal]
    filters:
      card.create_quarter: before 0 days ago
    sorts: [card.create_quarter desc]
    limit: 2
    column_limit: 50
    dynamic_fields: [{dimension: quarterly_goal, label: Quarterly Goal, expression: '100',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Quarterly Goal
    series_types: {}
    defaults_version: 1
    hidden_fields: [card.create_quarter]
    listen: {}
    row: 7
    col: 0
    width: 6
    height: 4
  - title: Total Number of Transactions
    name: Total Number of Transactions
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
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "(${card_transactions.count}-offset(${card_transactions.count},1))/${card_transactions.count}",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Last Quarter
    series_types: {}
    defaults_version: 1
    hidden_fields: [card_transactions.transaction_quarter]
    listen: {}
    row: 3
    col: 6
    width: 6
    height: 4
  - title: Transactions by Card Type
    name: Transactions by Card Type
    model: retail_banking
    explore: card_transactions
    type: looker_column
    fields: [card_transactions.count, client.number_of_clients, card.type]
    filters:
      card.type: -"Null"
      card_transactions.transaction_date: 1 quarters
    sorts: [client.number_of_clients desc]
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
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
    y_axes: [{label: '', orientation: left, series: [{axisId: card_transactions.count,
            id: card_transactions.count, name: Number of Transactions}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: client.number_of_clients,
            id: client.number_of_clients, name: Number of Clients}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    size_by_field: client.number_of_clients
    series_types:
      client.number_of_clients: scatter
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
    listen: {}
    row: 3
    col: 12
    width: 12
    height: 8
  - name: "<span class='fa fa-tachometer'> Current Quarter Overview </span>"
    type: text
    title_text: "<span class='fa fa-tachometer'> Current Quarter Overview </span>"
    subtitle_text: Are we headed in the right direction?
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 3
  - title: Number of Lost Customers
    name: Number of Lost Customers
    model: retail_banking
    explore: card_transactions
    type: single_value
    fields: [card.number_of_credit_cards, card.end_quarter]
    fill_fields: [card.end_quarter]
    filters:
      card.end_date: before 0 days ago
    sorts: [card.end_quarter desc]
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
    custom_color: "#B32F37"
    comparison_label: Last Quarter
    series_types: {}
    defaults_version: 1
    hidden_fields: [card.end_quarter]
    listen: {}
    row: 7
    col: 6
    width: 6
    height: 4
  - name: "<span class='fa fa-dollar'> Who are our best customers? </span>"
    type: text
    title_text: "<span class='fa fa-dollar'> Who are our best customers? </span>"
    subtitle_text: ''
    body_text: ''
    row: 27
    col: 0
    width: 24
    height: 3
  - title: Total Charged to Customers
    name: Total Charged to Customers
    model: retail_banking
    explore: card_payments
    type: single_value
    fields: [card_payments.total_interest_charged]
    filters:
      card_payments.payment_completed_date: 1 quarters ago for 1 quarters
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
    note_state: collapsed
    note_display: below
    note_text: Interest, Late Fees and Annual Fees
    listen: {}
    row: 3
    col: 0
    width: 6
    height: 4
  - name: "<span class='fa fa-calendar'> When are we losing customers? </span>"
    type: text
    title_text: "<span class='fa fa-calendar'> When are we losing customers? </span>"
    subtitle_text: ''
    body_text: ''
    row: 40
    col: 0
    width: 24
    height: 3
  - name: "<span class='fa fa-users'> Customer Profile </span>"
    type: text
    title_text: "<span class='fa fa-users'> Customer Profile </span>"
    subtitle_text: What cards do customers use for what?
    body_text: "**Recommended Action:** Figure out what demographics we want to attract\
      \ and use information about popular spend categories to figure out what points\
      \ offerings may be attractive to those people"
    row: 11
    col: 0
    width: 24
    height: 4
  - title: Spend by Transaction Category
    name: Spend by Transaction Category
    model: retail_banking
    explore: card_transactions
    type: looker_donut_multiples
    fields: [card_transactions.category, card_transactions.total_amount, client.age_tier]
    pivots: [card_transactions.category]
    fill_fields: [client.age_tier]
    sorts: [card_transactions.category 0]
    limit: 500
    column_limit: 50
    show_value_labels: false
    font_size: '12'
    value_labels: legend
    label_type: labPer
    inner_radius: 45
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    series_colors: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    stacking: percent
    limit_displayed_rows: false
    hidden_series: [Home - card_transactions.total_amount]
    legend_position: center
    series_types: {}
    point_style: none
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
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
    listen: {}
    row: 15
    col: 12
    width: 12
    height: 12
  - title: Spend Over Time
    name: Spend Over Time
    model: retail_banking
    explore: card_transactions
    type: looker_area
    fields: [card_transactions.total_amount, card_transactions.category, card_transactions.transaction_date]
    pivots: [card_transactions.category]
    fill_fields: [card_transactions.transaction_date]
    filters:
      card_transactions.transaction_date: 4 weeks
    sorts: [card_transactions.total_amount desc 0, card_transactions.category]
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
    show_null_points: true
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: Entertainment - card_transactions.total_amount,
            id: Entertainment - card_transactions.total_amount, name: Entertainment},
          {axisId: Food & Dining - card_transactions.total_amount, id: Food & Dining
              - card_transactions.total_amount, name: Food & Dining}, {axisId: Gas
              & Transport - card_transactions.total_amount, id: Gas & Transport -
              card_transactions.total_amount, name: Gas & Transport}, {axisId: Grocery
              - card_transactions.total_amount, id: Grocery - card_transactions.total_amount,
            name: Grocery}, {axisId: Health & Personal Care - card_transactions.total_amount,
            id: Health & Personal Care - card_transactions.total_amount, name: Health
              & Personal Care}, {axisId: Home - card_transactions.total_amount, id: Home
              - card_transactions.total_amount, name: Home}, {axisId: Miscellaneous
              - card_transactions.total_amount, id: Miscellaneous - card_transactions.total_amount,
            name: Miscellaneous}, {axisId: Shopping - card_transactions.total_amount,
            id: Shopping - card_transactions.total_amount, name: Shopping}, {axisId: Travel
              - card_transactions.total_amount, id: Travel - card_transactions.total_amount,
            name: Travel}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 21
    col: 0
    width: 12
    height: 6
  - title: Card Overview
    name: Card Overview
    model: retail_banking
    explore: card_payments
    type: looker_grid
    fields: [card.type, card_type.annual_fee, card_type.APR, card_payments.average_amount_owed,
      card_payments.total_interest_charged, card_type.total_annual_fee, card.number_of_credit_cards]
    filters:
      card.type: -"Null"
    sorts: [card_payments.total_interest_charged desc]
    limit: 500
    query_timezone: America/Los_Angeles
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
    series_labels:
      card_type.APR: APR
      card_payments.average_amount_owed: Avg Balance
      card_payments.total_interest_charged: Total Interest
      card_type.total_annual_fee: Total Annual Fee
      card.number_of_credit_cards: Number of Cards
    series_cell_visualizations:
      card_payments.average_amount_owed:
        is_active: false
    series_text_format:
      card.number_of_credit_cards:
        fg_color: "#6b6b6b"
        align: right
      card_type.total_annual_fee:
        align: right
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
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 36
    col: 8
    width: 16
    height: 4
  - title: Interest by Age & Gender
    name: Interest by Age & Gender
    model: retail_banking
    explore: card_payments
    type: looker_column
    fields: [client.age_tier, card_payments.total_interest_charged, client.gender]
    pivots: [client.gender]
    filters:
      client.age_tier: "-Undefined"
    sorts: [client.age_tier, client.gender]
    limit: 500
    query_timezone: America/Los_Angeles
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: card_payments.total_interest_charged,
            id: F - card_payments.total_interest_charged, name: F}, {axisId: card_payments.total_interest_charged,
            id: M - card_payments.total_interest_charged, name: M}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_colors:
      F - card_payments.total_interest_charged: "#4285F4"
      M - card_payments.total_interest_charged: "#EA8600"
    defaults_version: 1
    listen: {}
    row: 30
    col: 0
    width: 8
    height: 10
  - title: Card Progression Sankey
    name: Card Progression Sankey
    model: retail_banking
    explore: card_order_sequence
    type: marketplace_viz_sankey::sankey-marketplace
    fields: [card_order_sequence.type, repeat_card_purchase.type, second_repeat_card_purchase.type,
      card_order_sequence.number_of_credit_cards]
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
    listen: {}
    row: 30
    col: 8
    width: 16
    height: 6
  - title: Months Until Churn by Card Type
    name: Months Until Churn by Card Type
    model: retail_banking
    explore: account
    type: looker_column
    fields: [card.type, card.months_as_customer_tiered, card.number_of_credit_cards]
    pivots: [card.type]
    fill_fields: [card.type, card.months_as_customer_tiered]
    filters:
      card.end_date: NOT NULL
    sorts: [card.months_as_customer_tiered, card.type]
    limit: 500
    query_timezone: America/Los_Angeles
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
    y_axes: [{label: '', orientation: left, series: [{axisId: card.number_of_credit_cards,
            id: Looker Junior - 0 - card.number_of_credit_cards, name: Looker Junior},
          {axisId: card.number_of_credit_cards, id: Looker Emerald - 1 - card.number_of_credit_cards,
            name: Looker Emerald}, {axisId: card.number_of_credit_cards, id: Looker
              Ruby - 2 - card.number_of_credit_cards, name: Looker Ruby}, {axisId: card.number_of_credit_cards,
            id: Looker Ruby Preferred - 3 - card.number_of_credit_cards, name: Looker
              Ruby Preferred}, {axisId: card.number_of_credit_cards, id: Looker Business
              Reserve - 4 - card.number_of_credit_cards, name: Looker Business Reserve}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    row: 43
    col: 0
    width: 13
    height: 7
  - title: How Many Cards Did Cancelers Have?
    name: How Many Cards Did Cancelers Have?
    model: retail_banking
    explore: account
    type: looker_pie
    fields: [client_fact.number_of_credit_cards, client.number_of_clients]
    filters:
      card.is_cancelled: 'Yes'
    sorts: [client.number_of_clients desc]
    limit: 500
    query_timezone: America/Los_Angeles
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    series_types: {}
    listen: {}
    row: 43
    col: 13
    width: 11
    height: 7
  - title: Number of Transactions Before Cancellation
    name: Number of Transactions Before Cancellation
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
    listen: {}
    row: 50
    col: 0
    width: 24
    height: 8
