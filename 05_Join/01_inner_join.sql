-- INNER JOIN trae todos los datos de la tabla dpi y los concatena a la tabla de users duplicando registros =  n, n*m
SELECT * FROM hello_mysql.users
INNER JOIN dpi

-- INNER JOIN indicando cuales son los campos que relacionarán a los registros de ambas tablas
-- ON indica los campos que tienen en comun y los cuales relacionarán las tablas
SELECT * FROM hello_mysql.users
INNER JOIN dpi
ON users.user_id = dpi.user_id;

-- INNER JOIN como el anterior indicando que el orden será por la edad de forma descendente
SELECT * FROM hello_mysql.users
INNER JOIN dpi
ON users.user_id = dpi.user_id
ORDER BY age DESC;

-- JOIN es interpretado por mysql tambien como INNER JOIN
-- Primero mostrará los datos de la tabla users y luego los datos de la tabla companies que es la que se le incorporó con el JOIN
SELECT * FROM users
JOIN companies
ON users.company_id = companies.company_id;

-- JOIN muestra unicamente los nombres de los usuarios y de las companias correspondientes
SELECT users.name, companies.name FROM users
JOIN companies
ON users.company_id = companies.company_id;

-- JOIN esta sentencia permite concatenar 3 tablas y mostrar qué usuarios saben qué lenguajes
SELECT users.name, languages.name FROM users_languages
JOIN users ON users_languages.user_id = users.user_id
JOIN languages ON users_languages.language_id = languages.language_id;