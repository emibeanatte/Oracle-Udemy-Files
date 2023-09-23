-- Practica Subconsultas

-- • Mostrar los compañeros que trabajan en el mismo departamento que John Chen
SELECT FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID 
                        FROM EMPLOYEES
                        WHERE FIRST_NAME = 'John'
                        AND LAST_NAME = 'Chen');

-- ¿Qué departamentos tienen su sede en Toronto?
SELECT DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE LOCATION_ID = (SELECT LOCATION_ID
                    FROM LOCATIONS
                    WHERE CITY = 'Toronto');

-- • Visualizar los empleados que tengan más de 5 empleados a su cargo. 
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (SELECT MANAGER_ID FROM EMPLOYEES
                    GROUP BY MANAGER_ID
                    HAVING COUNT(*) > 5);

-- ¿En qué ciudad trabaja Guy Himuro?
SELECT CITY
FROM LOCATIONS
JOIN DEPARTMENTS USING(LOCATION_ID)
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID 
                        FROM EMPLOYEES
                        WHERE FIRST_NAME = 'Guy'
                        AND LAST_NAME = 'Himuro');

-- ¿Qué empleados tienen el salario mínimo?
SELECT *
FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY)
                FROM EMPLOYEES);

-- Mostrar los detalles de los departamentos en los cuales el salario máximo sea mayor a 10000.
SELECT *
FROM DEPARTMENTS
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                        FROM EMPLOYEES
                        GROUP BY DEPARTMENT_ID
                        HAVING MAX(SALARY) > 10000);

-- • Indicar los tipos de trabajo de los empleados que entraron en la empresa entre 2002 y 2003
SELECT *
FROM JOBS
WHERE JOB_ID IN (SELECT JOB_ID
                FROM EMPLOYEES
                WHERE TO_CHAR(HIRE_DATE,'YYYY') BETWEEN '2002' AND '2003');
