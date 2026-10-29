SELECT employee_id, salary
FROM {{ ref('FACTEmployeeSalary') }}
WHERE salary NOT BETWEEN 1000 AND 20000
