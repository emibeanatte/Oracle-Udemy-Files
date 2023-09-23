-- Practica LIKE

--• Indicar los datos de los empleados cuyo FIRST_NAME empieza por ‘J’
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'J%';

-- Averiguar los empleados que comienzan por ‘S’ y terminan en ‘n’
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'S%n';

-- Indicar los países que tienen una “r” en la segunda letra (Tabla COUNTRIES)
SELECT COUNTRY_NAME
FROM COUNTRIES
WHERE COUNTRY_NAME LIKE '_r%';