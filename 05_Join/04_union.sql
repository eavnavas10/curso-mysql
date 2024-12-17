-- UNION sirve para mostrar todos los registros de ambas tablas, sean nulos o no
SELECT * FROM users
LEFT JOIN dpi
ON users.user_id = dpi.user_id
UNION ALL
SELECT * FROM users
RIGHT JOIN dpi
ON users.user_id = dpi.user_id