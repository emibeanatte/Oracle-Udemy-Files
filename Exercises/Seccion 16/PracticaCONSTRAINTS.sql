-- Practica crear tablas, CONSTRAINTS PRIMARY-UNIQUE

-- Crear la siguiente tabla usando el comando CREATE TABLE
CREATE TABLE STUDENTS (
    COD_MATRICULA NUMBER,
    NOMBRE VARCHAR2(20 BYTE),
    APELLIDO1 VARCHAR2(20 BYTE),
    APELLIDO2 VARCHAR2(20 BYTE),
    EDAD NUMBER,
    FECHA_MATRICULA DATE
);

-- Comprobar con el comando DESC que existe y que tiene esa estructura
DESC STUDENTS;

-- Crear una tabla denominada CENTROS, con la siguiente estructura
CREATE TABLE CENTROS (
    CODIGO_CENTRO NUMBER,
    NOMBRE VARCHAR2(100),
    PROVINCIA VARCHAR2(100) DEFAULT 'MADRID',
    FECHA_ALTA DATE DEFAULT SYSDATE,
    NUM_ALUMNOS NUMBER DEFAULT 0
);

/* • Insertar una fila que no tenga los tres últimos campos y comprobar que
lo genera de forma automática. */
INSERT INTO CENTROS (CODIGO_CENTRO, NOMBRE) VALUES (1,'MATEMATICAS');


/* Crear la siguiente tabla con las características indicadas
o Tabla CURSOS
? COD_CURSO NUMBER Y CLAVE PRIMARIA
? NOMBRE VARCHAR2(100) NO PUEDE SER NULO Y
DEBE SER ÚNICO
? RESPONSABLE VARCHAR2(100)
*/
CREATE TABLE CURSOS (
    COD_CURSO NUMBER PRIMARY KEY,
    NOMBRE VARCHAR2(100) NOT NULL UNIQUE,
    RESPONSABLE VARCHAR2(100)
);

/* Insertar algunas filas y comprobar que funciona la clave primaria y
la clave única/not null*/

-- Funciona
INSERT INTO CURSOS VALUES (1,'Programacion','Sergio');

-- No funciona
INSERT INTO CURSOS VALUES (2, NULL,'Juan');

INSERT INTO CURSOS VALUES (1,'Testing','Pablo');
