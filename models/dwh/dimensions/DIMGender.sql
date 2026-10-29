WITH gender AS (
    SELECT DISTINCT gender
    FROM {{ ref('stg_depi_data') }}
    WHERE gender IS NOT NULL
)

SELECT
    {{ surrogate_key("gender") }} AS gender_id,
    gender
FROM gender
