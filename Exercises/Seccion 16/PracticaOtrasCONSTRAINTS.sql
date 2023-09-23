-- Practica Otras constraints, crear tablas de otras, borrar tablas

-- • Crear la siguiente tabla PAISES
CREATE TABLE PAISES (
    COD_PAIS NUMBER PRIMARY KEY,
    NOMBRE VARCHAR2(100) NOT NULL CHECK(NOMBRE = UPPER(NOMBRE))
);


-- Crear la siguiente tabla CIUDADES con las siguientes características
CREATE TABLE CIUDADES (
    COD_CIUDAD NUMBER PRIMARY KEY,
    NOMBRE VARCHAR2(100) NOT NULL CHECK(NOMBRE = UPPER(NOMBRE)),
    POBLACION NUMBER NOT NULL CHECK(POBLACION > 0),
    COD_PAIS NUMBER REFERENCES PAISES(COD_PAIS)
);

-- Insertar una fila en PAISES, por ejemplo 28, ESTADOS UNIDOS
INSERT INTO PAISES VALUES(28,'ESTADOS UNIDOS');

/* Insertar otra fila con el nombre en minúsculas, por ejemplo 29, Francia.
Debe generar un error de CHEK. */
INSERT INTO PAISES VALUES(29,'Francia');

-- Grabar la fila correctamente.
INSERT INTO PAISES VALUES(29,'FRANCIA');

/* Insertar alguna fila en la tabla CIUDADES, por ejemplo (1,NUEVA
YORK,4000000,18) Debe funcionar correctamente porque cumple todas
las constraints */
INSERT INTO CIUDADES VALUES(1,'NUEVA YORK', 4000000,28);

/* Intentar insertar una fila de algún país que no exista. Por ejemplo
(2,ROMA,3000000,40). Debe generar un error ya que el país 40 no
existe en la tabla PAISES */
INSERT INTO CIUDADES VALUES(2,'ROMA',3000000,40);

-- Insertar ITALIA con el código 40 en la tabla PAISES
INSERT INTO PAISES VALUES(40,'ITALIA');

-- Volver a insertar la fila con ROMA. Debería funcionar.
INSERT INTO CIUDADES VALUES(2,'ROMA',3000000,40);

-- Intentar grabar una ciudad con el nombre en minúsculas. Debe generar un error
INSERT INTO CIUDADES VALUES(3,'San Francisco',500000,28);

-- Intentar grabar una ciudad con una población de 0. Debe generar un error
INSERT INTO CIUDADES VALUES(4,'LOS ANGELES',0,28);

-- Insertamos varias ciudades con poblaciones entre 1.000.000 y 5.000.000
INSERT INTO CIUDADES VALUES(3,'SAN FRANCISCO',2000000,28);
INSERT INTO CIUDADES VALUES(4,'LOS ANGELES',3000000,28);
INSERT INTO CIUDADES VALUES(5,'PARIS',5000000,29);

/* Creamos una tabla denominada CIUDADES_PEQUE, basada en
CIUDADES, pero solo con las que tengan una población inferior a 
2.000.000. Lo hacemos mediante la opción de crear una tabla basada en
otra */
CREATE TABLE CIUDADES_PEQUE
AS SELECT *
    FROM CIUDADES
    WHERE POBLACION < 4000000;
    
-- Añadimos la clave primaria a CIUDADES_PEQUE sobre la columna CODIGO
ALTER TABLE CIUDADES_PEQUE
ADD CONSTRAINT PKEY PRIMARY KEY (COD_CIUDAD);

-- Añadimos una nueva columna a la tabla llamada BANDERA de tipo VARCHAR2(100)
ALTER TABLE CIUDADES_PEQUE
ADD (BANDERA VARCHAR2(100));

--  Añadimos alguna fila y comprobamos el resultado
INSERT INTO CIUDADES_PEQUE VALUES(5,'WAHINGTON DC',750000,28,'ESTADOUNIDENSE');

-- Eliminamos la columna BANDERA
ALTER TABLE CIUDADES_PEQUE
DROP (BANDERA);

-- Borramos la tabla CIUDADES_PEQUE
DROP TABLE CIUDADES_PEQUE;
