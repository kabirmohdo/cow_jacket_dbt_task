{{
config(
materialized='table',
tags=['marts','write_alt_schema'],
pre_hook=["{{ prevent_marts_in_dev() }}"]
)
}}


{% set base_schema = target.schema %}
{% set alt_schema = (var('marts_schema_override', default=base_schema + '_marts')) %}


{{
config(schema=alt_schema)
}}


/* docs: production-facing wide table for orders, stored in alternate schema */


select
order_id,
customer_id,
order_ts,
amount_nonnegative
from {{ ref('int_orders') }}