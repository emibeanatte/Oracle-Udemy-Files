-- Funcion GROUPING

SELECT DEPARTMENT_ID,JOB_ID,SUM(SALARY),GROUPING(DEPARTMENT_ID),GROUPING(JOB_ID)
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY ROLLUP(DEPARTMENT_ID,JOB_ID)
ORDER BY DEPARTMENT_ID, JOB_ID;