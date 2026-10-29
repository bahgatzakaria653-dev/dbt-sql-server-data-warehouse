SELECT
    ID AS employee_id,
    TRIM(first_name) AS first_name,
    TRIM(last_name) AS last_name,
    TRIM(gender) AS gender,
    CAST(DOB AS DATE) AS date_of_birth,
    LOWER(TRIM(email)) AS email,
    CAST(REPLACE(TRIM(salary), '$', '') AS DECIMAL(10,2)) AS salary,
    TRIM(department) AS department,
    TRIM(country) AS country
FROM {{ ref('DEPI_data') }}
