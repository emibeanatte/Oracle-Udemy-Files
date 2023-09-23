-- Practica BETWEEN-IN

-- Averiguar los empleados que están entre el departamento 40 y el 60
SELECT FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID BETWEEN 40 AND 60;

-- Visualizar los empleados que entraron entre 2002 y 2004
SELECT FIRST_NAME,HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '01-01-02' AND '31-12-04';

-- Indica los apellidos de los empleados que empiezan desde ‘D’ hasta ‘G’;
SELECT LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME BETWEEN 'D' AND 'G';

--Averiguar los empleados de los departamentos 30,60 y 90. Hay que usar la cláusula IN
SELECT FIRST_NAME,DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (30,60,90);

--Averiguar los empleados que tienen el tipo de trabajo IT_PROG y PU_CLERK.
SELECT FIRST_NAME,JOB_ID
FROM EMPLOYEES
WHERE JOB_ID IN ('IT_PROG','PU_CLERK');

--Indica las ciudades que están en Inglaterra (UK) y Japón (JP).. Tabla LOCATIONS
SELECT CITY,COUNTRY_ID
FROM LOCATIONS
WHERE COUNTRY_ID IN ('UK','JP');