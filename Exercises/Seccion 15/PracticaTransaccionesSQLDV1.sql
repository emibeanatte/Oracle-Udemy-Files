-- Practica Transacciones sqldeveloper 1

-- Realizar un insert en la tabla productos
INSERT INTO productos2 (code,name ) VALUES (1,'CLAVOS' );

-- Comprobar que lo podemos ver


-- Volver al primer SqlDeveloper y realizar un commit
COMMIT;

/* Regresemos al primer SqlDeveloper
o Hacer un DELETE de la fila
o Comprobar que se ha borrado
o Realizar un ROLLBACK
o Comprobar que se ha recuperado. */

DELETE PRODUCTOS2
WHERE CODE = 1;

ROLLBACK;


/* Vamos a probar un SAVEPOINT
o Realizamos estas dos operaciones */

INSERT INTO productos2 ( code,name ) VALUES (2,'ARANDELAS' );
INSERT INTO productos2 ( code,name ) VALUES (3,'ESCARPIAS' );

-- Ponemos un SAVEPOINT

SAVEPOINT A;

-- Hacemos ahora esta operación
UPDATE PRODUCTOS2 
SET NAME = 'TORNILLOS' 
WHERE CODE = 3;

-- Realizar una ROLLBACK hasta el SAVEPOINT anterior.
ROLLBACK TO SAVEPOINT A;

-- Hacer un COMMIT
COMMIT;




