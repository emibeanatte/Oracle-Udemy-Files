-- Practica Otros Joins

-- Indicar el nombre del empleado y el de su jefe (SELF_JOIN de la tabla EMPLOYEES)
SELECT E.FIRST_NAME AS "Empleado", J.LAST_NAME AS "Jefe"
FROM EMPLOYEES E
JOIN EMPLOYEES J
    ON J.EMPLOYEE_ID = E.MANAGER_ID;

/* Indica el DEPARTMENT_NAME y la suma de salarios de ese departamento
ordenados ascendentemente y que aparezcan también los
DEPARTMENT_NAME que no tengan empleados. */
SELECT DEPARTMENT_NAME, SUM(SALARY) AS "Suma de salarios"
FROM EMPLOYEES
RIGHT OUTER JOIN DEPARTMENTS
    USING(DEPARTMENT_ID)
GROUP BY DEPARTMENT_NAME
ORDER BY SUM(SALARY) ASC;

/*  Visualizar la ciudad y el nombre del departamento, incluidas aquellas
ciudades que no tengan departamentos */
SELECT CITY, DEPARTMENT_NAME
FROM LOCATIONS
LEFT JOIN DEPARTMENTS
    USING(LOCATION_ID);

