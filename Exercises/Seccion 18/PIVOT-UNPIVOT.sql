-- PIVOT

CREATE TABLE PIVOT (
  CODIGO NUMBER,
  CLIENTE NUMBER,
  PRODUCTO VARCHAR2(100),
  CANTIDAD NUMBER
);


INSERT INTO PIVOT VALUES (1, 1, 'AGUACATES', 10);
INSERT INTO PIVOT VALUES (2, 1, 'BANANAS', 20);
INSERT INTO PIVOT VALUES (3, 1, 'MANZANA', 30);
INSERT INTO PIVOT VALUES (4, 2, 'AGUACATES', 40);
INSERT INTO PIVOT VALUES (5, 2, 'MANZANA', 50);
INSERT INTO PIVOT VALUES (6, 3, 'AGUACATES', 60);
INSERT INTO PIVOT VALUES (7, 3, 'BANANAS', 70);
INSERT INTO PIVOT VALUES (8, 3, 'MANZANA', 80);
INSERT INTO PIVOT VALUES (9, 3, 'NARANJA', 90);
INSERT INTO PIVOT VALUES (10, 4, 'AGUACATES', 100);
COMMIT;


SELECT *
FROM (SELECT PRODUCTO, CANTIDAD 
        FROM PIVOT)
PIVOT ( COUNT(CANTIDAD) FOR (PRODUCTO) IN ('AGUACATES','BANANAS','MANZANA','NARANJA'));


-- UNPIVOT

CREATE TABLE UN_PIVOT AS
SELECT *
FROM (SELECT CLIENTE,PRODUCTO, CANTIDAD FROM   pivot)
PIVOT (SUM(CANTIDAD) FOR (PRODUCTO) IN ('AGUACATES' AS "AGUACATES",'BANANAS' AS "BANANAS",'MANZANA' AS "MANZANAS",'NARANJA' AS "NARANJAS"));


SELECT * FROM UN_PIVOT 
UNPIVOT (CANTIDAD FOR PRODUCTO IN ("AGUACATES","BANANAS","MANZANAS","NARANJAS"))
ORDER BY CLIENTE, PRODUCTO;