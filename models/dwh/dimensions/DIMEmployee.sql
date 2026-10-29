WITH employees AS (
    SELECT DISTINCT
        employee_id,
        first_name,
        last_name,
        email
    FROM {{ ref('stg_depi_data') }}
    WHERE employee_id IS NOT NULL
)

SELECT
    employee_id,
    {{ capitalize_name('first_name', 'last_name') }} AS full_name,
    first_name,
    last_name,
    email
FROM employees
