-- Básicamente LEFT JOIN se queda solo con los datos de la primer tabla y los que tenga en común con la segunda tabla

-- LEFT JOIN muestra todos los registros de la tabla users tengan o no dpi, los que no tienen dpi asignado quedan en NULL
SELECT * FROM hello_mysql.users
LEFT JOIN dpi
ON users.user_id = dpi.user_id;

-- LEFT JOIN que lista todos los nombres con sus respectivos números de dpi, los que están vacios serán NULL
SELECT users.name, dpi.dpi_number FROM users
CASE
	WHEN dpi_number = NULL THEN 'No tiene dpi asignado'
END AS agetext
LEFT JOIN dpi
ON users.user_id = dpi.user_id;

-- LEFT JOIN utilizando WHEN, ELSE, CONCAT y AS para mostrar un campo donde indique el numero de dpi y un texto donde indique que no posee uno
SELECT users.name,
CASE
	WHEN dpi.dpi_number IS NULL THEN 'No tiene dpi asignado'
    ELSE CONCAT(dpi.dpi_number)
END AS '¿DPI?'
FROM users
LEFT JOIN dpi
ON users.user_id = dpi.user_id;