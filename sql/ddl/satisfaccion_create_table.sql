-----------------------------------------------------------------------------------------------------------------------
-- Create table 'satisfaccion' from df_sql table
-----------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS satisfaccion;
CREATE TABLE satisfaccion AS
SELECT
    d.encuesta,
	x.pregunta,
	x.expectativa,
	x.percepcion,
	x.diferencia
FROM df_sql d
CROSS JOIN LATERAL(
    VALUES
	    (1, d.e1, d.p1, d.d1),
		(2, d.e2, d.p2, d.d2),
		(3, d.e3, d.p3, d.d3),
		(4, d.e4, d.p4, d.d4),
		(5, d.e5, d.p5, d.d5),
		(6, d.e6, d.p6, d.d6),
		(7, d.e7, d.p7, d.d7),
		(8, d.e8, d.p8, d.d8),
		(9, d.e9, d.p9, d.d9),
		(10, d.e10, d.p10, d.d10),
		(11, d.e11, d.p11, d.d11),
		(12, d.e12, d.p12, d.d12),
		(13, d.e13, d.p13, d.d13),
		(14, d.e14, d.p14, d.d14),
		(15, d.e15, d.p15, d.d15),
		(16, d.e16, d.p16, d.d16),
		(17, d.e17, d.p17, d.d17),
		(18, d.e18, d.p18, d.d18),
		(19, d.e19, d.p19, d.d19),
		(20, d.e20, d.p20, d.d20),
		(21, d.e21, d.p21, d.d21),
		(22, d.e22, d.p22, d.d22)
) AS x(pregunta, expectativa, percepcion, diferencia);

-- Add foreign key on 'encuesta'

ALTER TABLE satisfaccion 
ADD CONSTRAINT fk_satisfaccion_generales
FOREIGN KEY (encuesta)
REFERENCES generales (encuesta);