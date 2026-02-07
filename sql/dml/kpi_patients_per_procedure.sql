------------------------------------------------------------------------------------------------
-- KPI How many patients were per procedure?
-- KPI ¿Cuantos pacientes hubo por procedimiento?
------------------------------------------------------------------------------------------------

SELECT
    procedimiento,
    COUNT(encuesta) AS total_pacientes
FROM generales
GROUP BY procedimiento
ORDER BY total_pacientes DESC;
