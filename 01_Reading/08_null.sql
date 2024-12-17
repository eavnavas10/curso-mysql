SELECT * FROM users WHERE email IS NULL;        -- Se utiliza IS para indicar que tiene qué mostrar registros con correos vacíos (nulos)

SELECT * FROM users WHERE email IS NOT NULL;         -- Se utiliza IS NOT NULL para indicar que tiene qué mostrar registros con correos

SELECT * FROM users WHERE email IS NOT NULL AND age = 23;       -- Se utiliza IS y ANDpara indicar que tiene qué mostrar registros con correos vacíos (nulos) y de edad 23

SELECT name, surname, IFNULL(age,0) AS 'age' FROM users;        -- Se utiliza para asignarle valores a los nulos, en este caso se les asignó 0