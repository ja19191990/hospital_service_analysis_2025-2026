------------------------------------------------------------------------------------------------
-- ¿Qué porcentaje de los pacientes fueron hombres o mujeres en cada procedimiento?
-- What percentage of the patients were men or women by procedure?
------------------------------------------------------------------------------------------------

SELECT
    procedimiento,
    COUNT(encuesta) AS pacientes,
    COUNT(*) FILTER (WHERE sexo = 'Femenino') AS femenino,
    COUNT(*) FILTER (WHERE sexo = 'Masculino') AS masculino,
    ROUND(
        CAST(COUNT(*) FILTER (WHERE sexo = 'Femenino') AS numeric)
        / COUNT(encuesta) * 100,
        1
    ) AS pct_femenino,
    ROUND(
        CAST(COUNT(*) FILTER (WHERE sexo = 'Masculino') AS numeric)
        / COUNT(encuesta) * 100,
        1
    ) AS pct_masculino
FROM generales
GROUP BY procedimiento
ORDER BY procedimiento;


