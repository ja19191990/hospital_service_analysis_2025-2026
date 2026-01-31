
-- Row count check

SELECT
    'satisfaccion.rows_count' AS check_name,
    CAST(COUNT(*) AS TEXT) AS check_value
FROM satisfaccion

UNION ALL

-- Column count check

SELECT
    'satisfaccion.columns_count' AS check_name,
    CAST(COUNT (*) AS TEXT) AS check_value
FROM INFORMATION_SCHEMA.COLUMNS
WHERE
    TABLE_NAME = 'satisfaccion'

UNION ALL

-- Data type check

SELECT
    'satisfaccion.column_type' || COLUMN_NAME AS check_name,
	CAST(DATA_TYPE AS TEXT) AS check_value
FROM
    INFORMATION_SCHEMA.COLUMNS
WHERE
 TABLE_NAME = 'satisfaccion'

 UNION ALL

-- Check for duplicates

SELECT
    'satisfaccion.encuesta_duplicates' AS check_name,
	CAST(COUNT(*) AS TEXT) AS check_value
FROM (
    SELECT encuesta
    FROM generales
    GROUP BY encuesta
    HAVING COUNT(*) > 22
) d;