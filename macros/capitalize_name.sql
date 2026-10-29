{% macro capitalize_name(first_name, last_name) %}

    CONCAT(
        UPPER(LEFT(TRIM({{ first_name }}), 1)),
        LOWER(SUBSTRING(TRIM({{ first_name }}), 2, LEN(TRIM({{ first_name }})))),
        ' ',
        UPPER(LEFT(TRIM({{ last_name }}), 1)),
        LOWER(SUBSTRING(TRIM({{ last_name }}), 2, LEN(TRIM({{ last_name }}))))
    )

{% endmacro %}