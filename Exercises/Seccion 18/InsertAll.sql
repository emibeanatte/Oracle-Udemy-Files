-- INSERT ALL

CREATE TABLE NOM_EMPLES (
    COD_EMPLE NUMBER, 
    FIRST_NAME VARCHAR2(100)
);

CREATE TABLE SALARIOS (
COD_EMPLE NUMBER, 
SALARY NUMBER
);


INSERT ALL
   INTO NOM_EMPLES VALUES (EMPLOYEE_ID,FIRST_NAME)
   INTO SALARIOS VALUES (EMPLOYEE_ID,SALARY)
SELECT * FROM EMPLOYEES;


SELECT * FROM NOM_EMPLES;
SELECT * FROM SALARIOS;
