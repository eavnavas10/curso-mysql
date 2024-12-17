-- Básicamente RIGHT JOIN se queda solo con los datos de la segunda tabla y los que tenga en común con la primera tabla
SELECT * FROM users
RIGHT JOIN dpi
ON users.user_id = dpi.user_id;

--RIGHT JOIN en este caso se obtienen todos los dpi no importa si los usuarios no tienen un dpi asignado
SELECT * FROM users
RIGHT JOIN dpi
ON users.user_id = dpi.user_id;

-- RIGHT JOIN en este caso se obtienen todos los lenguajes de progra sin importar si tienen usuarios que los conozcan
SELECT users.name, languages.name FROM users_languages
RIGHT JOIN users ON users_languages.user_id = users.user_id
RIGHT JOIN languages ON users_languages.language_id = languages.language_id;