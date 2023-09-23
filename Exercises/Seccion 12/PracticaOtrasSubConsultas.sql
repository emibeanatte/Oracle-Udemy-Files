-- Practica Otras Subconsultas

/* Seleccionar el nombre, salario y departamento de los empleados que
ganen mas que cualquiera de los salarios máximos de los
departamentos 50, 60 y 70. Usar el operador ANY */
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY > ANY (SELECT MAX(SALARY)
                    FROM EMPLOYEES
                    GROUP BY DEPARTMENT_ID
                    HAVING DEPARTMENT_ID IN (50,60,70));

-- Indicar el nombre de los departamentos cuyo salario medio sea superior a 9000. Usar el operador IN
SELECT DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE DEPARTMENT_ID IN (
    SELECT DEPARTMENT_ID
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
    HAVING AVG(SALARY) > 9000);

/* Indicar el nombre del empleado, el nombre del departamento, el salario
de los empleados que tengan el salario máximo de su departamento.
Ordenado por salario descendentemente. Usar el operador IN */
SELECT FIRST_NAME, DEPARTMENT_NAME, SALARY
FROM EMPLOYEES
JOIN DEPARTMENTS USING(DEPARTMENT_ID)
WHERE SALARY IN (
    SELECT MAX(SALARY)
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID)
ORDER BY SALARY DESC;

-- Realizar la misma consulta anterior pero usando una subconsulta sincronizada
SELECT FIRST_NAME, DEPARTMENT_NAME, SALARY
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
WHERE SALARY IN (
    SELECT MAX(SALARY)
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
    HAVING E.DEPARTMENT_ID = DEPARTMENT_ID)
ORDER BY SALARY DESC;

/* Indicar los datos de los empleados que ganen más que todos los
empleados del departamento 100. Usar el operador ALL */
SELECT *
FROM EMPLOYEES
WHERE SALARY > ALL (
    SELECT SALARY
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID = 100);

-- Mostrar los empleados que tienen el mayor salario de su departamento. Usar subconsultas sincronizadas.
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES E
WHERE SALARY = (
    SELECT MAX(SALARY)
    FROM EMPLOYEES 
    GROUP BY DEPARTMENT_ID
    HAVING DEPARTMENT_ID = E.DEPARTMENT_ID);

-- Visualizar las ciudades en las que haya algún departamento. Debemos usar consultas sincronizadas y el operador EXISTS
SELECT CITY
FROM LOCATIONS L
WHERE EXISTS (
    SELECT *
    FROM DEPARTMENTS
    WHERE LOCATION_ID = L.LOCATION_ID);

--  Visualizar el nombre de las regiones donde no hay departamentos. Usar subconsultas sincronizadas y el operador NOT EXISTS
SELECT REGION_NAME
FROM REGIONS R
WHERE NOT EXISTS (
    SELECT *
    FROM COUNTRIES
    NATURAL JOIN LOCATIONS
    NATURAL JOIN DEPARTMENTS
    WHERE R.REGION_ID = REGION_ID);
