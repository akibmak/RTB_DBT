{% macro unload_to_stage(stage_name='rtb_stage') %}
    {% set models = [
        'customer_order',
        'total_payment_for_each_order',
        'customer_high_total_payments',
        'order_with_many_payments_methods',
        'Average_Order_Amount_by_Customer'
    ] %}
 
    {% for model_name in models %}
        {% set query %}
            COPY INTO @{{ stage_name }}/{{ model_name }}.csv
            FROM {{ ref(model_name) }}
            FILE_FORMAT = (TYPE = 'CSV' FIELD_DELIMITER = ',' SKIP_HEADER = 1)
            HEADER = TRUE;
        {% endset %}
        {% do run_query(query) %}
    {% endfor %}
{% endmacro %}