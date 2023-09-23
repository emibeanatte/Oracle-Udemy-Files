/*
  PARTICIONAMIENTO POR RANGO
  
  PARTITION BY RANGE (columna,columna1)
  (
      PARTITION P1 VALUES LESS THAN (10),
      PARTITION P2 VALUES LESS THAN (20),
      PARTITION P3 VALUES LESS THAN (30),
      PARTITION P4 VALUES LESS THAN (MAXVALUE),

      
  
  */

-- ------------------------------------------------------------------------------------------------------- 
-- Crear Tabla particionada de tipo rango.
CREATE TABLE RANGO (	
    CODIGO NUMBER NOT NULL , 
	DATOS VARCHAR2(100)	
) 
PARTITION BY RANGE (codigo)(
      PARTITION P1 VALUES LESS THAN (10),
      PARTITION P2 VALUES LESS THAN (20),
      PARTITION P3 VALUES LESS THAN (30),
      PARTITION P4 VALUES LESS THAN (40)
);
     
SELECT * FROM RANGO;
     
SELECT * FROM user_part_tables;
SELECT * FROM user_tab_partitions WHERE table_name = 'RANGO';
    
-- ------------------------------------------------------------------------------------------------------- 

-- INSERT y SELECT en tablas particionadas
INSERT INTO RANGO VALUES(21,'aaa');

SELECT * FROM RANGO;

SELECT * FROM RANGO PARTITION(p3);

SELECT * FROM RANGO PARTITION(p1);

INSERT INTO RANGO VALUES(8,'fafsdaf');

 
SELECT * FROM RANGO PARTITION(p1);
SELECT * FROM RANGO;
       
SELECT * FROM RANGO WHERE codigo = 21;
         
SELECT * FROM RANGO WHERE codigo > 21;

-- -------------------------------------------------------------------------------------------------------
    
-- Añadir particiones y clausla MAXVALUE   
SELECT * FROM RANGO WHERE datos ='aaaa';
       
INSERT INTO RANGO VALUES (40,'kkkkkk');
       
ALTER TABLE RANGO
ADD PARTITION p5 VALUES LESS THAN (50);

SELECT * FROM user_tab_partitions WHERE table_name = 'RANGO';

INSERT INTO RANGO VALUES (40,'kkkkkk');

SELECT * FROM RANGO PARTITION(p5);
       
       
ALTER TABLE RANGO
ADD PARTITION p6 VALUES LESS THAN (100);
   
       
ALTER TABLE RANGO
ADD PARTITION p7 VALUES LESS THAN (MAXVALUE);

SELECT * FROM user_tab_partitions WHERE table_name = 'RANGO';
              
INSERT INTO RANGO VALUES (40000000,'kkkkkk');

-- ------------------------------------------------------------------------------------------------------- 
        
-- Modificar una fila en particiones
SELECT * FROM RANGO;

UPDATE RANGO SET codigo = 22 WHERE codigo = 21;
        
UPDATE RANGO SET codigo = 7 WHERE codigo = 22;

ALTER TABLE RANGO ENABLE ROW MOVEMENT; -- Permitir que las filas se muevan de particion

-- ------------------------------------------------------------------------------------------------------- 

--Fusionar particiones por rango
SELECT * FROM RANGO PARTITION(p1);
        
SELECT * FROM user_tab_partitions WHERE table_name = 'RANGO'; -- mostrar particiones

-- Fusionar particiones        
ALTER TABLE RANGO MERGE PARTITIONS p3,p4 INTO PARTITION p3_4;
        
ALTER TABLE RANGO MERGE PARTITIONS p1,p6 INTO PARTITION p1_6; --Esto da un error debido a que no son adyacentes
        
ALTER TABLE RANGO MERGE PARTITIONS p5 TO p7 INTO PARTITION p5_6_7;

        
        
        

        
        
        
        
        
        
        