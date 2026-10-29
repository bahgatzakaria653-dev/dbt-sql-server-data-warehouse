WITH country AS (
    SELECT DISTINCT country
    FROM {{ ref('stg_depi_data') }}
    WHERE country IS NOT NULL
)

SELECT
    {{ surrogate_key("country") }} AS country_id,
    country
FROM country