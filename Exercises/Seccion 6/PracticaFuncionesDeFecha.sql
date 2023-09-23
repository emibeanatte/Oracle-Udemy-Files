-- Practica funciones de fecha

-- Indicar el número de días que los empleados llevan en la empresa
SELECT HIRE_DATE, FIRST_NAME, SYSDATE - HIRE_DATE AS "Días trabajados"
FROM EMPLOYEES;

-- • Indicar la fecha que será dentro de 15 días
SELECT SYSDATE, SYSDATE + 15
FROM DUAL;

--¿Cuántos MESES faltan para la navidad? La cifra debe salir redondeada, con 1 decimal
SELECT SYSDATE, ROUND(MONTHS_BETWEEN('25-12-2023',SYSDATE),1) AS "Meses para navidad"
FROM DUAL;

-- Indicar la fecha de entrada de un empleado y el último día del mes que entró
SELECT HIRE_DATE AS "Fecha de entrada", LAST_DAY(HIRE_DATE) AS "Ultimo dia del mes"
FROM EMPLOYEES;


-- • Utilizando la función ROUND, indicar los empleados que entraron en los últimos 15 días de cada mes
SELECT FIRST_NAME, HIRE_DATE, ROUND(HIRE_DATE,'MONTH') AS "Mes redondeado"
FROM EMPLOYEES
WHERE ROUND(HIRE_DATE,'MONTH') > HIRE_DATE;
