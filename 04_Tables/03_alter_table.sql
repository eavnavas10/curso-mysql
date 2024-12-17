-- ALTER TABLE + ADD para añadir un nuevo campo
ALTER TABLE persons8
ADD surname varchar(150);

-- RENAME sirve para renombrar columnas
ALTER TABLE persons8
RENAME COLUMN surname to description;

-- MODIFY se utiliza para modificar el tipo de datos de la columna
ALTER TABLE persons8
MODIFY COLUMN description varchar(250);

-- DROP se utiliza para eliminar una columna de una tabla
ALTER TABLE persons8
DROP COLUMN description;

-- ADD CONSTRAINT actualiza un campo para que sea una llave foranea de otro campo de otra tabla
ALTER TABLE users
ADD CONSTRAINT fk_companies
FOREIGN KEY(company_id) REFERENCES companies(company_id)