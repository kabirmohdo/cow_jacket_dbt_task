{{ 
  config(
    materialized = 'view',
    tags = ['staging', 'customers']
  ) 
}}

with source as (

    select
        customer_id,
        full_name,
        email,
        join_date
    from {{ source('launchpad', 'customers') }}

),

renamed as (

    select
        customer_id as customer_id,
        full_name as customer_name,
        email as email,
        join_date as join_date
    from source

)

select *
from renamed
