{{ 
  config(
    materialized = 'view',
    tags = ['staging', 'loyalty_points']
  ) 
}}

with source as (

    select
        loyalty_id,
        customer_id,
        points_earned,
        transaction_date,
        source
    from {{ source('launchpad_db', 'loyalty_points') }}

),

renamed as (

    select
        loyalty_id          as loyalty_id,
        customer_id         as customer_id,
        points_earned       as points_earned,
        transaction_date    as transaction_date,
        source              as source
    from source

)

select *
from renamed
