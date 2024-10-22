/*<!---------------------------------------------------------------------------------------------------------|
|------------------------------------------------------------------------------------------------------------|
| NOMBRE    :  DANNY JOSE JIMENEZ GUTIERREZ                                                                  |
| CEDULA    :  16.029.567                                                                                    |
| TELEFONO  :  0424-281-44-55                                                                                |
| CORREO    :  DENNALY88@GMAIL.COM                                                                           |
|------------------------------------------------------------------------------------------------------------|
|  CURSO    : POSTGRESQL                                                                                     |
|  DESARROLLADOR WEB                                                                                         |
|  MIRANDA , CUA  2024                                                                                       |
-------------------------------------------------------------------------------------------------------------|
----------------------------------------------------------------------------------------------------------->*/


------------------------------------------------------------------------------------------------------------
-- CREAR BASES DE DATOS EN POSTGRESQL                                                                  ----
-----------------------------------------------------------------------------------------------------------

CREATE DATABASE curso;

---------------------------------------------------------------------------------------------------------------
-- ELIMINAR BASE DE DATOS                                                                                  ----
---------------------------------------------------------------------------------------------------------------

DROP DATABASE  if exists "prueba";

----------------------------------------------------------------------------------------------------------------
-- CREAR TABLA                                                                                              ----
----------------------------------------------------------------------------------------------------------------


CREATE TABLE persona(
id_persona int not null,
nombre varchar(40),
cedula varchar(30)
);

--------------------------------------------------------------------------------------------------------------------
-- INSERTAR DATOS A UNA TABLA                                                                                    ---
--------------------------------------------------------------------------------------------------------------------


INSERT INTO persona values('01','Danny','16029567');

INSERT INTO persona(id_persona,nombre,cedula) values('03','Carlos','26548778');


--------------------------------------------------------------------------------------------------------------------------
-- SELECCIONAR DATOS A UNA TABLA                                                                                      ----
--------------------------------------------------------------------------------------------------------------------------

SELECT * FROM persona;


-------------------------------------------------------------------------------------------------------------------------------
-- ACTUALIZAR DATOS A UNA TABLA                                                                                           -----
-------------------------------------------------------------------------------------------------------------------------------


UPDATE persona set nombre= 'Dannny' where id_persona='1';


UPDATE persona set nombre= 'Jose', cedula='16029568' where cedula='27487878';


-------------------------------------------------------------------------------------------------------------------------------------
--                  TIPOS DE DATOS                                                                                               ---
-------------------------------------------------------------------------------------------------------------------------------------

BOOLEAN       = TRUE OR FALSE;
CHARACTER(N)  = CADENA DE CARACTERES;
DATE          = FECHA;
FLOAT         = FLOTANTE;
INT O INTEGER = NUMERO ENTERO;
DECIMAL       = NUMERO EXACTO;
TIME          = TIEMPO EN HORAS, MINUTOS Y SEGUNDOS;
VARCHAR(N)    = CADENA DE CARACTERES DE TAMAÑAO VARIABLE;



-----------------------------------------------------------------------------------------------------------------------------------------
-- CONSULTAS BASE DE DATOS                                                                                                           -----
------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM persona;

SELECT(nombre,cedula)FROM persona;

SELECT(nombre, cedula) as resultados from persona;

SELECT (nombre) as Nombre , cedula from persona;

SELECT nombre from persona where id_persona =1;


------------------------------------------------------------------------------------------------------------------------------------------
-- CONSULTAS CON WHERE Y CONDICIONALES BASE DE DATOS                                                                                   ---
------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM persona where nombre = 'Danny';

SELECT * FROM persona where nombre != 'Danny';

SELECT * FROM persona where id_persona = 2;

SELECT * FROM persona where   id_persona= 2 and nombre ='Jimenez';



--------------------------------------------------------------------------------------------------------------------------------------------
-- BORRAR REGISTROS EN LA BASE DE DATOS                                                                                                  ---
--------------------------------------------------------------------------------------------------------------------------------------------



DELETE FROM persona WHERE nombre = 'Oscar';


-------------------------------------------------------------------------------------------------------------------------------------------
-- MODIFICAR UNA TABLA EN LA BASE DE DATOS                                                                                              ---
----------------------------------------------------------

SELECT *FROM persona;

ALTER TABLE persona ADD COLUMN "apellido" varchar (20);

ALTER TABLE persona RENAME COLUMN apellido to apellidos;

ALTER TABLE persona DROP COLUMN apellidos;


---------------------------------------------------------
-- MODIFICAR UNA TABLA EN LA BASE DE DATOS  ---
----------------------------------------------------------

