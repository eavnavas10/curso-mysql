INSERT INTO users (user_id,name,surname) VALUES(11,'Maria','Castillo');  -- Para insertar datos en los campos, se señalan las columnas y se le insertan los valores

-- INSERTANDO dpi's a la tabla de dpi
INSERT INTO dpi(dpi_number,user_id) VALUES(1111,1);
INSERT INTO dpi(dpi_number,user_id) VALUES(2222,2);
INSERT INTO dpi(dpi_number,user_id) VALUES(4444,4);
INSERT INTO dpi(dpi_number) VALUES(3333);

-- INSERTANDO nombres a las compañias de la tabla companies
INSERT INTO companies(name) VALUES('MoureDev');
INSERT INTO companies(name) VALUES('Apple');
INSERT INTO companies(name) VALUES('Google');

-- INSERTANDO identificadores de compañia a usuarios en la tabla users
UPDATE users SET company_id = 1 WHERE user_id = 1;
UPDATE users SET company_id = 2 WHERE user_id = 2;
UPDATE users SET company_id = 3 WHERE user_id = 5;
UPDATE users SET company_id = 1 WHERE user_id = 7;

-- INSERTANDO nombres de lenguajes a la tabla languages
INSERT INTO languages(name) VALUES('Swift');
INSERT INTO languages(name) VALUES('Kotlin');
INSERT INTO languages(name) VALUES('Javascript');
INSERT INTO languages(name) VALUES('Java');
INSERT INTO languages(name) VALUES('Python');
INSERT INTO languages(name) VALUES('C#');
INSERT INTO languages(name) VALUES('COBOL');

-- INSERTANDO registros de los languajes que conocen los usuarios
INSERT INTO users_languages(user_id,language_id) VALUES(1,1);
INSERT INTO users_languages(user_id,language_id) VALUES(1,2);
INSERT INTO users_languages(user_id,language_id) VALUES(1,5);
INSERT INTO users_languages(user_id,language_id) VALUES(2,3);
INSERT INTO users_languages(user_id,language_id) VALUES(2,5);
