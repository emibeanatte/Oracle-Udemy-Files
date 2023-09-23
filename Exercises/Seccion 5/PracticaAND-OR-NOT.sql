-- Practica AND-OR-NOT

--• Obtener el nombre y la fecha de la entrada y el tipo de trabajo de los empleados que sean IT_PROG y que ganen menos de 6000 dólares
SELECT FIRST_NAME, HIRE_DATE, JOB_ID, SALARY
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG' AND SALARY < 6000;

-- Seleccionar los empleados que trabajen en el departamento 50 o 80, cuyo nombre comience por S y que ganen más de 3000 dólares
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID BETWEEN 50 AND 80
    AND FIRST_NAME LIKE 'S%'
    AND SALARY > 3000;
    
--¿Qué empleados de job_id IT_PROG tienen un prefijo 5 en el teléfono y entraron en la empresa en el año 2007?
SELECT *
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG'
    AND PHONE_NUMBER LIKE '5%'
    AND HIRE_DATE BETWEEN '01-01-07' AND '31-12-07'; 

