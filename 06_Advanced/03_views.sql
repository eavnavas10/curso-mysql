-- CREATE VIEW: Crea una vista que almacena una consulta, son utilizadas para cuando accedemos constantemente a consultar ciertos datos
CREATE VIEW v_adult_users_age AS
SELECT name, age
FROM users
WHERE age >= 18;

-- Aquí mostramos los datos de la vista
SELECT * FROM v_adult_users_age;

-- DROP VIEW para eliminar una vista
DROP VIEW v_adult_users_age;