SELECT *FROM persona;

UPDATE persona SET cedula ='8604122' WHERE id_persona=5;

ALTER TABLE persona ADD COLUMN apellido varchar(20);

ALTER TABLE persona ALTER COLUMN apellido set not null;

ALTER TABLE persona ALTER COLUMN apellido drop not null;

ALTER TABLE persona ALTER COLUMN apellido type integer;


------------------------------------------------------------------
-- PRIMARY KEY EN LA BASE DE DATOS                             ---
------------------------------------------------------------------


ALTER TABLE persona add PRIMARY KEY (id_persona);

CREATE TABLE cliente(
id_cliente int not null,
nombre varchar (20),
apellido varchar(20),
cedula varchar(10),
direccion varchar(20),
telefono varchar(10),
PRIMARY KEY (id_cliente)
);


----------------------------------------------------------------------------
-- AUTOINCREMENTAR EN LA BASE DE DATOS                                   ---
----------------------------------------------------------------------------

CREATE TABLE usuario(
id_usuario serial PRIMARY KEY NOT NULL,
nombre varchar(20),
apellido varchar(20),
cedula integer,
direccion varchar(30),
telefono varchar(30)
);


----------------------------------------------------------------------------------
-- DROP Y TRUNCATE EN LA BASE DE DATOS                                         ---
----------------------------------------------------------------------------------

DROP TABLE personas; -- ELIMINA LA TABLA CON TODO

TRUNCATE TABLE usuario;  --  VACIA LA TABLA MAS NO LA ELIMINA

TRUNCATE TABLE usuario restart identity; -- REINICIA EL CONTADOR DEL ID CUANDO ES SERIAL



------------------------------------------------------------------------------------------
-- DEFAULT EN LA BASE DE DATOS                                                         ---
------------------------------------------------------------------------------------------

 CREATE TABLE usuario(
 id serial PRIMARY KEY NOT NULL,
 nombre varchar(30),
 apellido varchar(30),
 cedula varchar(20),
 telefono varchar(20) DEFAULT 'NO TIENE TELEFONO'
 );

/* DEFAULT HACE QUE CUANDO EL VALOR NO SE INSERTA SE COLOQUE EL VALOR QUE SE COLOQUE EN
    EN ESTE CASO NO TIENE TELEFONO */

-------------------------------------------------------------------------------------------
-- CALCULAR COLUMNAS EN LA BASE DE DATOS                                                ---
-------------------------------------------------------------------------------------------

SELECT nombre, salario, (salario + 800)as Bono FROM nomina;

UPDATE nomina set salario = salario +3000 where  nombre = 'Danny';


-----------------------------------------------------------------------------------------------
-- ORDEN BY EN LA BASE DE DATOS                                                             ---
-----------------------------------------------------------------------------------------------

SELECT * FROM  nomina ORDER BY nombre;

SELECT * FROM  nomina ORDER BY salario asc ;

SELECT * FROM  nomina ORDER BY salario desc;

SELECT * FROM  nomina ORDER BY id desc;

SELECT * FROM  nomina ORDER BY id asc;


-----------------------------------------------------------------------------------------------------
--     LIKE EN LA BASE DE DATOS                                                                 ---
---------------------------------------------------------------------------------------------------

SELECT * FROM  nomina ;

SELECT * FROM  nomina WHERE nombre LIKE '%M%';

SELECT * FROM  nomina WHERE nombre LIKE '%o_%';

---------------------------------------------------------
--     COUNT EN LA BASE DE DATOS                      ---
----------------------------------------------------------



SELECT COUNT(*) FROM nomina ;


SELECT COUNT(nombre) FROM nomina WHERE nombre like '%D%';


---------------------------------------------------------
--     SUM EN LA BASE DE DATOS                        ---
----------------------------------------------------------


SELECT SUM(salario)FROM nomina;

SELECT SUM(salario)FROM nomina WHERE nombre LIKE '%o%';



---------------------------------------------------------
--     AVG EN LA BASE DE DATOS                        ---
----------------------------------------------------------


SELECT AVG (salario)FROM nomina ;

SELECT nombre, AVG(salario) FROM nomina GROUP BY nombre ;


---------------------------------------------------------
--    HAVING EN LA BASE DE DATOS                      ---
----------------------------------------------------------


SELECT nombre, salario FROM nomina WHERE nombre='Jose' GROUP BY nombre, salario HAVING salario > 375;

SELECT nombre, salario FROM nomina WHERE nombre='Jose' GROUP BY nombre, salario HAVING salario > 375 ORDER BY nombre;



---------------------------------------------------------
--    DISTINCT EN LA BASE DE DATOS        ---
----------------------------------------------------------

