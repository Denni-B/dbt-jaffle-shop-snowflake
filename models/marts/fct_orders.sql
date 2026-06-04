with orders as (
    select * from {{ ref('stg_jaffle_shop_orders') }}
),
payments as (
    select * from {{ ref('stg_stripe_payments') }}
),

payments_orders as (
    select
        order_id,
        sum(amount) as amount
    from payments
    group by 1
),

final as (
    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        orders.status,
        payments_orders.amount
    from orders
    left join payments_orders using (order_id)
)

select * from final