{% macro update_avg_order_amount() %}
    {% set query %}
    update {{ ref('cust_rpt') }} as cr
    set avg_order_amount = aoc.AVERAGE_ORDER_AMOUNT
    from {{ ref('average_order_amount_by_customer') }} as aoc
    where cr.customer_id = aoc.customer_id
    {% endset %}
   
    {% do run_query(query) %}
{% endmacro %}