-- CREATE PROCEDURE genera un proceso para posteriormente ser utilizado
DELIMITER //
CREATE PROCEDURE p_all_users()
BEGIN
	SELECT * FROM users;
END//

-- CALL llama al procedo almacenado
CALL p_all_users;

-- CREATE PROCEDURE aquí creamos un procedimiento almacenado que recibe un valor y lo examina para realizar una consulta
DELIMITER //
CREATE PROCEDURE p_age_users(IN age_param int)
BEGIN
	SELECT * FROM users WHERE age = age_param;
END//

-- CALL para llamar al procedimiento almacenado enviandole el parámetro de 30, como si se tratase de una función
CALL p_age_users(24);

-- DROP PROCEDURE para eliminar un procedimiento
DROP PROCEDURE p_age_users;