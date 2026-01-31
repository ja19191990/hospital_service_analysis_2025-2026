-----------------------------------------------------------------------------------------------------------------------
-- VIEW How is the average patient in each procedure?
-----------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW vw_average_patient_per_procedure AS
WITH caracteristica_comun AS (
    SELECT
        procedimiento,
        escolaridad,
        sexo,
        COUNT(*) AS freq,
        ROW_NUMBER() OVER (
            PARTITION BY procedimiento
            ORDER BY COUNT(*) DESC
        ) AS rn
    FROM generales
    GROUP BY procedimiento, escolaridad, sexo
)
SELECT
    g.procedimiento,
    ROUND(AVG(g.edad), 0) AS average_age,
    cm.escolaridad AS main_education,
    cm.sexo AS main_sex,
    ROUND(AVG(s.expectativa), 3) AS average_expectative,
    ROUND(AVG(s.percepcion), 3) AS average_perception,
    ROUND(AVG(s.diferencia), 3) AS average_difference
FROM generales g
JOIN satisfaccion s
    ON g.encuesta = s.encuesta
JOIN caracteristica_comun cm
    ON g.procedimiento = cm.procedimiento
   AND cm.rn = 1
GROUP BY
    g.procedimiento,
    cm.escolaridad,
    cm.sexo
ORDER BY g.procedimiento;