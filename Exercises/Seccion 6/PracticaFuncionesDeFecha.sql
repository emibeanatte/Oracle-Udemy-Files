-- Practica funciones de fecha

-- Indicar el n�mero de d�as que los empleados llevan en la empresa
SELECT HIRE_DATE, FIRST_NAME, SYSDATE - HIRE_DATE AS "D�as trabajados"
FROM EMPLOYEES;

-- � Indicar la fecha que ser� dentro de 15 d�as
SELECT SYSDATE, SYSDATE + 15
FROM DUAL;

--�Cu�ntos MESES faltan para la navidad? La cifra debe salir redondeada, con 1 decimal
SELECT SYSDATE, ROUND(MONTHS_BETWEEN('25-12-2023',SYSDATE),1) AS "Meses para navidad"
FROM DUAL;

-- Indicar la fecha de entrada de un empleado y el �ltimo d�a del mes que entr�
SELECT HIRE_DATE AS "Fecha de entrada", LAST_DAY(HIRE_DATE) AS "Ultimo dia del mes"
FROM EMPLOYEES;


-- � Utilizando la funci�n ROUND, indicar los empleados que entraron en los �ltimos 15 d�as de cada mes
SELECT FIRST_NAME, HIRE_DATE, ROUND(HIRE_DATE,'MONTH') AS "Mes redondeado"
FROM EMPLOYEES
WHERE ROUND(HIRE_DATE,'MONTH') > HIRE_DATE;
