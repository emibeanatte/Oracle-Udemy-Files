-- Practica Funciones numericas

-- Visualizar el nombre y salario de los empleados de los que el número de empleado es impar (PISTA: MOD)
SELECT FIRST_NAME, SALARY,EMPLOYEE_ID
FROM EMPLOYEES
WHERE MOD(EMPLOYEE_ID,2) <> 0;

/* Prueba con los siguientes valores aplicando las funciones TRUNC y
ROUND, con 1 y 2 decimales.
25.67,0
25.67,1
25.34,1
25.34,2
25.67,-1
*/
SELECT TRUNC(25.67,0), ROUND(25.67,0) FROM DUAL;
SELECT TRUNC(25.67,1), ROUND(25.67,1) FROM DUAL;
SELECT TRUNC(25.34,1), ROUND(25.34,1) FROM DUAL;
SELECT TRUNC(25.34,2), ROUND(25.34,2) FROM DUAL;
SELECT TRUNC(25.67,-1), ROUND(25.67,-1) FROM DUAL;