-- Practica IS NULL

-- Listar las ciudades de la tabla LOCATIONS no tienen STATE_PROVINCE
SELECT *
FROM LOCATIONS
WHERE STATE_PROVINCE IS NULL;

/* Averiguar el nombre, salario y comisión de aquellos empleados que tienen
comisión. También debemos visualizar una columna calculada denominada
“Sueldo Total”, que sea el sueldo más la comisión */
SELECT FIRST_NAME AS "Nombre", SALARY AS "Salario", COMMISSION_PCT AS "Comisión", (SALARY + (SALARY * COMMISSION_PCT)) AS "Sueldo Total"
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;