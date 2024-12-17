SELECT name FROM users ORDER_BY age;       -- Muestra los nombres de la tabla por orden de edad

SELECT * FROM users ORDER BY age;       -- Muestra todos los registros de la tabla users por orden de edad por defecto es de forma ascendente

SELECT * FROM users ORDER BY age ASC;   -- ascendente
SELECT * FROM users ORDER BY age DESC;  -- descendente

SELECT * FROM users WHERE email = 'ernestonavas10@outlook.com' ORDER BY age DESC;       -- Aplicando el where con un correo en especifico