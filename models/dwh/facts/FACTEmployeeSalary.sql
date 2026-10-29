SELECT
    e.employee_id,
    d.department_id,
    c.country_id,
    g.gender_id,
    CONVERT(INT, CONVERT(CHAR(8), e.date_of_birth, 112)) AS dob_date_key,
    e.salary

FROM {{ ref('stg_depi_data') }} AS e

LEFT JOIN {{ ref('DIMDepartment') }} AS d
    ON e.department = d.department

LEFT JOIN {{ ref('DIMCountry') }} AS c
    ON e.country = c.country

LEFT JOIN {{ ref('DIMGender') }} AS g
    ON e.gender = g.gender

WHERE e.employee_id IS NOT NULL
