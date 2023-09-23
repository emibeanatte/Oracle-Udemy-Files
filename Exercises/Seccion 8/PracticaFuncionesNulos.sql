-- Practica Funciones de Nulos

-- • De la tabla LOCATIONS visualizar el nombre de la ciudad y el estadoprovincia. En el caso de que no tenga que aparezca el texto “No tiene”.
SELECT CITY, NVL(STATE_PROVINCE,'No tiene') AS "Estado-Provincia"
FROM LOCATIONS;

/* • Visualizar el salario de los empleados incrementado en la comisión
(PCT_COMMISSION). Si no tiene comisión solo debe salir el salario */
SELECT FIRST_NAME, COMMISSION_PCT, SALARY, NVL2(COMMISSION_PCT,(SALARY + SALARY * COMMISSION_PCT / 100), SALARY) AS "Resultado"
FROM EMPLOYEES;

-- • Seleccionar el nombre del departamento y el manager_id. Si no tiene, debe salir un -1.
SELECT DEPARTMENT_ID, NVL(MANAGER_ID,'-1')
FROM DEPARTMENTS;

-- De la tabla LOCATIONS, devolver NULL si la ciudad y la provincia son iguales. Si no son iguales devolver la CITY.
SELECT CITY, STATE_PROVINCE, NULLIF(CITY,STATE_PROVINCE)
FROM LOCATIONS;