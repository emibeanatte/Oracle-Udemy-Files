-- Practica DML

CREATE TABLE PRODUCTOS
(
 CODIGO NUMBER NOT NULL
, NOMBRE VARCHAR2(100) NOT NULL
, PRECIO NUMBER NOT NULL
, UNIDADES NUMBER
, FECHA_ALTA DATE
);

-- INSERT
-- Insertar datos en la tabla, indicando todas las columnas
INSERT INTO PRODUCTOS (CODIGO,NOMBRE,PRECIO,UNIDADES,FECHA_ALTA) VALUES (1,'tornillos',100,10,'01-09-2017');

-- Insertar datos en la tabla, sin indicar las columnas
INSERT INTO PRODUCTOS VALUES (2,'Tuercas',50,5,'01-10-2009');

-- ¿Este INSERT funciona? No funciona, el precio no puede ser nulo

INSERT INTO PRODUCTOS (CODIGO,NOMBRE,unidades)
VALUES (4,'Arandela',10);

-- INSERT corregido:

INSERT INTO PRODUCTOS (CODIGO,NOMBRE,PRECIO)
VALUES (4,'Arandela',10);

-- Crear la siguiente tabla

CREATE TABLE PRODUCTOS2
(CODE NUMBER,
NAME VARCHAR2(100));

/* Insertar en la tabla PRODUCTOS2 las filas de la tabla PRODUCTOS
que tengan más de 8 unidades. Comprobar las filas */

INSERT INTO PRODUCTOS2 
        SELECT CODIGO, NOMBRE
        FROM PRODUCTOS
        WHERE UNIDADES > 8;
        
/* Modificar el campo NOMBRE de la tabla PRODUCTOS y poner en
mayúsculas el nombre de aquellas filas que valgan más de 50. */
UPDATE PRODUCTOS
SET NOMBRE = UPPER(NOMBRE)
WHERE PRECIO > 50;


/* • Modificar el precio de la tabla productos de aquellas filas cuyo nombre
comienza por ‘T’. Debemos incrementarlo en 5.  */
UPDATE PRODUCTOS
SET PRECIO = PRECIO + 5
WHERE UPPER(NOMBRE) LIKE 'T%';


/* • Borrar las filas de la tabla productos que tengan menos de 10 unidades
o un valor nulo. */
DELETE PRODUCTOS
WHERE UNIDADES < 10 OR UNIDADES IS NULL;


-- Truncar la tabla PRODUCTOS2.

TRUNCATE TABLE PRODUCTOS2;










































