-- Ejercicios extraidos de la página web: https://josejuansanchez.org/bd/ejercicios-consultas-sql/index.html#base-de-datos-para-mysql

-- CONSULTAS MULTITABLA | COMPOSICIÓN INTERNA (INNER JOIN)

-- 1. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
SELECT e.* , d.nombre, d.presupuesto, d.gastos
FROM empleado e
JOIN departamento d
ON e.id_departamento = d.id;

/* 2. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
	Ordena el resultado, en primer lugar por el nombre del departamento (en orden alfabético) y en
    segundo lugar por los apellidos y el nombre de los empleados. */
SELECT e.* , d.nombre, d.presupuesto, d.gastos
FROM empleado e
JOIN departamento d
ON e.id_departamento = d.id
ORDER BY d.nombre ASC,
e.apellido1 ASC,
e.apellido2 ASC,
e.nombre ASC;

/* 3. Devuelve un listado con el identificador y el nombre del departamento,
	solamente de aquellos departamentos que tienen empleados. */
SELECT DISTINCT d.id, d.nombre
FROM departamento d
JOIN empleado e
ON d.id = e.id_departamento;
    
/* 4. Devuelve un listado con el identificador, el nombre del departamento y el valor del presupuesto actual del que dispone,
	solamente de aquellos departamentos que tienen empleados. El valor del presupuesto actual lo puede calcular restando
	al valor del presupuesto inicial (columna presupuesto) el valor de los gastos que ha generado (columna gastos). */    
SELECT DISTINCT d.id, d.nombre, (d.presupuesto - d.gastos) AS presupuesto_actual
FROM departamento d
JOIN empleado e
ON d.id = e.id_departamento;
    
-- 5. Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.
SELECT d.nombre 
FROM departamento d
JOIN empleado e
ON d.id = e.id_departamento
WHERE nif LIKE '38382980M';

-- 6. Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.
SELECT CONCAT(e.nombre,' ',e.apellido1,' ',e.apellido2) AS nombre_completo, d.nombre AS nombre_departamento
FROM departamento d
JOIN empleado e
ON d.id = e.id_departamento
HAVING nombre_completo LIKE '%pepe%';

-- 7. Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.
SELECT e.*
FROM empleado e
JOIN departamento d
ON e.id_departamento = d.id
WHERE d.nombre LIKE 'I+D'
ORDER BY e.nombre ASC;

/* 8. Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D.
	Ordena el resultado alfabéticamente. */
SELECT e.*
FROM empleado e
JOIN departamento d
ON e.id_departamento = d.id
WHERE d.nombre IN('Sistemas','Contabilidad','I+D')
ORDER BY e.nombre ASC;

/* 9. Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto
	entre 100000 y 200000 euros. */
SELECT e.nombre, d.nombre, d.presupuesto
FROM empleado e
JOIN departamento d
ON e.id_departamento = d.id
WHERE d.presupuesto NOT BETWEEN 100000 AND 200000;

/* 10. Devuelve un listado con el nombre de los departamentos donde existe algún empleado cuyo segundo apellido sea NULL.
	Tenga en cuenta que no debe mostrar nombres de departamentos que estén repetidos. */
SELECT DISTINCT d.nombre, e.*
FROM departamento d
JOIN empleado e
ON d.id = e.id_departamento
WHERE e.apellido2 IS NULL;

-- CONSULTAS MULTITABLA | COMPOSICIÓN EXTERNA (LEFT JOIN Y RIGHT JOIN)

/* 1. Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan.
	Este listado también debe incluir los empleados que no tienen ningún departamento asociado. */
SELECT *
FROM empleado e
LEFT JOIN departamento d
ON e.id_departamento = d.id;

-- 2. Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen ningún departamento asociado.
SELECT e.*, d.id
FROM empleado e
LEFT JOIN departamento d
ON e.id_departamento = d.id
WHERE id_departamento IS NULL;

-- 3. Devuelve un listado donde sólo aparezcan aquellos departamentos que no tienen ningún empleado asociado.
SELECT DISTINCT d.*
FROM departamento d
LEFT JOIN empleado e
ON e.id_departamento = d.id
WHERE e.id_departamento IS NULL;

/* 4. Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan.
	El listado debe incluir los empleados que no tienen ningún departamento asociado y los departamentos
    que no tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento. */
SELECT 
    e.id AS empleado_id, 
    e.nombre AS empleado_nombre, 
    e.apellido1, 
    e.apellido2, 
    d.id AS departamento_id, 
    d.nombre AS departamento_nombre, 
    d.presupuesto, 
    d.gastos
FROM empleado e
LEFT JOIN departamento d ON e.id_departamento = d.id

UNION

SELECT 
    e.id AS empleado_id, 
    e.nombre AS empleado_nombre, 
    e.apellido1, 
    e.apellido2, 
    d.id AS departamento_id, 
    d.nombre AS departamento_nombre, 
    d.presupuesto, 
    d.gastos
FROM departamento d
RIGHT JOIN empleado e ON e.id_departamento = d.id

ORDER BY departamento_nombre ASC;

/* 5. Devuelve un listado con los empleados que no tienen ningún departamento asociado y los departamentos
	que no tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento. */
SELECT 
    e.id AS empleado_id, 
    e.nombre AS empleado_nombre, 
    e.apellido1, 
    e.apellido2, 
    d.id AS departamento_id, 
    d.nombre AS departamento_nombre
FROM empleado e
LEFT JOIN departamento d ON e.id_departamento = d.id

UNION

SELECT 
    e.id AS empleado_id, 
    e.nombre AS empleado_nombre, 
    e.apellido1, 
    e.apellido2, 
    d.id AS departamento_id, 
    d.nombre AS departamento_nombre
FROM departamento d
RIGHT JOIN empleado e ON e.id_departamento = d.id

ORDER BY departamento_nombre ASC;