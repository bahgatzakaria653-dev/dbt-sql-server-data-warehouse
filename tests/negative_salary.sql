SELECT employee_id, salary
FROM {{ ref('FACTEmployeeSalary') }}
WHERE salary <= 0