SELECT DISTINCT nombre FROM nomina;

SELECT COUNT(DISTINCT nombre) FROM nomina;

---------------------------------------------------------
--    BETWENN EN LA BASE DE DATOS        ---
----------------------------------------------------------



SELECT * FROM  nomina WHERE salario BETWEEN 1000 AND 6500 ;

SELECT * FROM  nomina WHERE salario not BETWEEN 1000 AND 6500 ;


---------------------------------------------------------
--    UNIQUE EN LA BASE DE DATOS        ---
----------------------------------------------------------


ALTER TABLE nomina ADD CONSTRAINT UQ_salario UNIQUE (salario);


INSERT INTO nomina(nombre,apellido,cedula,telefono,salario) values('David','Manrique','26548778','0424221212',6500);


---------------------------------------------------------
--    DROP CONSTRAINT EN LA BASE DE DATOS             ---
----------------------------------------------------------

ALTER TABLE nomina DROP CONSTRAINT UQ_salario;


-----------------------------------------------------------
--    FOREIGN KEY (CLAVE FORANEA) EN LA BASE DE DATOS  ---
------------------------------------------------------------



ALTER TABLE nomina ADD CONSTRAINT FKtest FOREIGN KEY(codigo_gerencia) REFERENCES gerencia (codigo);



-----------------------------------------------------------
--    FUNCIONES EN LA BASE DE DATOS                     ---
------------------------------------------------------------

SELECT * FROM  nomina ORDER BY id ASC;

CREATE OR REPLACE FUNCTION SUMA (num1 int, num2 integer) RETURNS INTEGER AS
$$
   SELECT num1+ num2;
$$
LANGUAGE SQL;



SELECT SUMA ('10','8');


-------------------------------------------------------------------------------


CREATE FUNCTION Buscar_Salario(varchar) returns Integer
as
$$

SELECT salario FROM nomina WHERE nombre=$1;

$$

Language SQL


SELECT Buscar_Salario('Danny');


CREATE FUNCTION INSERTARNOMINA() RETURNS VOID AS
$$
INSERT INTO nomina (nombre,apellido,cedula,telefono,salario,codigo_gerencia) VALUES('Juan','Jonas','6314001','04243478787',200,1);
INSERT INTO nomina (nombre,apellido,cedula,telefono,salario,codigo_gerencia) VALUES('Carlos','Luis','7001321','0416221245',350,2);
INSERT INTO nomina (nombre,apellido,cedula,telefono,salario,codigo_gerencia) VALUES('Mariana','Merlo','16029566','0412001212',460,3);
INSERT INTO nomina(nombre,apellido,cedula,telefono,salario,codigo_gerencia) VALUES('Mirta','Uique','2489655','04260010101',2000,4);

$$
Language SQL


SELECT INSERTARNOMINA();


-----------------------------------------------------------
--    CLAUSULA LIMIT EN LA BASE DE DATOS                ---
------------------------------------------------------------

SELECT * FROM  nomina LIMIT 2;

SELECT * FROM  nomina LIMIT 4;

-----------------------------------------------------------
--   TRIGGER EN LA BASE DE DATOS                        ---
------------------------------------------------------------

CREATE TRIGGER actualizar BEFORE UPDATE ON nomina FOR EACH ROW EXECUTE  PROCEDURE disparadores();

UPDATE nomina SET
nombre= 'DANNY',
apellido= 'JIMENEZ',
cedula='16029567',
telefono='04242814455',
salario='8000',
codigo_gerencia='2'
WHERE nombre = 'Danny';

-----------------------------------------------------------
--    OPERADOR IN EN LA BASE DE DATOS                   ---
------------------------------------------------------------

SELECT * FROM  nomina WHERE id IN ('1','2','3');


-----------------------------------------------------------
--    OPERADOR LIMIT Y OFFSET EN LA BASE DE DATOS        ---
------------------------------------------------------------

SELECT * FROM nomina LIMIT 3;

SELECT * FROM nomina LIMIT 3 OFFSET 4;

-----------------------------------------------------------
--                 VIEW BASE DE DATOS                   ---
------------------------------------------------------------


CREATE VIEW view_data AS SELECT nombre,aoellido FROM nomina;



SELECT * FROM view_data;

-----------------------------------------------------------
--                 UNION EN BASE DE DATOS                ---
------------------------------------------------------------



CREATE VIEW VIEW_UNION
AS


SELECT nombre,id from nomina
UNION ALL
SELECT nombre,codigo from gerencia;


SELECT nombre,id, 'NOMINA' AS origen from nomina
UNION ALL
SELECT nombre,codigo, 'GERENCIA' AS origen from gerencia;

