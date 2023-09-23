-- Practica JOIN

-- Visualizar el nombre del país y el nombre de la región. (tablas COUNTRIES y REGIONS). Usar un natural join
SELECT COUNTRY_NAME, REGION_NAME
FROM COUNTRIES
NATURAL JOIN REGIONS;

-- Usando el ejemplo anterior visualizar también el nombre de la ciudad añadiendo una nueva tabla (LOCATIONS)
SELECT COUNTRY_NAME, REGION_NAME, CITY
FROM COUNTRIES
NATURAL JOIN REGIONS
NATURAL JOIN LOCATIONS;

-- Indicar el nombre del departamento y la media de sus salarios
SELECT DEPARTMENT_NAME, ROUND(AVG(SALARY),2) AS "Media Salarial"
FROM DEPARTMENTS
JOIN EMPLOYEES
    USING (DEPARTMENT_ID)
GROUP BY DEPARTMENT_NAME;

/* Mostrar el nombre del departamento, el del manager a cargo y la ciudad a la
que pertenece. Debemos usar la cláusula ON y/o la cláusula USING para
realizar la operación */
SELECT DEPARTMENT_NAME, FIRST_NAME, CITY
FROM DEPARTMENTS D
JOIN EMPLOYEES E
    ON (E.EMPLOYEE_ID = D.MANAGER_ID)
JOIN LOCATIONS
    USING (LOCATION_ID);

/* Mostrar job_title, el department_name, el last_name de empleado y
hire_date de todos los empleados que entraron entre el 2000 y el 2004.
Usar cláusulas using */
SELECT JOB_TITLE, DEPARTMENT_NAME, LAST_NAME, HIRE_DATE
FROM EMPLOYEES 
JOIN JOBS 
    USING(JOB_ID)
JOIN DEPARTMENTS 
    USING (DEPARTMENT_ID)
WHERE TO_CHAR(HIRE_DATE,'YYYY') >= '2000'
    AND TO_CHAR(HIRE_DATE,'YYYY') <= '2004'
ORDER BY LAST_NAME;

-- • Mostrar el job_title y la media de los salarios de cada uno, siempre que la media supere los 7000
SELECT JOB_TITLE, ROUND(AVG(SALARY),2) AS "Media Salarial"
FROM EMPLOYEES E
JOIN JOBS J
    ON(E.JOB_ID = J.JOB_ID)
GROUP BY JOB_TITLE
HAVING ROUND(AVG(SALARY),2) > 7000;

-- Mostrar el nombre de la región y el número de departamentos en cada una de las regiones
SELECT REGION_NAME, COUNT(*) AS "Numero de Departamentos"
FROM REGIONS
NATURAL JOIN COUNTRIES
NATURAL JOIN LOCATIONS
NATURAL JOIN DEPARTMENTS
GROUP BY REGION_NAME;

-- Mostrar el nombre del empleado, el departamento y el país donde trabaja (debemos usar la cláusula using)
SELECT FIRST_NAME, DEPARTMENT_NAME, COUNTRY_NAME
FROM EMPLOYEES
JOIN DEPARTMENTS
    USING (DEPARTMENT_ID)
JOIN LOCATIONS
    USING(LOCATION_ID)
JOIN COUNTRIES
    USING(COUNTRY_ID);
    
    




    
