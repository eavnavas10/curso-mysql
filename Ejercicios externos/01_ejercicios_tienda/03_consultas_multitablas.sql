-- Ejercicios extraidos de la página web: https://josejuansanchez.org/bd/ejercicios-consultas-sql/index.html#base-de-datos-para-mysql

-- CONSULTAS MULTITABLA INTERNAS (INNER JOIN)

-- 1. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto
JOIN fabricante
ON producto.id_fabricante = fabricante.id;

-- 2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto
JOIN fabricante
ON producto.id_fabricante = fabricante.id
ORDER BY fabricante.nombre ASC;

-- 3. Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT producto.id, producto.nombre, fabricante.id, fabricante.nombre FROM producto
JOIN fabricante
ON producto.id_fabricante = fabricante.id;

-- 4. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto
JOIN fabricante
ON producto.id_fabricante = fabricante.id
ORDER BY producto.precio ASC
LIMIT 1;

-- 5. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto
JOIN fabricante
ON producto.id_fabricante = fabricante.id
ORDER BY producto.precio DESC
LIMIT 1;

-- 6. Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT producto.*, fabricante.nombre FROM producto
JOIN fabricante
ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre = 'Lenovo';

-- 7. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT producto.*, fabricante.nombre FROM producto
JOIN fabricante
ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre = 'Crucial'
AND producto.precio > 200;

-- 8. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
SELECT producto.*, fabricante.nombre FROM producto
JOIN fabricante
ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre = 'Asus'
OR fabricante.nombre = 'Hewlett-Packard'
OR fabricante.nombre = 'Seagate';

-- 9. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
SELECT producto.*, fabricante.nombre FROM producto
JOIN fabricante
ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre IN('Asus','Hewlett-Packard','Seagate');

-- 10. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
SELECT producto.*, fabricante.nombre FROM producto
JOIN fabricante
ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre LIKE '%e';

-- 11. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT producto.*, fabricante.nombre FROM producto
JOIN fabricante
ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre LIKE '%w%';

-- 12. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto
JOIN fabricante
ON producto.id_fabricante = fabricante.id
WHERE producto.precio >= 180
ORDER BY producto.precio DESC,
producto.nombre ASC;

-- 13. Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT DISTINCT fabricante.id, fabricante.nombre FROM fabricante
JOIN producto
ON fabricante.id = producto.id_fabricante;


-- CONSULTAS MULTITABLA EXTERNAS (LEFT AND RIGHT JOIN)

-- 1. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT fabricante.*, producto.nombre FROM fabricante
LEFT JOIN producto
ON fabricante.id = producto.id_fabricante;

-- 2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT fabricante.* FROM producto
RIGHT JOIN fabricante
ON producto.id_fabricante = fabricante.id
WHERE producto.id_fabricante IS NULL;

-- 3. ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.
-- No, no pueden existir productos con el campo id_fabricante vacio pues ese campo se creó como NOT NULL.
