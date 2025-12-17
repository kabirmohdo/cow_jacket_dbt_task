{{ 
  config(
    materialized = 'view',
    tags = ['staging', 'orders']
  ) 
}}

with source as (

    select
        order_id,
        customer_id,
        order_date,
        total_amount
    from {{ source('launchpad', 'orders') }}

),

renamed as (

    select
        order_id            as order_id,
        customer_id         as customer_id,
        order_date          as order_ts,
        total_amount        as total_amount
    from source

)

select *
from renamed
