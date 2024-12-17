-- Sentencia when que sería como un switch en base de datos, genera una columna donde indica si acaba de cumplir 18 o solo si es mayor de edad
SELECT *,
CASE
	WHEN age > 18 THEN 'Es mayor de edad'
    WHEN age = 18 THEN 'Primer año siendo mayor'
    ELSE 'Es menor de edad'
END AS agetext
FROM users;

-- Sentencia when que sería como un switch en base de datos, genera una columna donde indica si es mayor de edad o no con 0 y 1
SELECT *,
CASE
	WHEN age > 17 THEN True
    ELSE False
END AS '¿Es mayor de edad?'
FROM users;