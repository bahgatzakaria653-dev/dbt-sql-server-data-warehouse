-- Full calendar (1950-2030), not just birth dates.
WITH numbers AS (
    SELECT TOP (DATEDIFF(DAY, '1950-01-01', '2030-12-31') + 1)
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1 AS n
    FROM sys.all_objects AS a
    CROSS JOIN sys.all_objects AS b
),

dates AS (
    SELECT CAST(DATEADD(DAY, n, '1950-01-01') AS DATE) AS [date]
    FROM numbers
)

SELECT
    CONVERT(INT, CONVERT(CHAR(8), [date], 112)) AS date_key,
    [date],
    YEAR([date]) AS [year],
    DATEPART(QUARTER, [date]) AS [quarter],
    MONTH([date]) AS [month],
    DAY([date]) AS [day],
    DATENAME(MONTH, [date]) AS month_name,
    DATENAME(WEEKDAY, [date]) AS day_name,
    CASE WHEN DATENAME(WEEKDAY, [date]) IN ('Saturday', 'Sunday') THEN 1 ELSE 0 END AS is_weekend
FROM dates
