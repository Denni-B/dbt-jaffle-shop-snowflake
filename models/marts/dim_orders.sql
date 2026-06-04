-- load in orders table and select status
with orders as (
    select * from {{ ref('stg_jaffle_shop_orders') }}
),
final as (
    select
        status as order_status
    from orders
    group by 1
)
select * from final