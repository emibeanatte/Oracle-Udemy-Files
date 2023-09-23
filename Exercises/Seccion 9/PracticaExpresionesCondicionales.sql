-- Practica Expresiones Condicionales

/* Visualizar los siguientes datos con CASE.
o Si el departamento es 50 ponemos Transporte
o Si el departamento es 90 ponemos Dirección
o Cualquier otro número ponemos “Otro departamento” */
SELECT FIRST_NAME, DEPARTMENT_ID,
CASE DEPARTMENT_ID
    WHEN 50 THEN 'Transporte'
    WHEN 90 THEN 'Direccion'
    ELSE 'Otro departamento'
END
FROM EMPLOYEES;

/* Mostrar de la tabla LOCATIONS, la ciudad y el país. Ponemos los
siguientes datos dependiendo de COUNTRY_ID.
o Si es US y CA ponemos América del Norte
o Si es CH, UK, DE,IT ponemos Europa
o Si es BR ponemos América del Sur
o Si no es ninguno ponemos ‘Otra zona’ */
SELECT CITY, COUNTRY_ID,
CASE
    WHEN COUNTRY_ID IN ('US','CA') THEN 'America del Norte'
    WHEN COUNTRY_ID IN ('CH','UK','DE','IT') THEN 'Europa'
    WHEN COUNTRY_ID = 'BR' THEN 'America del Sur'
    ELSE 'Otra Zona'
END AS "Zona"
FROM LOCATIONS;

-- • Realizar el primer ejercicio con DECODE en vez de con CASE
SELECT FIRST_NAME, DEPARTMENT_ID,
DECODE(DEPARTMENT_ID,50,'Transporte',90,'Direccion','Otro Departamento')
FROM EMPLOYEES;