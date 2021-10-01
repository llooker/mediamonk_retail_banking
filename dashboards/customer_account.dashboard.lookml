- dashboard: customer_account
  title: Customer Account
  layout: newspaper
  embed_style:
    background_color: "#ffffff"
    show_title: false
    title_color: "#3a4245"
    show_filters_bar: false
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - title: Transactions This Month
    name: Transactions This Month
    model: retail_banking
    explore: trans
    type: single_value
    fields: [trans.total_transaction_value]
    filters:
      trans.account_id: ''
    sorts: [trans.total_transaction_value]
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
    hidden_fields: []
    series_types: {}
    y_axes: []
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Transaction Date: trans.transaction_date
      Account ID: account.account_id
    row: 12
    col: 0
    width: 8
    height: 4
  - title: Latest Balance
    name: Latest Balance
    model: retail_banking
    explore: trans
    type: single_value
    fields: [trans.trans_id, trans.category, trans.amount, trans.balance, trans.type,
      trans.total_transaction_value, trans.transaction_date]
    filters:
      trans.account_id: ''
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
    hidden_fields: [trans.trans_id, trans.category, trans.amount, trans.account, trans.type,
      trans.total_transaction_value]
    series_types: {}
    y_axes: []
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Transaction Date: trans.transaction_date
      Account ID: account.account_id
    row: 12
    col: 16
    width: 8
    height: 4
  - title: Recent Transactions
    name: Recent Transactions
    model: retail_banking
    explore: trans
    type: looker_grid
    fields: [trans.transaction_date, trans.trans_id, trans.category, trans.amount,
      trans.balance, trans.type, trans.total_transaction_value]
    filters:
      trans.account_id: ''
      trans.transaction_date: before 0 days ago
    sorts: [trans.transaction_date desc]
    limit: 20
    query_timezone: America/Los_Angeles
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      value: _
      trans.total_transaction_value: Value
    series_column_widths:
      trans.total_transaction_value: 100
    series_cell_visualizations:
      trans.total_transaction_value:
        is_active: false
        value_display: true
      value:
        is_active: true
        value_display: false
    series_text_format:
      trans.total_transaction_value:
        bold: true
        align: right
      trans.balance:
        bold: true
        align: right
    series_value_format:
      trans.trans_id:
        name: id
        format_string: '0'
        label: ID
      trans.account:
        name: id
        format_string: '0'
        label: ID
    series_types: {}
    hidden_fields: [trans.trans_id, trans.account]
    y_axes: []
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Account ID: account.account_id
    row: 16
    col: 0
    width: 10
    height: 8
  - title: Average Balance
    name: Average Balance
    model: retail_banking
    explore: trans
    type: single_value
    fields: [trans.average_account_balance_during_transaction]
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
    tile_title: Balance Summary
    highlightColours: ["#31bf4b", "#3EB0D5", "#B1399E", "#592EC2", "#4276BE", "#72D16D",
      "#FFD95F", "#B32F37", "#9174F0", "#E57947", "#75E2E2", "#FBB555"]
    textColour: "#1e9623"
    trans.average_transaction_value: Average Transaction Value
    trans.average_account_balance: Average Account Balance
    trans.number_of_transactions: Number of Transactions
    trans.total_transaction_value: Total Transaction Value
    series_types: {}
    hidden_fields: []
    y_axes: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Transaction Date: trans.transaction_date
      Account ID: account.account_id
    row: 12
    col: 8
    width: 8
    height: 4
  - title: Client Overview
    name: Client Overview
    model: retail_banking
    explore: account
    type: looker_single_record
    fields: [client.client_id, client.district_id, client.age, client.gender, card.number_of_credit_cards,
      account.number_of_accounts, client.client_full_address, loan.number_of_loans]
    sorts: [client.client_id desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    series_types: {}
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Account ID: account.account_id
    row: 3
    col: 0
    width: 6
    height: 6
  - name: "<span class='fa fa-tachometer'> Account Overview </span>"
    type: text
    title_text: "<span class='fa fa-tachometer'> Account Overview </span>"
    row: 9
    col: 0
    width: 24
    height: 3
  - title: Balance Over Time
    name: Balance Over Time
    model: retail_banking
    explore: balances_fact
    type: looker_line
    fields: [balances_fact.balance_date, balances_fact.total_balance, trans.total_outflow,
      trans.total_inflow]
    filters:
      balances_fact.balance_date: 6 months
    sorts: [balances_fact.balance_date desc]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: trans.total_outflow,
            id: trans.total_outflow, name: Total Outflow}, {axisId: trans.total_inflow,
            id: trans.total_inflow, name: Total Inflow}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: balances_fact.total_balance,
            id: balances_fact.total_balance, name: Total Balance}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    series_colors:
      trans.total_outflow: "#B32F37"
      trans.total_inflow: "#72D16D"
      balances_fact.total_balance: "#4276BE"
    series_point_styles:
      balances_fact.total_balance: diamond
    defaults_version: 1
    hidden_fields: []
    listen:
      Client ID: client.client_id
      Account ID: account.account_id
    row: 16
    col: 10
    width: 14
    height: 8
  - title: Call Center Conversations by Sentiment
    name: Call Center Conversations by Sentiment
    model: call_center
    explore: transcript
    type: looker_scatter
    fields: [transcript.count, transcript.conversation_start_week, conversation_facts.overall_call_sentiment_category]
    pivots: [conversation_facts.overall_call_sentiment_category]
    fill_fields: [transcript.conversation_start_week]
    filters:
      transcript.conversation_start_week: 24 weeks
    sorts: [transcript.conversation_start_week desc, conversation_facts.overall_call_sentiment_category
        desc]
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    size_by_field: transcript.count
    series_types: {}
    series_colors:
      Very Positive - transcript.count: "#72D16D"
      Very Negative - transcript.count: "#B32F37"
      Neutal - transcript.count: "#4276BE"
      Negative - transcript.count: "#E57947"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    interpolation: linear
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Account ID: banking_client_facts.account_id
    row: 3
    col: 14
    width: 10
    height: 6
  - name: "<span class='fa fa-tachometer'> Card History </span>"
    type: text
    title_text: "<span class='fa fa-tachometer'> Card History </span>"
    row: 24
    col: 0
    width: 24
    height: 3
  - name: "<span class='fa fa-tachometer'> Customer Overview </span>"
    type: text
    title_text: "<span class='fa fa-tachometer'> Customer Overview </span>"
    row: 0
    col: 0
    width: 24
    height: 3
  - title: Client Location
    name: Client Location
    model: retail_banking
    explore: account
    type: looker_map
    fields: [client.location]
    sorts: [client.location desc]
    limit: 1
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: traffic_day
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: icon
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 43.01933304739632
    map_longitude: -105.89756011962892
    map_zoom: 5
    series_types: {}
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Account ID: account.account_id
    row: 3
    col: 6
    width: 8
    height: 6
  - title: Card Transactions by Time of Day
    name: Card Transactions by Time of Day
    model: retail_banking
    explore: card_transactions
    type: looker_scatter
    fields: [card_transactions.transaction_time_of_day, card_transactions.amount,
      card_transactions.trans_id]
    sorts: [card_transactions.transaction_time_of_day]
    limit: 5000
    column_limit: 50
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
    x_axis_scale: linear
    y_axis_combined: true
    show_null_points: true
    series_types: {}
    swap_axes: true
    hidden_fields: [card_transactions.trans_id]
    interpolation: linear
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Transaction Date: card_transactions.transaction_date
      Account ID: account.account_id
    row: 27
    col: 0
    width: 12
    height: 10
  - title: Spend Across Cards
    name: Spend Across Cards
    model: retail_banking
    explore: card_transactions
    type: looker_line
    fields: [card.card_number, card_transactions.total_amount, card_transactions.transaction_week]
    pivots: [card.card_number]
    fill_fields: [card_transactions.transaction_week]
    filters: {}
    sorts: [card.card_number]
    limit: 500
    column_limit: 5
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Transaction Date: card_transactions.transaction_date
      Account ID: account.account_id
    row: 27
    col: 12
    width: 12
    height: 10
  - title: Fraudulent vs Legitimate Transactions
    name: Fraudulent vs Legitimate Transactions
    model: retail_banking
    explore: card_transactions
    type: looker_line
    fields: [card_transactions.number_of_fraudulent_transactions, card_transactions.number_of_legitimate_transactions,
      card_transactions.transaction_date]
    filters: {}
    sorts: [card_transactions.transaction_date desc]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: card_transactions.number_of_legitimate_transactions,
            id: card_transactions.number_of_legitimate_transactions, name: Number
              of Legitimate Transactions}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: card_transactions.number_of_fraudulent_transactions,
            id: card_transactions.number_of_fraudulent_transactions, name: Number
              of Fraudulent Transactions}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      card_transactions.number_of_legitimate_transactions: "#72D16D"
      card_transactions.number_of_fraudulent_transactions: "#B32F37"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Transaction Date: card_transactions.transaction_date
      Account ID: account.account_id
    row: 37
    col: 0
    width: 16
    height: 8
  - title: Transactions by Location
    name: Transactions by Location
    model: retail_banking
    explore: card_transactions
    type: looker_map
    fields: [card_transactions.merchant_location, card_transactions.count]
    sorts: [card_transactions.count desc]
    limit: 500
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light_no_labels
    map_position: fit_data
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
    map_latitude: 39.60112517872094
    map_longitude: -105.41849613189699
    map_zoom: 7
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Transaction Date: card_transactions.transaction_date
      Account ID: account.account_id
    row: 37
    col: 16
    width: 8
    height: 8
  filters:
  - name: Client ID
    title: Client ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: retail_banking
    explore: trans
    listens_to_filters: []
    field: client.client_id
  - name: Transaction Date
    title: Transaction Date
    type: field_filter
    default_value: 6 months
    allow_multiple_values: true
    required: false
    model: retail_banking
    explore: trans
    listens_to_filters: []
    field: trans.transaction_date
  - name: Account ID
    title: Account ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: retail_banking
    explore: card_transactions
    listens_to_filters: []
    field: account.account_id
