- dashboard: credit_card_fraud_overview
  title: Credit Card Fraud Overview
  layout: newspaper
  preferred_viewer: dashboards
  elements:
  - name: Percent $ Fraud per Card Type
    title: Percent $ Fraud per Card Type
    model: retail_banking
    explore: card_transactions
    type: looker_column
    fields: [card_transactions.total_amount, card.type, card_transactions.is_fraud]
    pivots: [card_transactions.is_fraud]
    fill_fields: [card.type, card_transactions.is_fraud]
    sorts: [card.type, card_transactions.is_fraud 0]
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
    stacking: percent
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
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
        reverse: true
    y_axes: [{label: '', orientation: left, series: [{axisId: No - card_transactions.total_amount,
            id: No - card_transactions.total_amount, name: 'No'}, {axisId: Yes - card_transactions.total_amount,
            id: Yes - card_transactions.total_amount, name: 'Yes'}], showLabels: false,
        showValues: true, minValue: 90, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    font_size: '12'
    series_types: {}
    series_colors:
      No - card_transactions.total_amount: "#72D16D"
      Yes - card_transactions.total_amount: "#FBB555"
    value_labels: legend
    label_type: labPer
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      State: card_transactions_with_zip.state
    row: 7
    col: 0
    width: 12
    height: 8
  - name: Total Value of Fraudulent Transactions
    title: Total Value of Fraudulent Transactions
    model: retail_banking
    explore: card_transactions
    type: single_value
    fields: [card_transactions.total_amount, card_transactions.reporting_period]
    filters:
      card_transactions.is_fraud: 'Yes'
      card_transactions.reporting_period: "-NULL"
    sorts: [card_transactions.reporting_period desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: percent_change, label: Percent Change, expression: "${card_transactions.total_amount}/offset(${card_transactions.total_amount},1)\
          \ - 1", value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
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
    single_value_title: Confirmed Fraud This Month
    comparison_label: vs Same Period Last Month
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
    note_state: collapsed
    note_display: hover
    note_text: Total Amount of $ Reimbursed for fraudulent activity
    listen:
      State: card_transactions_with_zip.state
    row: 3
    col: 0
    width: 5
    height: 4
  - name: Customers w/ Fraud This Month
    title: Customers w/ Fraud This Month
    model: retail_banking
    explore: card_transactions
    type: single_value
    fields: [card_transactions.reporting_period, client.number_of_clients]
    filters:
      card_transactions.reporting_period: "-NULL"
      card_transactions.is_fraud: 'Yes'
    sorts: [card_transactions.reporting_period desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: percent_change, label: Percent Change, expression: "${client.number_of_clients}/offset(${client.number_of_clients},1)\
          \ - 1", value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
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
    single_value_title: ''
    comparison_label: vs Same Period Last Month
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Number of customers with at least one confirmed fraudulent transaction
      this month
    listen:
      State: card_transactions_with_zip.state
    row: 3
    col: 5
    width: 5
    height: 4
  - name: "<span class='fa fa-lock'> Fraud Overview</span>"
    type: text
    title_text: "<span class='fa fa-lock'> Fraud Overview</span>"
    subtitle_text: Where is fraud occurring and how do we stop it?
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 3
  - name: "<span class='fa fa-building'> Merchant Deep Dive</span>"
    type: text
    title_text: "<span class='fa fa-building'> Merchant Deep Dive</span>"
    subtitle_text: What merchants seem to consistently have fraudulent activity?
    body_text: ''
    row: 15
    col: 0
    width: 24
    height: 3
  - title: Top 10 Merchants by Fraud
    name: Top 10 Merchants by Fraud
    model: retail_banking
    explore: card_transactions
    type: table
    fields: [card_transactions.merchant, card_transactions.percent_fraudulent_amount,
      card_transactions.percent_fraudulent_transactions, card_transactions.total_amount,
      card_transactions.fraud_amount]
    sorts: [card_transactions.fraud_amount desc]
    limit: 15
    column_limit: 50
    dynamic_fields: [{table_calculation: percent_change, label: Percent Change, expression: "${card_transactions.count}/offset(${card_transactions.count},1)\
          \ - 1", value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, is_disabled: true}]
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      card_transactions.percent_fraudulent_amount: "% Fraud Amount"
      card_transactions.percent_fraudulent_transactions: "% Fraud Transactions"
      card_transactions.total_amount: Total Amount
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          custom: {id: 516474c6-71f1-5281-ae2c-811db4bb10d6, label: Custom, type: continuous,
            stops: [{color: "#ffffff", offset: 0}, {color: "#f2ea57", offset: 50},
              {color: "#bf232f", offset: 100}]}, options: {steps: 25, stepped: true,
            mirror: true, constraints: {mid: {type: average}}}}, bold: false, italic: false,
        strikethrough: false, fields: [card_transactions.fraud_amount]}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    single_value_title: Fraudulent Transactions This Month
    comparison_label: vs Same Period Last Month
    series_types: {}
    defaults_version: 1
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
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      State: card_transactions_with_zip.state
    row: 18
    col: 0
    width: 9
    height: 9
  - title: "% Fraud by Spend Category"
    name: "% Fraud by Spend Category"
    model: retail_banking
    explore: card_transactions
    type: looker_bar
    fields: [card_transactions.total_amount, card_transactions.is_fraud, card_transactions.category]
    pivots: [card_transactions.is_fraud]
    fill_fields: [card_transactions.is_fraud]
    filters:
      card_transactions.transaction_date: 30 days
    sorts: [card_transactions.is_fraud 0, card_transactions.total_amount desc 2]
    limit: 500
    column_limit: 50
    row_total: right
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
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
        reverse: true
    y_axes: [{label: '', orientation: bottom, series: [{axisId: No - card_transactions.total_amount,
            id: No - card_transactions.total_amount, name: 'No'}, {axisId: Yes - card_transactions.total_amount,
            id: Yes - card_transactions.total_amount, name: 'Yes'}], showLabels: false,
        showValues: false, minValue: !!null '', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    font_size: '12'
    series_types: {}
    series_colors:
      No - card_transactions.total_amount: "#72D16D"
      Yes - card_transactions.total_amount: "#FBB555"
    value_labels: legend
    label_type: labPer
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      State: card_transactions_with_zip.state
    row: 7
    col: 12
    width: 12
    height: 8
  - title: Risky Merchants
    name: Risky Merchants
    model: retail_banking
    explore: card_transactions
    type: single_value
    fields: [card_transactions.number_merchants]
    filters:
      merchant_fact.percent_fraudulent_transactions: ">=.02"
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#EA4335"
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
    note_state: collapsed
    note_display: below
    note_text: Merchants with >2% of fraud transactions in the Past Month
    listen:
      State: card_transactions_with_zip.state
    row: 3
    col: 15
    width: 4
    height: 4
  - title: Percent of Fraudulent Transactions by Merchant Zip
    name: Percent of Fraudulent Transactions by Merchant Zip
    model: retail_banking
    explore: card_transactions
    type: looker_map
    fields: [card_transactions_with_zip.zip, card_transactions.percent_fraudulent_transactions]
    sorts: [card_transactions.percent_fraudulent_transactions desc]
    limit: 500
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
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
    defaults_version: 1
    listen:
      State: card_transactions_with_zip.state
    row: 18
    col: 17
    width: 7
    height: 9
  - title: Number of Merchants by Fraud Risk
    name: Number of Merchants by Fraud Risk
    model: retail_banking
    explore: card_transactions
    type: looker_pie
    fields: [merchant_fact.percent_fraudulent_amount_tier, card_transactions.number_merchants]
    filters:
      card_transactions.transaction_date: 30 days
    sorts: [merchant_fact.percent_fraudulent_amount_tier]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    series_colors:
      card_transactions.number_merchants: "#FBBC04"
      "> 2%": "#EA4335"
      "< 1 %": "#4285F4"
      "< .5 %": "#34A853"
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
    font_size: 12
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
    note_state: collapsed
    note_display: below
    note_text: Past 30 Days
    listen:
      State: card_transactions_with_zip.state
    row: 18
    col: 9
    width: 8
    height: 9
  - title: Calls for Fraud This Month
    name: Calls for Fraud This Month
    model: call_center
    explore: transcript
    type: single_value
    fields: [transcript.count, satisfaction_ratings.average_csat]
    filters:
      transcript__messages.issue_topic: Submit a Fraud Alert
      transcript.conversation_start_date: 30 days
    sorts: [transcript.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Satisfaction Rating
    defaults_version: 1
    listen: {}
    row: 3
    col: 10
    width: 5
    height: 4
  - name: "<span class='fa fa-users'> Customer Deep Dive</span>"
    type: text
    title_text: "<span class='fa fa-users'> Customer Deep Dive</span>"
    subtitle_text: Which customers consistently experience fraud?
    row: 27
    col: 0
    width: 24
    height: 3
  - name: "<span class='fa fa-credit-card'> Predictive Analytics</span>"
    type: text
    title_text: "<span class='fa fa-credit-card'> Predictive Analytics</span>"
    subtitle_text: Proactively reach out to customers about recent transactions that
      may be fraudulent
    body_text: "See details on choosing training parameters [here](/dashboards/560)\
      \  \nSee details on model performance [here](/dashboards/561)"
    row: 39
    col: 0
    width: 24
    height: 3
  - title: Top 10 Customers by Fraud
    name: Top 10 Customers by Fraud
    model: retail_banking
    explore: card_transactions
    type: table
    fields: [card_transactions.percent_fraudulent_amount, card_transactions.percent_fraudulent_transactions,
      card_transactions.total_amount, card_transactions.fraud_amount, client.client_id,
      client.name]
    sorts: [card_transactions.fraud_amount desc]
    limit: 15
    column_limit: 50
    dynamic_fields: [{table_calculation: percent_change, label: Percent Change, expression: "${card_transactions.count}/offset(${card_transactions.count},1)\
          \ - 1", value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, is_disabled: true}]
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      card_transactions.percent_fraudulent_amount: "% Fraud Amount"
      card_transactions.percent_fraudulent_transactions: "% Fraud Transactions"
      card_transactions.total_amount: Total Amount
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          custom: {id: 516474c6-71f1-5281-ae2c-811db4bb10d6, label: Custom, type: continuous,
            stops: [{color: "#ffffff", offset: 0}, {color: "#f2ea57", offset: 50},
              {color: "#bf232f", offset: 100}]}, options: {steps: 25, stepped: true,
            mirror: true, constraints: {mid: {type: average}}}}, bold: false, italic: false,
        strikethrough: false, fields: [card_transactions.fraud_amount]}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    single_value_title: Fraudulent Transactions This Month
    comparison_label: vs Same Period Last Month
    series_types: {}
    defaults_version: 1
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
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      State: card_transactions_with_zip.state
    row: 30
    col: 0
    width: 9
    height: 9
  - title: Fraud by Customer Demographics
    name: Fraud by Customer Demographics
    model: retail_banking
    explore: card_transactions
    type: looker_scatter
    fields: [card_transactions.percent_fraudulent_transactions, client.customer_segment,
      card_transactions.transaction_week]
    pivots: [client.customer_segment]
    fill_fields: [card_transactions.transaction_week]
    filters:
      card_transactions.transaction_date: 6 months
    sorts: [card_transactions.transaction_week desc, client.customer_segment]
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
    show_x_axis_ticks: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: card_transactions.percent_fraudulent_transactions,
            id: Middle Age in Rural Areas - card_transactions.percent_fraudulent_transactions,
            name: Middle Age in Rural Areas}, {axisId: card_transactions.percent_fraudulent_transactions,
            id: Middle Age in Urban Areas - card_transactions.percent_fraudulent_transactions,
            name: Middle Age in Urban Areas}, {axisId: card_transactions.percent_fraudulent_transactions,
            id: Retirees in Rural Areas - card_transactions.percent_fraudulent_transactions,
            name: Retirees in Rural Areas}, {axisId: card_transactions.percent_fraudulent_transactions,
            id: Retirees in Urban Areas - card_transactions.percent_fraudulent_transactions,
            name: Retirees in Urban Areas}, {axisId: card_transactions.percent_fraudulent_transactions,
            id: Young Adults in Rural Areas - card_transactions.percent_fraudulent_transactions,
            name: Young Adults in Rural Areas}, {axisId: card_transactions.percent_fraudulent_transactions,
            id: Young Adults in Urban Areas - card_transactions.percent_fraudulent_transactions,
            name: Young Adults in Urban Areas}], showLabels: false, showValues: true,
        maxValue: !!null '', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    size_by_field: card_transactions.percent_fraudulent_transactions
    series_types: {}
    interpolation: monotone
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row: 30
    col: 9
    width: 15
    height: 9
  - title: Transactions by % Difference from the Avg Category Amount
    name: Transactions by % Difference from the Avg Category Amount
    model: retail_banking
    explore: card_transactions
    type: looker_pie
    fields: [card_transactions.percent_diff_from_cat_tier, card_transactions.count]
    fill_fields: [card_transactions.percent_diff_from_cat_tier]
    filters:
      card_transactions.is_fraud: 'No'
      card_transactions.transaction_date: 2 weeks
    sorts: [card_transactions.percent_diff_from_cat_tier]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    series_colors:
      Yes - card_transactions.count: "#FBBC04"
      1000 or Above: "#EA4335"
      500 to 999: "#FBBC04"
      100 to 499: "#34A853"
      50 to 99: "#4285F4"
      Below 50: "#BDC1C6"
    series_labels:
      Yes - card_transactions.count: Confirmed Fraudulent
      No - card_transactions.count: Not Confirmed Fraudulent
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: No - card_transactions.count,
            id: No - card_transactions.count, name: 'No'}, {axisId: Yes - card_transactions.count,
            id: Yes - card_transactions.count, name: 'Yes'}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    note_state: collapsed
    note_display: hover
    note_text: Each tier is the percent deviation from the average amount in the category
      that the transaction occurred - for example, if the average spend in the Shopping
      category is $50 then a transaction of $100 is 100% above the average.
    listen: {}
    row: 42
    col: 0
    width: 8
    height: 7
  - title: Transactions that Occurred in Middle of Night
    name: Transactions that Occurred in Middle of Night
    model: retail_banking
    explore: card_transactions
    type: looker_pie
    fields: [card_transactions.count, card_transactions.middle_of_night_transaction]
    fill_fields: [card_transactions.middle_of_night_transaction]
    filters:
      card_transactions.is_fraud: 'No'
      card_transactions.transaction_date: 2 weeks
    sorts: [card_transactions.count desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    series_colors:
      Yes - card_transactions.count: "#FBBC04"
      1000 or Above: "#EA4335"
      500 to 999: "#FBBC04"
      100 to 499: "#34A853"
      50 to 99: "#4285F4"
      Below 50: "#BDC1C6"
    series_labels:
      Yes - card_transactions.count: Confirmed Fraudulent
      No - card_transactions.count: Not Confirmed Fraudulent
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: No - card_transactions.count,
            id: No - card_transactions.count, name: 'No'}, {axisId: Yes - card_transactions.count,
            id: Yes - card_transactions.count, name: 'Yes'}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    note_state: collapsed
    note_display: hover
    note_text: Transactions that occurred between 12am and 4am local time
    listen: {}
    row: 42
    col: 8
    width: 8
    height: 7
  - title: Transactions by Distance from Customer Home
    name: Transactions by Distance from Customer Home
    model: retail_banking
    explore: card_transactions
    type: looker_pie
    fields: [card_transactions.count, card_transactions.transaction_distance_tier]
    fill_fields: [card_transactions.transaction_distance_tier]
    filters:
      card_transactions.is_fraud: 'No'
      card_transactions.transaction_date: 2 weeks
    sorts: [card_transactions.transaction_distance_tier]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    series_colors:
      Yes - card_transactions.count: "#FBBC04"
      1000 or Above: "#EA4335"
      500 to 999: "#FBBC04"
      100 to 499: "#34A853"
      50 to 99: "#4285F4"
      Below 50: "#BDC1C6"
      100 or Above: "#B31412"
      80 to 99: "#EA4335"
      40 to 59: "#34A853"
      20 to 39: "#4285F4"
      Below 20: "#185ABC"
      60 to 79: "#FBBC04"
    series_labels:
      Yes - card_transactions.count: Confirmed Fraudulent
      No - card_transactions.count: Not Confirmed Fraudulent
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: No - card_transactions.count,
            id: No - card_transactions.count, name: 'No'}, {axisId: Yes - card_transactions.count,
            id: Yes - card_transactions.count, name: 'Yes'}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    note_state: collapsed
    note_display: hover
    note_text: Each tier is the percent deviation from the average amount in the category
      that the transaction occurred - for example, if the average spend in the Shopping
      category is $50 then a transaction of $100 is 100% above the average.
    listen: {}
    row: 42
    col: 16
    width: 8
    height: 7
  - title: Flagged Transactions
    name: Flagged Transactions
    model: retail_banking
    explore: card_transactions
    type: single_value
    fields: [card_transactions.total_amount, current_fraud_prediction.predicted_fraud,
      card_transactions.percent_fraudulent_transactions]
    filters:
      card_transactions.transaction_date: 14 days
      current_fraud_prediction.predicted_fraud: 'Yes'
    sorts: [card_transactions.total_amount desc]
    limit: 500
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
    custom_color: ''
    comparison_label: Transactions
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
    note_state: collapsed
    note_display: hover
    note_text: Transactions from past two weeks that were flagged as potential fraud
      by ML model
    listen: {}
    row: 3
    col: 19
    width: 5
    height: 4
  - title: Customers with Possible Fraud
    name: Customers with Possible Fraud
    model: retail_banking
    explore: card_transactions
    type: looker_grid
    fields: [client.client_id, client.name, client.customer_segment, card.type, card.create_date,
      card_transactions.count, current_fraud_prediction.average_predicted_score, predicted_fraud_amount,
      current_fraud_prediction.number_fraud_predictions]
    filters:
      card_transactions.transaction_date: 14 days
    sorts: [predicted_fraud_amount desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: predicted_fraud_amount, based_on: card_transactions.total_amount,
        label: Predicted Fraud Amount, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: "${current_fraud_prediction.predicted_fraud}"}]
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
      card_transactions.count:
        is_active: false
      current_fraud_prediction.number_fraud_predictions:
        is_active: true
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
    row: 49
    col: 0
    width: 24
    height: 8
  filters:
  - name: State
    title: State
    type: field_filter
    default_value: Colorado,Nebraska,New Mexico,Wyoming
    allow_multiple_values: true
    required: false
    model: retail_banking
    explore: card_transactions
    listens_to_filters: []
    field: card_transactions_with_zip.state
