-- a�adir particiones a la lista y clausula DEFAULT

INSERT INTO LISTA VALUES (2,'USA','CLIENTE2');

ALTER TABLE LISTA ADD PARTITION AMERICA_NORTE VALUES ('USA','CANADA');
    
SELECT * FROM LISTA;
    
SELECT * FROM LISTA PARTITION(AMERICA_NORTE);

-- Particion default de las filas que no pertenecen a las creadas
ALTER TABLE LISTA ADD PARTITION OTROS VALUES(DEFAULT);
    
INSERT INTO LISTA VALUES (3,'NIGERIA','CLIENTE3');
    
SELECT * FROM LISTA PARTITION(OTROS);