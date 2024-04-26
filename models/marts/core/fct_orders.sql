with source as (
    select * from {{ ref("raw_payments") }}
),

renamed as (
    select
    id as order_id,
    order_id as user_id,
    amount/100 as amount
from source)

select * from renamed
