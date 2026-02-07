-------------------------------------------------------------------------------------------------
-- KPI Which 5 questions had the largest average negative difference in the main procedure?
-- KPI ¿Cúales 5 preguntas tuvieron la mayor diferencia negativa promedio en el procedimiento 
-- principal?
-------------------------------------------------------------------------------------------------

SELECT
    s.pregunta,
    ROUND(AVG(s.diferencia), 2) AS average_difference
FROM generales g 
JOIN satisfaccion s 
    ON g.encuesta = s.encuesta
WHERE
    g.procedimiento = 'Calificación accidente de trabajo' AND
    s.diferencia < 0
GROUP BY s.pregunta
ORDER BY ROUND(AVG(s.diferencia), 2) ASC
LIMIT 5;