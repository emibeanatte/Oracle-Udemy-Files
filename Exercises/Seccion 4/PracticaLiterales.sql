-- Practica Literales

-- • 1)

SELECT 'El empleado ' || FIRST_NAME || ' del departamento ' || DEPARTMENT_ID || ' tiene un salario de ' || SALARY AS "Datos"
FROM EMPLOYEES;

-- • 2)
SELECT 'La calle ' || STREET_ADDRESS || ' pertenece a la ciudad: ' || CITY AS "Calle y ciudad"
FROM LOCATIONS;
