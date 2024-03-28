{% macro calculate_average_order_value(order_amount_column) %}
        avg({{ order_amount_column }})
{% endmacro %}