WITH department AS (
    SELECT DISTINCT department
    FROM {{ ref('stg_depi_data') }}
    WHERE department IS NOT NULL
)

SELECT
    {{ surrogate_key("department") }} AS department_id,
    department
FROM department