WITH o AS (SELECT COUNT(*) AS n, SUM(salary) AS total FROM {{ ref('OBT') }}),
f AS (SELECT COUNT(*) AS n, SUM(salary) AS total FROM {{ ref('FACTEmployeeSalary') }})
SELECT o.n AS obt_rows, f.n AS fact_rows, o.total AS obt_total, f.total AS fact_total
FROM o CROSS JOIN f
WHERE o.n <> f.n OR o.total <> f.total
