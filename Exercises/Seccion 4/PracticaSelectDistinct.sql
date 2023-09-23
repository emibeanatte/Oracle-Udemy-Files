-- Practica DISTINCT

-- Visualizar las ciudades donde hay departamentos, de la tabla locations. No deben salir repetidos.
SELECT DISTINCT CITY
FROM LOCATIONS;

-- Visualizar los distintos tipos de JOB_ID por departamento de la tabla Employees.
SELECT DISTINCT DEPARTMENT_ID, JOB_ID 
FROM EMPLOYEES;

