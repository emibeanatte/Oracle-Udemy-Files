-- Practicas Funciones de conversion. TO_CHAR

/* Indicar los empleados que entraron en Mayo en la empresa. Debemos
buscar por la abreviatura del mes */
SELECT FIRST_NAME, HIRE_DATE 
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE,'MON') = 'MAY';

/* Indicar los empleados que entraron en el año 2007 usando la función
to_char */
SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE,'YYYY') = '2007';

--• ¿Qué día de la semana (en letra) era el día que naciste?
SELECT TO_CHAR(TO_DATE('22-01-98'), 'DAY') AS "Dia de nacimiento en texto"
FROM DUAL;

/* Averiguar los empleados que entraron en el mes de Junio. Debemos
preguntar por el mes en letra. Nota: La función TO_CHAR puede
devolver espacios a la derecha) */
SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE RTRIM(TO_CHAR(HIRE_DATE,'MONTH')) = 'JUNIO';

/* Visualizar el salario de los empleados con dos decimales y en dólares y
también en la moneda local (el ejemplo es con euros, suponiendo que el
cambio esté en 0,79$) */
SELECT FIRST_NAME, SALARY, TO_CHAR(SALARY,'$99,999.99') AS "Dolares", TO_CHAR((SALARY * 349.99), 'L999,999,999.99') AS "Moneda local"
FROM EMPLOYEES;




