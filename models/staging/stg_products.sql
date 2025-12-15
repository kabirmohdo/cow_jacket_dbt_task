{{ 
  config(
    materialized = 'view',
    tags = ['staging', 'products']
  ) 
}}

with source as (

    select
        product_id,
        product_name,
        category,
        price
    from {{ source('launchpad_db', 'products') }}

),

renamed as (

    select
        product_id as product_id,
        product_name as product_name,
        category as category,
        price as price
    from source

)

select *
from renamed
