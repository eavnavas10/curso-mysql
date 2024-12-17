-- Ejercicios extraidos de la página web: https://josejuansanchez.org/bd/ejercicios-consultas-sql/index.html#base-de-datos-para-mysql

-- SUBCONSULTAS

-- CON OPERADORES BÁSICOS DE COMPARACIÓN
-- 1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * FROM producto
WHERE id_fabricante LIKE 
	(SELECT id FROM fabricante WHERE nombre LIKE 'Lenovo');

-- 2. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * FROM producto
WHERE precio = 
	(SELECT MAX(precio) FROM producto WHERE id_fabricante = 
		(SELECT id FROM fabricante WHERE nombre LIKE 'Lenovo'));

-- 3. Lista el nombre del producto más caro del fabricante Lenovo.
SELECT nombre FROM producto
WHERE precio = 
	(SELECT MAX(precio) FROM producto WHERE id_fabricante =
		(SELECT id FROM fabricante WHERE nombre LIKE 'Lenovo'));

-- 4. Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT nombre FROM producto
WHERE precio = 
	(SELECT MIN(precio) FROM producto WHERE id_fabricante =
		(SELECT id FROM fabricante WHERE nombre LIKE 'Hewlett-Packard'));

-- 5. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
SELECT * FROM producto
WHERE precio >= 
	(SELECT MAX(precio) FROM producto WHERE id_fabricante =
		(SELECT id FROM fabricante WHERE nombre LIKE 'Lenovo'));

-- 6. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
SELECT * FROM producto
WHERE precio > 
	(SELECT AVG(precio) FROM producto WHERE id_fabricante = 
		(SELECT id FROM fabricante WHERE nombre LIKE 'Asus') );

-- CON ALL Y ANY
-- 7. Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
SELECT * FROM producto
WHERE precio >= ALL(SELECT precio FROM producto);

-- 8. Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.
SELECT * FROM producto
WHERE precio <= ALL(SELECT precio FROM producto);

-- 9. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).
SELECT nombre FROM fabricante
WHERE id = ANY(SELECT id_fabricante FROM producto);

-- 10. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).
SELECT nombre FROM fabricante
WHERE id != ALL(SELECT id_fabricante FROM producto);

-- CON IN Y NOT IN
-- 11. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
SELECT nombre FROM fabricante
WHERE id IN (SELECT id_fabricante FROM producto);

-- 12. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
SELECT nombre FROM fabricante
WHERE id NOT IN (SELECT id_fabricante FROM producto);

-- CON EXISTS Y NOT EXISTS
-- 13. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT nombre FROM fabricante f 
WHERE EXISTS (
    SELECT 1
    FROM producto p
    WHERE p.id_fabricante = f.id
);

-- 14. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT nombre FROM fabricante f 
WHERE NOT EXISTS (
    SELECT 1
    FROM producto p
    WHERE p.id_fabricante = f.id
);

-- 15. Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
SELECT f.nombre AS fabricante,
       p.nombre AS producto,
       p.precio AS precio
FROM fabricante f
JOIN producto p
ON f.id = p.id_fabricante
WHERE p.precio = (
    SELECT MAX(precio)
    FROM producto
    WHERE id_fabricante = f.id
);

-- 16. Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.
SELECT p.id, p.nombre AS producto, p.precio, f.nombre AS fabricante
FROM producto p
JOIN fabricante f ON p.id_fabricante = f.id
WHERE p.precio >= (
    SELECT AVG(p2.precio)
    FROM producto p2
    WHERE p2.id_fabricante = p.id_fabricante
);

-- 17. Lista el nombre del producto más caro del fabricante Lenovo.
SELECT p.nombre AS producto, p.precio
FROM producto p
JOIN fabricante f ON p.id_fabricante = f.id
WHERE f.nombre = 'Lenovo'
  AND p.precio = (
    SELECT MAX(p2.precio)
    FROM producto p2
    JOIN fabricante f2 ON p2.id_fabricante = f2.id
    WHERE f2.nombre = 'Lenovo'
);

-- CON LA CLAUSULA HAVING
-- 18. Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.
SELECT f.nombre, COUNT(p.id) AS cantidad_productos
FROM fabricante f
LEFT JOIN producto p ON f.id = p.id_fabricante
GROUP BY f.id, f.nombre
HAVING COUNT(p.id) = (
    SELECT COUNT(p2.id)
    FROM producto p2
    JOIN fabricante f2 ON p2.id_fabricante = f2.id
    WHERE f2.nombre = 'Lenovo'
);
