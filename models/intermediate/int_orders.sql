{{ config(materialized='view', tags=['intermediate']) }}


select
order_id,
customer_id,
order_ts,
total_amount,
case when total_amount < 0 then 0 else total_amount end as amount_nonnegative
from {{ ref('stg_orders') }}