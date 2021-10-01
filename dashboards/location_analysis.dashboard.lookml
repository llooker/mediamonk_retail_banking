- dashboard: retail_banking__brick_and_mortar_decision_dashboard
  title: Brick and Mortar Decision Dashboard
  layout: newspaper
  elements:
  - title: Change - Income per Capita (2011-2017)
    name: Change - Income per Capita (2011-2017)
    model: retail_banking
    explore: acs_changes_2011_2017
    type: looker_map
    fields: [ acs_changes_2011_2017.Zip_Code,  acs_changes_2011_2017.Income_Per_Capita,
       acs_changes_2011_2017.rate_bachelors_degree_or_higher_25_64]
    sorts: [ acs_changes_2011_2017.Income_Per_Capita desc]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: false
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
    map_latitude: 40.67031230812051
    map_longitude: -111.75599813461305
    map_zoom: 9
    map_value_colors: ["#EA4335", "#FBBC04", "#34A853"]
    map_value_scale_clamp_min: -1
    map_value_scale_clamp_max: 10000
    defaults_version: 1
    listen:
      Zip Code:  acs_changes_2011_2017.Zip_Code
    row: 8
    col: 0
    width: 12
    height: 6
  - title: Share of Population (25-64) with Bachelor's degree
    name: Share of Population (25-64) with Bachelor's degree
    model: retail_banking
    explore:  acs_2017_zipcodes
    type: looker_column
    fields: [ acs_2017_zipcodes.Zip_Code,  acs_2017_zipcodes.rate_bachelors_degree_or_higher_25_64]
    filters:
       acs_2017_zipcodes.Population: ">1000"
    sorts: [ acs_2017_zipcodes.rate_bachelors_degree_or_higher_25_64 desc]
    limit: 500
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
    y_axes: [{label: "% of Adults (25-64)", orientation: left, series: [{axisId:  acs_2017_zipcodes.rate_bachelors_degree_or_higher_25_64,
            id:  acs_2017_zipcodes.rate_bachelors_degree_or_higher_25_64, name: Rate
              Bachelors Degree or Higher 25 64}], showLabels: true, showValues: true,
        maxValue: !!null '', unpinAxis: false, tickDensity: default, tickDensityCustom: 47,
        type: linear}]
    series_types: {}
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#7d7d7d",
        line_value: '33.3', label: Utah Avg}]
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
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 1
    listen:
      Zip Code:  acs_2017_zipcodes.Zip_Code
    row: 14
    col: 0
    width: 12
    height: 6
  - title: Banks per 10,000 Residents
    name: Banks per 10,000 Residents
    model: retail_banking
    explore:  acs_2017_zipcodes_and_banks
    type: looker_map
    fields: [ acs_2017_zipcodes_and_banks.Zip_Code,  acs_2017_zipcodes_and_banks.Banks_per_10000_Residents]
    sorts: [ acs_2017_zipcodes_and_banks.Banks_per_10000_Residents desc]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.4
    show_region_field: true
    draw_map_labels_above_data: false
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
    map_latitude: 40.89354823043405
    map_longitude: -111.97276353836061
    map_zoom: 8
    map_value_colors: ["#0D652D", "#34A853", "#E6F4EA"]
    map_value_scale_clamp_min: 1
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 0
    col: 12
    width: 12
    height: 8
  - title: Household Income Distribution
    name: Household Income Distribution
    model: retail_banking
    explore:  acs_2017_zipcodes
    type: looker_column
    fields: [ acs_2017_zipcodes.percent_income_15000_19999,  acs_2017_zipcodes.percent_income_20000_24999,
       acs_2017_zipcodes.percent_income_25000_29999,  acs_2017_zipcodes.percent_income_30000_34999,
       acs_2017_zipcodes.percent_income_35000_39999,  acs_2017_zipcodes.percent_income_40000_44999,
       acs_2017_zipcodes.percent_income_45000_49999,  acs_2017_zipcodes.percent_income_50000_59999,
       acs_2017_zipcodes.percent_income_60000_74999,  acs_2017_zipcodes.percent_income_75000_99999,
       acs_2017_zipcodes.percent_income_100000_124999,  acs_2017_zipcodes.percent_income_125000_149999,
       acs_2017_zipcodes.percent_income_150000_199999,  acs_2017_zipcodes.percent_income_200000_or_More]
    limit: 500
    query_timezone: America/Los_Angeles
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
    point_style: circle
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
      collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
      palette_id: c36094e3-d04d-4aa4-8ec7-bc9af9f851f4
      options:
        steps: 5
        reverse: false
    y_axes: [{label: '', orientation: left, series: [{axisId:  acs_2017_zipcodes.percent_income_15000_19999,
            id:  acs_2017_zipcodes.percent_income_15000_19999, name: '15,000 -
              19,999'}, {axisId:  acs_2017_zipcodes.percent_income_20000_24999,
            id:  acs_2017_zipcodes.percent_income_20000_24999, name: '20,000 -
              24,999'}, {axisId:  acs_2017_zipcodes.percent_income_25000_29999,
            id:  acs_2017_zipcodes.percent_income_25000_29999, name: '25,000 -
              29,999'}, {axisId:  acs_2017_zipcodes.percent_income_30000_34999,
            id:  acs_2017_zipcodes.percent_income_30000_34999, name: '30,000 -
              34,99'}, {axisId:  acs_2017_zipcodes.percent_income_35000_39999,
            id:  acs_2017_zipcodes.percent_income_35000_39999, name: '35,000 -
              39,999'}, {axisId:  acs_2017_zipcodes.percent_income_40000_44999,
            id:  acs_2017_zipcodes.percent_income_40000_44999, name: '40,000 -
              44,999'}, {axisId:  acs_2017_zipcodes.percent_income_45000_49999,
            id:  acs_2017_zipcodes.percent_income_45000_49999, name: '45,000 -
              49,999'}, {axisId:  acs_2017_zipcodes.percent_income_50000_59999,
            id:  acs_2017_zipcodes.percent_income_50000_59999, name: '50,000 -
              59,999'}, {axisId:  acs_2017_zipcodes.percent_income_60000_74999,
            id:  acs_2017_zipcodes.percent_income_60000_74999, name: '60,000 -
              74,999'}, {axisId:  acs_2017_zipcodes.percent_income_75000_99999,
            id:  acs_2017_zipcodes.percent_income_75000_99999, name: '75,000 -
              99,999'}, {axisId:  acs_2017_zipcodes.percent_income_100000_124999,
            id:  acs_2017_zipcodes.percent_income_100000_124999, name: '100,000
              - 124,999'}, {axisId:  acs_2017_zipcodes.percent_income_125000_149999,
            id:  acs_2017_zipcodes.percent_income_125000_149999, name: '125,000
              - 149,999'}, {axisId:  acs_2017_zipcodes.percent_income_150000_199999,
            id:  acs_2017_zipcodes.percent_income_150000_199999, name: '150,000
              - 199,999'}, {axisId:  acs_2017_zipcodes.percent_income_200000_or_More,
            id:  acs_2017_zipcodes.percent_income_200000_or_More, name: '200,000
              or greater'}], showLabels: true, showValues: true, maxValue: !!null '',
        minValue: 0, valueFormat: "#\\%", unpinAxis: false, tickDensity: default,
        tickDensityCustom: 18, type: linear}]
    x_axis_label: 'Range: $15,000 to $200,000+'
    hide_legend: true
    font_size: ''
    label_value_format: "#.#\\%"
    series_types: {}
    series_colors:
       acs_2017_zipcodes.percent_income_15000_19999: "#E8F0FE"
       acs_2017_zipcodes.percent_income_20000_24999: "#E8F0FE"
       acs_2017_zipcodes.percent_income_25000_29999: "#D2E3FC"
       acs_2017_zipcodes.percent_income_30000_34999: "#D2E3FC"
       acs_2017_zipcodes.percent_income_35000_39999: "#B5D0FA"
       acs_2017_zipcodes.percent_income_40000_44999: "#B5D0FA"
       acs_2017_zipcodes.percent_income_45000_49999: "#98BDF9"
       acs_2017_zipcodes.percent_income_50000_59999: "#98BDF9"
       acs_2017_zipcodes.percent_income_60000_74999: "#1A73E8"
       acs_2017_zipcodes.percent_income_75000_99999: "#1A73E8"
       acs_2017_zipcodes.percent_income_100000_124999: "#1967D2"
       acs_2017_zipcodes.percent_income_125000_149999: "#1967D2"
       acs_2017_zipcodes.percent_income_150000_199999: "#174EA6"
       acs_2017_zipcodes.percent_income_200000_or_More: "#174EA6"
    series_labels:
       acs_2017_zipcodes.percent_income_20000_24999: 20,000 - 24,999
       acs_2017_zipcodes.percent_income_30000_34999: 30,000 - 34,99
       acs_2017_zipcodes.percent_income_40000_44999: 40,000 - 44,999
       acs_2017_zipcodes.percent_income_50000_59999: 50,000 - 59,999
       acs_2017_zipcodes.percent_income_75000_99999: 75,000 - 99,999
       acs_2017_zipcodes.percent_income_125000_149999: 125,000 - 149,999
       acs_2017_zipcodes.percent_income_200000_or_More: 200,000 or greater
       acs_2017_zipcodes.percent_income_25000_29999: 25,000 - 29,999
       acs_2017_zipcodes.percent_income_35000_39999: 35,000 - 39,999
       acs_2017_zipcodes.percent_income_45000_49999: 45,000 - 49,999
       acs_2017_zipcodes.percent_income_60000_74999: 60,000 - 74,999
       acs_2017_zipcodes.percent_income_100000_124999: 100,000 - 124,999
       acs_2017_zipcodes.percent_income_150000_199999: 150,000 - 199,999
       acs_2017_zipcodes.percent_income_15000_19999: 15,000 - 19,999
    label_color: ["#5F6368"]
    reference_lines: []
    x_axis_label_rotation: 90
    label_rotation: 360
    column_group_spacing_ratio: 0
    show_dropoff: false
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    up_color: "#81BE56"
    down_color: "#CCC54B"
    total_color: "#55A3B3"
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen:
      Zip Code:  acs_2017_zipcodes.Zip_Code
    row: 20
    col: 0
    width: 24
    height: 6
  - title: Owner-Occupied Home Value Distributions
    name: Owner-Occupied Home Value Distributions
    model: retail_banking
    explore:  acs_2017_zipcodes_and_banks
    type: looker_boxplot
    fields: [ acs_2017_zipcodes_and_banks.owner_occupied_housing_units_lower_value_quartile,
       acs_2017_zipcodes_and_banks.owner_occupied_housing_units_median_value,
       acs_2017_zipcodes_and_banks.owner_occupied_housing_units_upper_value_quartile,
       acs_2017_zipcodes_and_banks.Zip_Code]
    filters: {}
    sorts: [ acs_2017_zipcodes_and_banks.owner_occupied_housing_units_lower_value_quartile
        desc]
    limit: 500
    query_timezone: America/Los_Angeles
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
    color_application:
      collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
      custom:
        id: 3fbb33a3-fabe-b76c-7219-fd6ed8c860a0
        label: Custom
        type: discrete
        colors:
        - "#34A853"
        - "#CCC54B"
        - "#55A3B3"
        - "#F9CB67"
        - "#80CABB"
        - "#FCA33D"
        - "#6877A4"
        - "#7C478E"
        - "#F57237"
        - "#D14242"
        - "#CD3B8A"
        - "#AF71CB"
      options:
        steps: 5
    y_axis_min: []
    y_axis_labels: [Home Value]
    y_axis_value_format: "$###,##0"
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: circle
    series_point_styles:
       acs_2017_zipcodes_and_banks.owner_occupied_housing_units_lower_value_quartile: auto
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
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
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Zip Code:  acs_2017_zipcodes_and_banks.Zip_Code
    row: 14
    col: 12
    width: 12
    height: 6
  - title: Change - Vacant Housing Units for Sales (2011-2017)
    name: Change - Vacant Housing Units for Sales (2011-2017)
    model: retail_banking
    explore:  acs_changes_2011_2017
    type: looker_map
    fields: [ acs_changes_2011_2017.Zip_Code,  acs_changes_2011_2017.vacant_housing_units_for_sale,
       acs_changes_2011_2017.owner_occupied_housing_units_median_value]
    sorts: [ acs_changes_2011_2017.vacant_housing_units_for_sale desc]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: false
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
    reverse_map_value_colors: true
    map_latitude: 40.67100399398882
    map_longitude: -111.87074303627016
    map_zoom: 9
    map_value_colors: ["#EA4335", "#FBBC04", "#34A853"]
    map_value_scale_clamp_min: -300
    map_value_scale_clamp_max: 300
    series_types: {}
    defaults_version: 1
    listen:
      Zip Code:  acs_changes_2011_2017.Zip_Code
    row: 8
    col: 12
    width: 12
    height: 6
  - title: Population by Zip Code
    name: Population by Zip Code
    model: retail_banking
    explore:  acs_2017_zipcodes
    type: looker_map
    fields: [ acs_2017_zipcodes.Population,  acs_2017_zipcodes.Zip_Code]
    sorts: [ acs_2017_zipcodes.Population desc]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: true
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
    reverse_map_value_colors: true
    map_latitude: 40.90130114538435
    map_longitude: -111.69531583786012
    map_zoom: 8
    map_value_colors: ["#0D652D", "#34A853", "#E6F4EA"]
    map_value_scale_clamp_min: 1000
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 12
    height: 8
  filters:
  - name: Zip Code
    title: Zip Code
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: retail_banking
    explore:  acs_2017_zipcodes
    listens_to_filters: []
    field:  acs_2017_zipcodes.Zip_Code
