{% macro logging.setup_run_log_table() -%}
-- create a run log table if not exists
{%- set catalog_schema = var('runlog_schema', default=target.schema) -%}
{%- set run_log_table = var('runlog_table', default='run_log') -%}


{% set sql %}
create table if not exists {{ catalog_schema }}.{{ run_log_table }} (
invocation_id varchar,
model_name varchar,
environment varchar,
status varchar,
started_at timestamp,
completed_at timestamp,
duration_seconds double precision,
row_count bigint,
adapter varchar,
user_name varchar,
extra jsonb
)
;{% endset %}


{{ return(sql) }}
{% endmacro %}