SELECT *FROM VIEW_UNION;

------------------------------------------------------------------------
-- INNER JOIN EN BASE DE DATOS  (RELACION ENTRE DOS TABLAS)          ---
------------------------------------------------------------------------


SELECT * FROM nomina
INNER JOIN gerencia
ON nomina.codigo_gerencia = gerencia.codigo;


SELECT * FROM nomina as a1
INNER JOIN gerencia a2
ON a1.codigo_gerencia = a2.codigo;



----------------------------------------------------------------------------------
-- LEFT JOIN EN BASE DE DATOS (RELACION DE LA TABLA DE LA IZQUIERDA)           ---
----------------------------------------------------------------------------------



SELECT * FROM nomina as a1
LEFT JOIN gerencia a2
ON a1.codigo_gerencia = a2.codigo;


---------------------------------------------------------------------------------------------------------------------------
-- RIGHT JOIN EN BASE DE DATOS (RELACION DE LA TABLA DE LA DERECHA)                                                    ---
--------------------------------------------------------------------------------------------------------------------------



SELECT * FROM nomina as a1
RIGHT JOIN gerencia a2
ON a1.codigo_gerencia = a2.codigo;

-------------------------------------------------------------------------------------------------------------------------
--  FULL JOIN EN BASE DE DATOS (RELACION DE LOS DOS LADOS IZQUIERDO Y DERECHO)                                        ---
-------------------------------------------------------------------------------------------------------------------------


SELECT * FROM nomina as a1
FULL JOIN gerencia a2
ON a1.codigo_gerencia = a2.codigo;


----------------------------------------------------------------------------------------------------------------------
--  CROSS JOIN EN BASE DE DATOS (CONSULTA DE COMBINACIONES ENTRE DOS TABLAS )                                      ---
----------------------------------------------------------------------------------------------------------------------

SELECT * FROM nomina;
SELECT * FROM gerencia;


SELECT * FROM nomina as a1 CROSS JOIN gerencia a2 ;

---------------------------------------------------------------------------------------------------------------
--                WITH CHECH OPTION EN BASE DE DATOS                                                        ---
---------------------------------------------------------------------------------------------------------------

SELECT * FROM nomina;
SELECT * FROM gerencia;


CREATE VIEW VIEW_NOMINAS AS
SELECT * FROM "nomina"
WHERE "nombre" = 'Jose'
with check option;


/* ES UN RESTRICION PARA NO PODER INGRESAR WITH CHECK OPTION    */


------------------------------------------------------------------------------------------
-- FUNCIONES MATEMATICAS ABS(X),CBRT(X),CEILING(X),FLOOR(X) EN BASE DE DATOS           ---
------------------------------------------------------------------------------------------



SELECT ABS (-30);

SELECT CBRT(27);

SELECT CEILING(15.33);

SELECT FLOOR (16.58);


-------------------------------------------------------------------------------------------
-- FUNCIONES MATEMATICAS POWER(X,Y),ROUND(X),SIGN(X),SQRT(X) EN BASE DE DATOS           ---
-------------------------------------------------------------------------------------------

SELECT POWER (2,4);

SELECT ROUND (24.822,2);

SELECT SIGN(234);

SELECT SQRT(9);


-------------------------------------------------------------------------------------------
-- FUNCIONES MATEMATICAS MOD(X,Y),PI(X),RANDOM(),TRUNC(X) EN BASE DE DATOS           ---
-------------------------------------------------------------------------------------------

SELECT MOD (33,2);

SELECT PI();

SELECT RANDOM();

SELECT TRUNC(-57.35);


SELECT TRUNC(-18.2222222222222, 2);


-------------------------------------------------------------------------------------------
--  FUNCIONES PARA MANEJAR CADENA DE CARACTERES EN BASE DE DATOS
--  CHAR_LENGTH(STRING)
--- UPPER(STRING)
--- LOWER(STRING)
--- POSITION (STRING IN STRING)
-------------------------------------------------------------------------------------------

SELECT CHAR_LENGTH('HOLA MUNDO');

SELECT UPPER('hola mundo');

SELECT LOWER('Hola Mundo');

SELECT POSITION ('Hola' in 'Hola MUndo');

-------------------------------------------------------------------------------------------
--  FUNCIONES PARA MANEJAR CADENA DE CARACTERES EN BASE DE DATOS
--  SUBSTRING
--- TRIM
-------------------------------------------------------------------------------------------

SELECT SUBSTRING('Hola Danny'from 0 for 6);

SELECT TRIM(' Hola Danny ');

