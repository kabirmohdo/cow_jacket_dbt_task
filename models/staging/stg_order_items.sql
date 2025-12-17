{{ 
  config(
    materialized = 'view',
    tags = ['staging', 'order_items']
  ) 
}}

with source as (

    select
        order_item_id,
        order_id,
        product_id,
        quantity,
        line_total
    from {{ source('launchpad', 'order_items') }}

),

renamed as (

    select
        order_item_id        as order_item_id,
        order_id             as order_id,
        product_id           as product_id,
        quantity             as quantity,
        line_total           as line_total
    from source

)

select *
from renamed
