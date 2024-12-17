/* Los indices se suelen utilizar más en bases de datos masivas para agilizar el proceso de realizar consultas a datos que se acceden
    frecuentemente, los mantiene cargados por así decirlo. */

-- CREATE INDEX sirve para crear un indice a una columna de una tabla y acceder de forma más eficiente a esta
CREATE INDEX idx_name_surname ON users(name);

-- CREATE INDEX cree otro indice que permite hacer una consulta a dos campos de la tabla, en este caso nombre y apellido.
CREATE INDEX idx_name_surname ON users(name,surname);

-- DROP INDEX para eliminar un indice
DROP INDEX idx_name ON users;