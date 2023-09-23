-- Practica Funciones caracter

/* En la tabla LOCATIONS, averiguar las ciudades que son de Canada o
Estados unidos (Country_id=CA o US) y que la longitud del nombre de la
calle sea superior a 15.  */
SELECT CITY, COUNTRY_ID, STREET_ADDRESS
FROM LOCATIONS
WHERE COUNTRY_ID IN ('CA','US')
    AND LENGTH(STREET_ADDRESS) > 15;
    
/* Muestra la longitud del nombre y el salario anual (por 14) para los
empleados cuyo apellido contenga el carácter 'b' después de la 3ª
posición.
 */
 SELECT FIRST_NAME, LENGTH(FIRST_NAME) AS "Longitud", SALARY * 14 AS "Salario anual", LAST_NAME
 FROM EMPLOYEES
 WHERE INSTR(LAST_NAME,'b') > 3;
 
 
 /* Averiguar los empleados que ganan entre 4000 y 7000 euros y que
tienen alguna 'a' en el nombre. (Debemos usar INSTR y da igual que sea
mayúscula que minúsculas) y que tengan comisión. */
SELECT *
FROM EMPLOYEES
WHERE SALARY BETWEEN 4000 AND 7000
    AND INSTR(UPPER(FIRST_NAME),'A')<> 0
    AND COMMISSION_PCT IS NOT NULL;

-- Visualizar las iniciales de nombre y apellidos separados por puntos
SELECT FIRST_NAME, LAST_NAME, SUBSTR(FIRST_NAME,1,1) || '.' || SUBSTR(LAST_NAME,1,1) AS "Iniciales"
FROM EMPLOYEES;

-- Mostrar empleados donde el nombre o apellido comienza con S..
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'S%'
    OR LAST_NAME LIKE 'S%';

/* • Visualizar el nombre del empleado, su salario, y con asteriscos, el
número miles de dólares que gana. Se asocia ejemplo. (PISTA: se
puede usar RPAD. Ordenado por salario */
SELECT FIRST_NAME, SALARY, RPAD('*', SALARY / 1000,'*') AS "Ranking"
FROM EMPLOYEES
ORDER BY SALARY DESC;
