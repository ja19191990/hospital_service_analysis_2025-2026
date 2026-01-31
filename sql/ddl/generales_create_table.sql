-----------------------------------------------------------------------------------------------------------------------
-- Create table 'generales' from df_sql table
-----------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS generales CASCADE;
CREATE TABLE generales AS
SELECT
    encuesta,
    edad,
    sexo,
    escolaridad,
    procedimiento,
    rango_edad,
    orden_escolaridad,
    orden_rango_edad
FROM df_sql;

ALTER TABLE generales
ADD CONSTRAINT generales_pk PRIMARY KEY (encuesta);