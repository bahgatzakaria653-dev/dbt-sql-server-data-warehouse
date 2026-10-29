-- Returns a row (= test failure) if row count or total salary differ.
WITH s AS (
    SELECT COUNT(*) AS n, SUM(salary) AS total FROM {{ ref('stg_depi_data') }} WHERE employee_id IS NOT NULL
),
f AS (
    SELECT COUNT(*) AS n, SUM(salary) AS total FROM {{ ref('FACTEmployeeSalary') }}
)
SELECT s.n AS stg_rows, f.n AS fact_rows, s.total AS stg_total, f.total AS fact_total
FROM s CROSS JOIN f
WHERE s.n <> f.n OR s.total <> f.total
