------------------------------------------------------------------------------------------------
-- ¿Qué rango de edad tuvieron los pacientes?
-- What range of age had the patients?
------------------------------------------------------------------------------------------------

SELECT
    procedimiento,
    COUNT(*) FILTER (WHERE rango_edad = '10s') AS ra_10s,
    COUNT(*) FILTER (WHERE rango_edad = '20s') AS ra_20s,
    COUNT(*) FILTER (WHERE rango_edad = '30s') AS ra_30s,
    COUNT(*) FILTER (WHERE rango_edad = '40s') AS ra_40s,
    COUNT(*) FILTER (WHERE rango_edad = '50s') AS ra_50s,
    COUNT(*) FILTER (WHERE rango_edad = '60s') AS ra_60s
FROM generales
GROUP BY procedimiento;