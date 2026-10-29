SELECT
    CASE
        WHEN DATEDIFF(YEAR, date_of_birth, GETDATE()) < 30 THEN 'under 30'
        WHEN DATEDIFF(YEAR, date_of_birth, GETDATE()) < 40 THEN '30-39'
        WHEN DATEDIFF(YEAR, date_of_birth, GETDATE()) < 50 THEN '40-49'
        ELSE '50+'
    END AS age_band,
    COUNT(*) AS employees,
    AVG(salary) AS avg_salary
FROM {{ ref('OBT') }}
GROUP BY
    CASE
        WHEN DATEDIFF(YEAR, date_of_birth, GETDATE()) < 30 THEN 'under 30'
        WHEN DATEDIFF(YEAR, date_of_birth, GETDATE()) < 40 THEN '30-39'
        WHEN DATEDIFF(YEAR, date_of_birth, GETDATE()) < 50 THEN '40-49'
        ELSE '50+'
    END
