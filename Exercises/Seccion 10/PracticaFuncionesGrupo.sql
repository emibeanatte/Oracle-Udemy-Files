-- Practica Funciones de grupo

-- Indicar el n�mero de empleados del departamento 50
SELECT COUNT(*) AS "Empleados"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;

-- Indicar el n�mero de empleados que entraron en el a�o 2007 a trabajar
SELECT COUNT(*) AS "Empleados que ingresaron en 2007"
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE,'YYYY') = '2007';  

-- Indicar la diferencia entre el sueldo m�s alto y al m�nimo
SELECT MAX(SALARY), MIN(SALARY), MAX(SALARY) - MIN(SALARY) AS "Diferencia"
FROM EMPLOYEES;

-- Visualizar la suma del salario del departamento 100
SELECT SUM(SALARY) AS "Salario total del departamento 100"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100;

-- Mostrar el salario medio por departamento, con dos decimales
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY),2) AS "Salario medio"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

-- Mostrar el country_id y el n�mero de ciudades que hay en ese pa�s.
SELECT COUNTRY_ID, COUNT(CITY) AS "Ciudades"
FROM LOCATIONS
GROUP BY COUNTRY_ID;

-- Mostrar el promedio de salario de los empleados por departamento que tengan comisi�n
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY),2) AS "Sueldo promedio"
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
GROUP BY DEPARTMENT_ID;

-- Mostrar los a�os en que ingresaron m�s de 10 empleados
SELECT TO_CHAR(HIRE_DATE,'YYYY'), COUNT(*)
FROM EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE,'YYYY')
HAVING COUNT(EMPLOYEE_ID) > 10;

-- Mostrar por departamento y a�o el n�mero de empleados que ingresaron
SELECT DEPARTMENT_ID, TO_CHAR(HIRE_DATE, 'YYYY'), COUNT(EMPLOYEE_ID) AS "Empleados ingresados"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, TO_CHAR(HIRE_DATE, 'YYYY')
ORDER BY DEPARTMENT_ID;

-- Mostrar los departament_id de los departamentos que tienen managers que tienen a cargo m�s de 5 empleados
SELECT DISTINCT DEPARTMENT_ID, COUNT(EMPLOYEE_ID) AS "Empleados a cargo"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, MANAGER_ID
HAVING COUNT(EMPLOYEE_ID) > 5;



