-- Prácticas con SELECT

-- Visualizar el nombre y el número de teléfono de los empleados
SELECT FIRST_NAME, PHONE_NUMBER 
FROM EMPLOYEES;

-- Visualizar el nombre y el tipo de trabajo de los empleados (FIRST_NAME, JOB_ID). Debe aparecer en la cabecera NOMBRE Y Tipo de Trabajo.
SELECT FIRST_NAME AS "NOMBRE", JOB_ID AS "Tipo de Trabajo" 
FROM EMPLOYEES;

--Selecciona todas las columnas de la tabla REGIONS
SELECT * 
FROM REGIONS;

--Indicar los nombres de los países de la tabla COUNTRIES
SELECT COUNTRY_NAME 
FROM COUNTRIES;

--Seleccionar las columnas STREET_ADDRESS, CITY, STATE_PROVINCE de la table LOCATIONS. Debemos poner las columnas como dirección, Ciudad y Estado.
SELECT STREET_ADDRESS AS "Direccion", CITY AS "Ciudad", STATE_PROVINCE AS "Estado"
FROM LOCATIONS;