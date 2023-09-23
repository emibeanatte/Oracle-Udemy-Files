-- CLAUSULA WITH

SELECT E.FIRST_NAME AS "NOMBRE", DC.NUM_EMPLE AS "NUMERO_EMPLEADOS",E.DEPARTMENT_ID
FROM EMPLOYEES E,
    (SELECT DEPARTMENT_ID, COUNT(*) AS "NUM_EMPLE" FROM EMPLOYEES GROUP BY DEPARTMENT_ID) DC
WHERE E.DEPARTMENT_ID = DC.DEPARTMENT_ID;


WITH VIEW_NUM_EMPLO AS
    (SELECT DEPARTMENT_ID, COUNT(*) AS "NUM_EMPLE" FROM EMPLOYEES GROUP BY DEPARTMENT_ID)
SELECT E.FIRST_NAME AS "NOMBRE", DC.NUM_EMPLE AS "NUMERO_EMPLEADOS",E.DEPARTMENT_ID
FROM EMPLOYEES E, VIEW_NUM_EMPLO DC
WHERE E.DEPARTMENT_ID = DC.DEPARTMENT_ID;


WITH SUM_SALARIO AS (SELECT DEPARTMENT_ID,SUM(SALARY) AS "SALARIO_DEPARTAMENTO" FROM EMPLOYEES GROUP BY DEPARTMENT_ID),
     NUM_EMPLE AS (SELECT DEPARTMENT_ID,COUNT(*) AS "NUM_EMPLEADOS" FROM EMPLOYEES GROUP BY DEPARTMENT_ID),
     NUM_EMPLE_TOTAL AS (SELECT COUNT(*) AS "TOTAL_EMPLEADOS" FROM EMPLOYEES)
SELECT DEPARTMENT_NAME, SALARIO_DEPARTAMENTO,NUM_EMPLEADOS,TOTAL_EMPLEADOS
FROM DEPARTMENTS 
NATURAL JOIN SUM_SALARIO 
NATURAL JOIN NUM_EMPLE,NUM_EMPLE_TOTAL;