-- Practica: Vistas, indices y secuencias

/* Crear una vista llamada CIUDADES_GRANDES con las ciudades que
tengan m�s de 3.000.000 de habitantes */
CREATE VIEW CIUDADES_GRANDES
AS SELECT *
    FROM CIUDADES
    WHERE POBLACION > 3000000;

-- Comprobar que funciona
SELECT * FROM CIUDADES_GRANDES;

/* � Crear una vista llamada CIUDADES_USA con las ciudades de Estados
Unidos (c�digo 28 seg�n la pr�ctica anterior) */
CREATE VIEW CIUDADES_USA
AS SELECT *
    FROM CIUDADES
    WHERE COD_PAIS = 28;

-- Comprobar que funciona
SELECT * FROM CIUDADES_USA;

-- Borrar las dos vistas
DROP VIEW CIUDADES_GRANDES;
DROP VIEW CIUDADES_USA;

-- Crear un �ndice en la tabla ciudades sobre el nombre de la ciudad
CREATE INDEX CITYINDEX ON CIUDADES (NOMBRE);

/* Crear una secuencia denominada SEQ1, que comience por 1 y que
devuelve n�meros de 5 en cinco. */
CREATE SEQUENCE SEQ1 INCREMENT BY 5
MINVALUE 1;

/* Insertar un par de pa�ses usando la secuencia como clave primaria, en
vez de poner un n�mero directamente */
INSERT INTO PAISES VALUES (SEQ1.NEXTVAL,'ARGENTINA');
INSERT INTO PAISES VALUES (SEQ1.NEXTVAL,'RUSIA');

-- Comprobar el resultado
SELECT * FROM PAISES;
