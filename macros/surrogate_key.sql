{# Deterministic key: depends only on the value, not on which other values exist. #}
{% macro surrogate_key(column) %}
    CONVERT(VARCHAR(32), HASHBYTES('MD5', CAST({{ column }} AS VARCHAR(255))), 2)
{% endmacro %}
