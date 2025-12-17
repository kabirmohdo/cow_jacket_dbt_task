select order_id
from {{ ref('mart_orders') }}
where order_ts > current_timestamp
