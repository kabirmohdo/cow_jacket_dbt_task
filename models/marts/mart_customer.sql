{{ 
  config(
    materialized='table',
    schema = target.name == 'prod' and 'analytics_marts' or none
  ) 
}}

select *
from {{ ref('int_customer_orders') }}
