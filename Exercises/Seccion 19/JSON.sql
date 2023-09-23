-- JSON en Oracle SQL

CREATE TABLE PRODUCTOS1 (
  CODIGO INT,
  NOMBRE VARCHAR2(200),
  DATOS JSON
);



INSERT INTO PRODUCTOS1
VALUES (1,'ejemplo1',
'
  {
    "Pais": "Argentina",
    "Ciudad": "Buenos aires",
    "Poblacion": 1000000
  }
');

-- Acceder a los datos mediante notacion por punto

SELECT PROD.DATOS.Pais 
FROM PRODUCTOS1 PROD;

INSERT INTO PRODUCTOS1
VALUES(2,'ejemplo2',
'
    {
        "Pais": "Francia",
        "Ciudad": "Paris",
        "Poblacion": 1500000,
        "Direccion": {
                        "Calle" : "xcxxxx",
                        "Piso" : 5,
                        "Puerta" : "C"   
                      },
        "Telefonos" : [
                        "111-111111",
                        "222-222222"
                       ]
    }
');

SELECT P.DATOS.Direccion.Puerta 
FROM PRODUCTOS1 P;

SELECT P.DATOS.Telefonos[1]
FROM PRODUCTOS1 P;


-- CLAUSULA IS JSON | IS NOT JSON

CREATE TABLE EJEMPLO (
    CODIGO INT,
    FICHERO CLOB
);

INSERT INTO EJEMPLO VALUES(1,'{"columna":"test"}');
INSERT INTO EJEMPLO VALUES(2,'test');
INSERT INTO EJEMPLO VALUES(3,'<h1> Hello World! </h1>');

SELECT *
FROM EJEMPLO
WHERE FICHERO IS JSON;

SELECT * 
FROM EJEMPLO
WHERE FICHERO IS NOT JSON;


-- CLAUSULA JSON_EXISTS

SELECT P.DATOS
FROM PRODUCTOS1 P
WHERE JSON_EXISTS(P.DATOS,'$.Telefonos');

SELECT P.DATOS
FROM PRODUCTOS1 P
WHERE JSON_EXISTS(P.DATOS,'$.Ciudad');


-- FUNCION JSON_VALUE

-- Devuelve un valor de tipo escalar, sobre componentes simples

SELECT JSON_VALUE (P.DATOS,'$.Pais')
FROM PRODUCTOS1 P;


-- JSON_QUERY

-- Recupera un valor complejo


SELECT JSON_QUERY(P.DATOS,'$.Direccion')
FROM PRODUCTOS1 P;

SELECT JSON_QUERY(P.DATOS,'$.Telefonos')
FROM PRODUCTOS1 P;


-- JSON_TABLE

-- Permite convertir datos JSON en formato relacional

SELECT J_PAIS
FROM PRODUCTOS1 P, JSON_TABLE(P.DATOS,'$' COLUMNS(J_PAIS PATH '$.Pais'));

SELECT J_PAIS, J_CIUDAD
FROM PRODUCTOS1 P, JSON_TABLE(P.DATOS, '$' COLUMNS(J_PAIS PATH '$.Pais', J_CIUDAD PATH '$.Ciudad'));



-- JSON_MERGEPATCH

-- Permite modificar un JSON


UPDATE PRODUCTOS1
SET DATOS = JSON_MERGEPATCH(
DATOS,'
{
    "Estado" : false
}')
WHERE CODIGO = 1;

SELECT *
FROM PRODUCTOS1;


-- JSON_TRANSFORM

-- Permite realizar operaciones complejas sobre JSONs.

-- SET

UPDATE PRODUCTOS1
SET DATOS = JSON_TRANSFORM(DATOS, SET '$.Poblacion'=1500000)
WHERE CODIGO = 1;

-- INSERT

SELECT JSON_TRANSFORM(DATOS, INSERT '$.Presidente' = 'Alberto Fernandez')
FROM PRODUCTOS1
WHERE CODIGO = 1;

-- APPEND

SELECT JSON_TRANSFORM(DATOS, APPEND '$.Telefonos' = '333-333333')
FROM PRODUCTOS1
WHERE CODIGO = 2;

-- RENAME 

SELECT JSON_TRANSFORM(DATOS, RENAME '$.Poblacion' = 'Habitantes')
FROM PRODUCTOS1
WHERE CODIGO = 1;

-- REMOVE

SELECT JSON_TRANSFORM(DATOS, REMOVE '$.Habitantes')
FROM PRODUCTOS1
WHERE CODIGO = 1;

-- KEEP

SELECT JSON_TRANSFORM(DATOS, KEEP '$.Direccion.Calle')
FROM PRODUCTOS1
WHERE CODIGO = 2;













































