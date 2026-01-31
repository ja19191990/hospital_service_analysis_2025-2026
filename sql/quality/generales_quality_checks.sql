
-- Row count check

SELECT
    'generales.rows_count' AS check_name,
    CAST(COUNT(*) AS TEXT) AS check_value
FROM generales

UNION ALL

-- Column count check

SELECT
    'generales.columns_count' AS check_name,
    CAST(COUNT (*) AS TEXT) AS check_value
FROM INFORMATION_SCHEMA.COLUMNS
WHERE
    TABLE_NAME = 'generales'

UNION ALL

-- Data type check

SELECT
    'generales.column_type' || COLUMN_NAME AS check_name,
	CAST(DATA_TYPE AS TEXT) AS check_value
FROM
    INFORMATION_SCHEMA.COLUMNS
WHERE
 TABLE_NAME = 'generales'

 UNION ALL

-- Check for duplicates

SELECT
    'generales.encuesta_duplicates' AS check_name,
	CAST(COUNT(*) AS TEXT) AS check_value
FROM (
    SELECT encuesta
    FROM generales
    GROUP BY encuesta
    HAVING COUNT(*) > 1
) d;