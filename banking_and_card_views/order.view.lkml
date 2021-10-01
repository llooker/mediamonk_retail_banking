view: order {
  label: "Standing Orders"
  sql_table_name: `looker-private-demo.retail_banking.order` ;;
  drill_fields: [order_id]

  dimension: order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_id ;;
    value_format_name: id
  }

  dimension: account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.account_id ;;
    value_format_name: id
  }

  dimension: account_to {
    type: number
    sql: ${TABLE}.account_to ;;
    value_format_name: id
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: bank_to {
    type: string
    sql: ${TABLE}.bank_to ;;
  }

  dimension: category {
    type: string
#     sql: ${TABLE}.category ;;
    case: {
      when: {
        label: "Household"
        sql: ${TABLE}.category = 'household' ;;
      }
      when: {
        label: "Insurance Payment"
        sql: ${TABLE}.category = 'ins_pymt' ;;
      }
      when: {
        label: "Leasing"
        sql: ${TABLE}.category = 'leasing' ;;
      }
      when: {
        label: "Loan Payment"
        sql: ${TABLE}.category = 'loan_payt' ;;
      }
      else: "Unknown"
    }
  }

  measure: number_of_standing_orders {
    type: count
    drill_fields: [order_id, account.account_id]
  }

  measure: total_value_of_standing_orders {
    type: sum
    sql: ${amount} ;;
    value_format_name: eur
  }
}
