{% macro setup_run_log_table() -%}

  {%- set catalog_schema = var('runlog_schema', target.schema) -%}
  {%- set run_log_table = var('runlog_table', 'run_log') -%}

  {% set sql %}
    create table if not exists {{ target.database }}.{{ catalog_schema }}.{{ run_log_table }} (
      invocation_id varchar,
      model_name varchar,
      environment varchar,
      status varchar,
      started_at timestamp,
      completed_at timestamp,
      duration_seconds double,
      row_count number,
      adapter varchar,
      user_name varchar,
      extra variant
    );
  {% endset %}

  {{ return(sql) }}
{%- endmacro %}
