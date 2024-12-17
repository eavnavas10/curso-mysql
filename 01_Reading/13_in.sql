SELECT * FROM users WHERE name IN('Ernesto','Alfonso');     -- Devuelve los usuarios que lleven los nombres Ernesto y Alfonso

SELECT AVG(age) FROM users WHERE user_id IN(1,2,3);     -- Devuelve el promedio de las edades de los usuarios con id 1, 2 y 3