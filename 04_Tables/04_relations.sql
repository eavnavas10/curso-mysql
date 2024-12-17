-- USO DE LLAVES FORÁNEAS Y REFRENCIAS a otras tablas
CREATE TABLE dpi(
	dpi_id int AUTO_INCREMENT PRIMARY KEY,
    dpi_number INT NOT NULL,
    user_id int,
    UNIQUE(dpi_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id)
);

-- ESTABLECIENDO LA RELACIÓN UNO A MUCHOS (N:M)
CREATE TABLE users_languages(
	users_language_id int AUTO_INCREMENT PRIMARY KEY,
    user_id int,
    language_id int,
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(language_id) REFERENCES languages(language_id),
    UNIQUE (user_id, language_id)
);