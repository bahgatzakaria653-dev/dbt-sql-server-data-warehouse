SELECT department, country, COUNT(*) AS employees, AVG(salary) AS avg_salary
FROM {{ ref('OBT') }}
GROUP BY department, country
ORDER BY avg_salary DESC
