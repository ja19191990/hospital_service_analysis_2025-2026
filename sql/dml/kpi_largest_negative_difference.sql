------------------------------------------------------------------------------------------------
-- KPI Which 5 questions had the largest average postive difference?
-- KPI ¿Cúales 5 preguntas tuvieron la mayor diferencia positiva promedio?
------------------------------------------------------------------------------------------------

SELECT
    pregunta,
    ROUND(AVG(diferencia), 3) AS average_difference
FROM satisfaccion
WHERE diferencia < 0
GROUP BY pregunta
ORDER BY ROUND(AVG(diferencia), 3) ASC
LIMIT 5;