SELECT TRIM(leading '-' from'--Hola Danny--');

SELECT TRIM(trailing '-' from'--Hola Danny--');

SELECT TRIM(both '-' from'--Hola Danny--');


-------------------------------------------------------------------------------------------
--  FUNCIONES PARA MANEJAR CADENA DE CARACTERES EN BASE DE DATOS
--  LTRIM
--- RTRIM
--- SUBSTR
--- LPAD
--- RPAD
-------------------------------------------------------------------------------------------


SELECT LTRIM ('___Hola Danny','_');

SELECT RTRIM  ('___Hola Danny','_');

SELECT SUBSTR('Hola Danny___' , 5,8);

SELECT LPAD('Hola Danny',15,'-');

SELECT RPAD('Hola Danny',15,'-');



-------------------------------------------------------------------------------------------
--  FUNCIONES PARA MANEJAR FECHAS Y TIEMPO EN BASE DE DATOS
-------------------------------------------------------------------------------------------


SELECT current_date;

SELECT current_time;

SELECT current_timestamp;

SELECT extract( year from current_timestamp);

SELECT extract(month from current_timestamp);

SELECT extract(day from current_timestamp);

SELECT extract(hour from current_timestamp);

SELECT extract(century from current_timestamp);

SELECT extract(quarter from current_timestamp);



-------------------------------------------------------------------------------------------
--  REGISTROS NULOS  EN BASE DE DATOS
-------------------------------------------------------------------------------------------


SELECT *FROM "nomina" WHERE "telefono" is null;


SELECT *FROM "nomina" WHERE "telefono" is not null;


-------------------------------------------------------------------------------------------
--  SECUENCIAS EN BASE DE DATOS               
-------------------------------------------------------------------------------------------

CREATE sequence sec_prueba
start with 1 
increment by 20
minvalue 1
maxvalue 100
cycle;

SELECT * FROM "sec_prueba";

SELECT NEXTVAL('sec_prueba');



-------------------------------------------------------------------------------------------
--  SUBCONSULTA EN BASE DE DATOS               
-------------------------------------------------------------------------------------------

SELECT * FROM persona;
SELECT * FROM sueldos;


SELECT "nombre","apellido", "pais", 
(SELECT MAX("monto")as "PRECIO MAXIMO" FROM "sueldos" WHERE "pais"="pais" )
FROM "persona";


SELECT "nombre","apellido","pais" from "persona" WHERE "pais" = (SELECT "pais" from "sueldos" Limit 1);

SELECT "nombre","apellido","pais" from "persona" WHERE "pais" = (SELECT "pais" from "sueldos" ORDER BY "monto"Limit 1);


SELECT "nombre","apellido","pais" from "persona" WHERE "pais" in (SELECT "pais" from sueldos
where "pais" like '%C%');

SELECT "nombre","apellido","pais" from "persona" WHERE "pais" in (SELECT "pais" from sueldos
where "pais" like '%E%');


-------------------------------------------------------------------------------------------
--  VARIABLES EN BASE DE DATOS               
-------------------------------------------------------------------------------------------


DO $$
DECLARE A INT := 4;
        B INT := 4;
		C INT;

BEGIN 

C:=A+B;

RAISE NOTICE 'LA SUMA ES : %' , C; 
END$$;


-------------------------------------------------------------------------------------------
--  CONDICIONAL IF EN BASE DE DATOS               
-------------------------------------------------------------------------------------------


 

DO $$
BEGIN 
IF EXISTS(SELECT "pais" from "sueldos" where "pais" = 'Venezuela')THEN 
RAISE NOTICE 'VENEZOLANO ';
ELSE 
RAISE NOTICE 'VENEZOLANO NO ENCONTRADO';

END IF;

END$$;





-------------------------------------------------------------------------------------------
--  CICLO WHILE EN BASE DE DATOS               
-------------------------------------------------------------------------------------------



SELECT * FROM "sueldos";


DO $$
DECLARE X int := (SELECT COUNT("id") from "sueldos");
        Y int := 0;
        
BEGIN 

WHILE (Y < X)
LOOP
Raise Notice 'PORCENTAJES' , Y ;
Y:=Y+1;
END LOOP;

END$$;


-------------------------------------------------------------------------------------------
--  CASE EN BASE DE DATOS               
-------------------------------------------------------------------------------------------

SELECT * FROM "sueldos";



SELECT pais,monto,
case 
when pais ='Venezuela'then 'Venezolanao'
when pais ='Colombia' then 'Colombiano'
else
'Todo normal'
END AS NACIONALIDAD
from sueldos;



----------------------------------------------------------
CAPITULO VER = 66
----------------------------------------------------------









