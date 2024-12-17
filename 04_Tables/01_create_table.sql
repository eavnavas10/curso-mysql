CREATE TABLE test.persons(
    id int,
    name varchar(100),
    age int,
    email varchar(50),
    created date
);

-- NOT NULL restringue que un campo se quede vacío
CREATE TABLE test.persons2(
    id int NOT NULL,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created date
);

-- UNIQUE indica los datos que no se pueden repetir
CREATE TABLE test.persons3(
    id int NOT NULL,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime,
    UNIQUE(id)
);

-- PRIMARY KEY indica cúal es el identificador principal de la tabla
CREATE TABLE test.persons4(
    id int NOT NULL,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime,
    UNIQUE(id),
    PRIMARY KEY(id)
);

-- CHECK restricción que indica cuales son  los datos válidos en un campo
CREATE TABLE test.persons5(
    id int NOT NULL,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime,
    UNIQUE(id),
    PRIMARY KEY(id),
    CHECK(age>=18)
);

-- DEFAULT establece un valor por defecto en un campo y en este caso CURRENT_TIMESTAMP() devuelve la fecha y hora del sistema
CREATE TABLE test.persons6(
    id int NOT NULL,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime DEFAULT CURRENT_TIMESTAMP(),
    UNIQUE(id),
    PRIMARY KEY(id),
    CHECK(age>=18)
);

-- AUTO_INCREMENT le añade +1 al campo que hayamos indicado
CREATE TABLE test.persons7(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime DEFAULT CURRENT_TIMESTAMP(),
    UNIQUE(id),
    PRIMARY KEY(id),
    CHECK(age>=18)
);

-- CREAMOS UNA TABLA DE LENGUAJES
CREATE TABLE languages(
	language_id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(100) NOT NULL
);