{{ config(materialized='table') }}

select
  c.customer_id,
  count(o.order_id) as total_orders,
  sum(o.total_amount) as lifetime_value
from {{ ref('stg_customers') }} c
left join {{ ref('stg_orders') }} o
  on c.customer_id = o.customer_id
group by 1