{% macro prevent_marts_in_dev() %}
{% set is_dev = target.name in ['dev', 'development'] %}
{% set model_schema = this.schema if this is defined else target.schema %}


{% if is_dev and (model_schema | lower).endswith('_marts') %}
{{ exceptions.raise_compiler_error(
"Guardrail: model '{{ this.identifier if this is defined else 'unknown' }}' is configured to write to a '_marts' schema while running in 'dev'.\n To bypass, set the var('allow_dev_marts', default=false) to true in your environment — but prefer using a staging schema for tests.") }}
{% endif %}
{% endmacro %}