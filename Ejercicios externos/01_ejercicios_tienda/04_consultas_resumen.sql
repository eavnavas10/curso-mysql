-- Ejercicios extraidos de la página web: https://josejuansanchez.org/bd/ejercicios-consultas-sql/index.html#base-de-datos-para-mysql

-- CONSULTAS RESUMEN

-- 1. Calcula el número total de productos que hay en la tabla productos.
SELECT COUNT(*) FROM producto;

-- 2. Calcula el número total de fabricantes que hay en la tabla fabricante.
SELECT COUNT(*) FROM fabricante;

-- 3. Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla productos.
SELECT COUNT(DISTINCT(producto.id_fabricante)) FROM producto;

-- 4. Calcula la media del precio de todos los productos.
SELECT AVG(producto.precio) FROM producto;

-- 5. Calcula el precio más barato de todos los productos.
SELECT MIN(precio) FROM producto;

-- 6. Calcula el precio más caro de todos los productos.
SELECT MAX(precio) FROM producto;

-- 7. Lista el nombre y el precio del producto más barato.
SELECT nombre, precio FROM producto
WHERE precio = (SELECT MIN(precio) FROM producto);

-- 8. Lista el nombre y el precio del producto más caro.
SELECT nombre, precio FROM producto
WHERE precio = (SELECT MAX(precio) FROM producto);

-- 9. Calcula la suma de los precios de todos los productos.
SELECT SUM(precio) FROM producto;

-- 10. Calcula el número de productos que tiene el fabricante Asus.
SELECT COUNT(*) AS numero_productos_asus
FROM producto
JOIN fabricante
ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre = 'Asus';

-- 11. Calcula la media del precio de todos los productos del fabricante Asus.
SELECT AVG(precio) AS media_precios_asus FROM producto
JOIN fabricante
ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre = 'Asus';

-- 12. Calcula el precio más barato de todos los productos del fabricante Asus.
SELECT MIN(precio) AS precio_menor_asus FROM producto
JOIN fabricante
ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre = 'Asus';

-- 13. Calcula el precio más caro de todos los productos del fabricante Asus.
SELECT MAX(precio) AS precio_mayor_asus FROM producto
JOIN fabricante
ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre = 'Asus';

-- 14. Calcula la suma de todos los productos del fabricante Asus.
SELECT SUM(precio) FROM producto
JOIN fabricante
ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre = 'Asus';

-- 15. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
SELECT MAX(precio), MIN(precio), COUNT(*) FROM producto
JOIN fabricante
ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre = 'Crucial';

-- 16. Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.
SELECT fabricante.nombre AS fabricante, COUNT(producto.id) AS numero_productos
FROM fabricante
LEFT JOIN producto
ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.nombre
ORDER BY numero_productos DESC;

/* 17. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes.
	El resultado mostrará el nombre del fabricante junto con los datos que se solicitan. */
SELECT fabricante.nombre AS 'fabricante',
MIN(producto.precio) AS 'precio_min',
MAX(producto.precio) AS 'precio_max',
AVG(producto.precio) AS 'precio_avg'
FROM fabricante
LEFT JOIN producto
ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.nombre;

/* 18. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que 
	tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el identificador
	del fabricante es suficiente. */
SELECT fabricante.id,
MAX(producto.precio) AS 'precio máximo',
MIN(producto.precio) AS 'precio mínimo',
AVG(producto.precio) AS 'precio medio',
COUNT(producto.id_fabricante)
FROM fabricante
LEFT JOIN producto
ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.id
HAVING AVG(producto.precio) > 200;

/* 19. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de
	productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante. */
SELECT fabricante.id,
fabricante.nombre,
MAX(producto.precio) AS 'precio máximo',
MIN(producto.precio) AS 'precio mínimo',
AVG(producto.precio) AS 'precio medio',
COUNT(producto.id_fabricante) AS 'cantidad productos'
FROM fabricante
LEFT JOIN producto
ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.id
HAVING AVG(producto.precio) > 200;

-- 20. Calcula el número de productos que tienen un precio mayor o igual a 180€.
SELECT COUNT(producto.id) AS 'productos con precio mayor o igual a 180'
FROM producto
WHERE producto.precio >= 180;

-- 21. Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
SELECT fabricante.*,
COUNT(producto.id_fabricante) AS 'cantidad productos >= 180'
FROM fabricante
LEFT JOIN producto
ON fabricante.id = producto.id_fabricante
WHERE producto.precio >= 180
GROUP BY fabricante.id;

-- 22. Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del fabricante.
SELECT fabricante.id,
AVG(producto.precio) AS 'precio_medio'
FROM fabricante
LEFT JOIN producto
ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.id;

-- 23. Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
SELECT fabricante.nombre,
AVG(producto.precio) AS 'precio_medio'
FROM fabricante
LEFT JOIN producto
ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.id;

-- 24. Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
SELECT fabricante.nombre,
AVG(producto.precio)
FROM fabricante
LEFT JOIN producto
ON fabricante.id = producto.id_fabricante
WHERE producto.precio >= 150
GROUP BY fabricante.id;

-- 25. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
SELECT fabricante.nombre,
COUNT(fabricante.id) AS 'productos_totales'
FROM fabricante
INNER JOIN producto
ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.nombre
HAVING COUNT(fabricante.id) >= 2;

/* 26. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno
	con un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen
	productos que cumplan la condición. */
SELECT fabricante.nombre,
COUNT(fabricante.id) AS 'productos_totales'
FROM fabricante
INNER JOIN producto
ON fabricante.id = producto.id_fabricante
WHERE producto.precio >= 220
GROUP BY fabricante.nombre
ORDER BY COUNT(fabricante.id) DESC;

/* 27. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno 
	con un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes,
    es decir, si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá 
    aparecer en el listado con un valor igual a 0 en el número de productos. */
SELECT 
    fabricante.nombre,
    COUNT(CASE WHEN producto.precio >= 220 THEN 1 ELSE NULL END) AS cantidad_productos_220
FROM fabricante
LEFT JOIN producto
ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.nombre;

/* 28. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos 
	es superior a 1000 €. */
SELECT fabricante.nombre,
SUM(producto.precio) AS suma_productos
FROM fabricante
JOIN producto
ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.nombre
HAVING SUM(producto.precio) > 1000;

/* 29. Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres 
	columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente
    de menor a mayor por el nombre del fabricante. */
SELECT 
    f.nombre AS nombre_fabricante,
    p.nombre AS nombre_producto,
    p.precio AS precio_producto
FROM producto p
JOIN fabricante f
ON p.id_fabricante = f.id
WHERE p.precio = (
    SELECT MAX(sub_p.precio)
    FROM producto sub_p
    WHERE sub_p.id_fabricante = f.id
)
ORDER BY f.nombre ASC;
