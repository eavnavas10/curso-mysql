SELECT name,init_date AS 'Fecha de inicio en programación' FROM users WHERE age BETWEEN 20 AND 30;      -- Permite colocarle un alias a la columna de la tabla

SELECT CONCAT(name,' ',surname) AS 'Nombre completo' FROM users;        -- Permite concatenar columnas, texto y darle un nombre personalizado a la columna
