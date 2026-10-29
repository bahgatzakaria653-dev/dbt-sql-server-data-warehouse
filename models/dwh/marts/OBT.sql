-- Built from the fact and dimensions so it can never drift from them.
SELECT
    f.employee_id,
    emp.first_name,
    emp.last_name,
    emp.full_name,
    g.gender,
    dt.[date] AS date_of_birth,
    emp.email,
    f.salary,
    d.department,
    c.country

FROM {{ ref('FACTEmployeeSalary') }} AS f
LEFT JOIN {{ ref('DIMEmployee') }} AS emp ON f.employee_id = emp.employee_id
LEFT JOIN {{ ref('DIMDepartment') }} AS d ON f.department_id = d.department_id
LEFT JOIN {{ ref('DIMCountry') }} AS c ON f.country_id = c.country_id
LEFT JOIN {{ ref('DIMGender') }} AS g ON f.gender_id = g.gender_id
LEFT JOIN {{ ref('DIMDate') }} AS dt ON f.dob_date_key = dt.date_key
