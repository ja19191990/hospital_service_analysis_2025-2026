------------------------------------------------------------------------------------------------
-- ¿Qué porcentaje de asistencia tuvo cada procedimiento?
-- What was the percentage by procedure?
------------------------------------------------------------------------------------------------

SELECT
    procedimiento,
    COUNT(encuesta) AS pacientes,
    ROUND(
        COUNT(encuesta) * 100 / SUM(COUNT(encuesta)) OVER(), 
        2
    ) AS pct_asistencia
FROM generales
GROUP BY procedimiento
ORDER BY COUNT(encuesta) DESC;