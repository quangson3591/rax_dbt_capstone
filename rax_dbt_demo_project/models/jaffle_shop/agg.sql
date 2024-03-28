{% set columns = ['credit_card_amount', 'coupon_amount', 'bank_transfer_amount', 'gift_card_amount'] %}
with final as (
    select 
    {% for column in columns -%}
        {{ calculate_average_order_value(column) }} as avg_{{column}},
    {% endfor -%}
    sum(amount) as sum_amount
    from {{ref('orders')}}
)
select * from final