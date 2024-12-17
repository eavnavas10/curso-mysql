-- CREATE TRIGGER genera un trigger (un disparador de eventos)
delimiter |
CREATE TRIGGER tg_email
AFTER UPDATE ON users
FOR EACH ROW
BEGIN
	IF OLD.email <> NEW.email THEN
		INSERT INTO email_history(user_id, email)
		VALUES (OLD.user_id, OLD.email);
    END IF;
END;
delimiter;

-- DROP TRIGGER para eliminar un trigger
DROP TRIGGER tg_email;

-- Hacemos una prueba actualizando el email del usuario con id 5
UPDATE users SET email = 'DiegouVillalobos@gmail.com' WHERE user_id = 5; 