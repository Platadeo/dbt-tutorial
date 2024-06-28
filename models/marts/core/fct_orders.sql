with source as (
    select * from {{ ref("raw_payments") }}
),
payments as (
    select * from {{ ref("raw_orders") }}
),

renamed as (
    select
    order_id as id,
    amount/100 as amount
from source),

customer as (
    select
    user_id as customer_id,
    id as id
from payments),

final as(
    select
    id,
    customer_id,
    amount
    from renamed
    join customer using (id) 
    )
select * from final
