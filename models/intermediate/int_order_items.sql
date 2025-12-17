{{ config(materialized='table') }}

select
  order_id,
  sum(quantity) as total_items,
  sum(line_total) as order_revenue
from {{ ref('stg_order_items') }}
group by order_id
