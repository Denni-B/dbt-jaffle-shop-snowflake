-- load in payments table and select payment_method
with payments as (
    select * from {{ ref('stg_stripe_payments') }}
),
final as (
    select
        payment_method,
        status as payment_status
    from payments
    group by 1, 2
)
select * from final