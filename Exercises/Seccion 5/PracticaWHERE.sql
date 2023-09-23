-- Practica WHERE

-- Averigua los empleados que trabajen en el departamento 100
SELECT FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100;

/* Usando la tabla LOCATIONS, averigua el nombre de la Ciudad (city) y la
dirección (Street_address) de los departamentos situados en Estados Unidos
(COUNTRY_ID=US) */
SELECT CITY, STREET_ADDRESS, COUNTRY_ID
FROM LOCATIONS
WHERE COUNTRY_ID = 'US';

-- Visualiza los países que están en la región 3. (REGION_ID de la tabla COUNTRIES
SELECT COUNTRY_NAME, REGION_ID
FROM COUNTRIES
WHERE REGION_ID = 3;

-- Averiguar el nombre y salario de los empleados que NO tengan como jefe al MANAGER 114 (columna MANAGER_ID)
SELECT FIRST_NAME, SALARY, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID NOT LIKE 114;

-- Visualizar los empleados que empezaron a trabajar a partir del año 2006
SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >= '01-01-06';

--Seleccionar los empleados que tenga como tipo de trabajo ‘ST_CLERK’
SELECT FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID = 'ST_CLERK';

-- Indicar los datos de los empleados que tengan como apellidos “Smith” (LAST_NAME)
SELECT *
FROM EMPLOYEES
WHERE LAST_NAME = 'Smith';