{% test chk_for_status(model, column_name) %}

    select *
    from {{ model }}
    where {{ column_name }} in ('placed', 'shipped', 'completed', 'return_pending', 'returned')

{% endtest %}