-- Ejercicios extraidos de la página web: https://josejuansanchez.org/bd/ejercicios-consultas-sql/index.html#base-de-datos-para-mysql

-- CON OPERADORES BÁSICOS
-- 1. Devuelve un listado con todos los empleados que tiene el departamento de Sistemas. (Sin utilizar INNER JOIN).
SELECT * FROM empleado
WHERE id_departamento = (SELECT id FROM departamento WHERE nombre LIKE 'Sistemas');

-- 2. Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada.
SELECT * FROM departamento
WHERE presupuesto = (SELECT MAX(presupuesto) FROM departamento);

-- 3. Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada.
SELECT * FROM departamento
WHERE presupuesto = (SELECT MIN(presupuesto) FROM departamento);

-- CON ALL Y ANY
-- 4. Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada. Sin hacer uso de MAX, ORDER BY ni LIMIT.
SELECT nombre, presupuesto FROM departamento
WHERE presupuesto >= ALL(SELECT presupuesto FROM departamento);

-- 5. Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada. Sin hacer uso de MIN, ORDER BY ni LIMIT.
SELECT nombre, presupuesto FROM departamento
WHERE presupuesto <= ALL(SELECT presupuesto FROM departamento);

-- 6. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando ALL o ANY).
SELECT * FROM departamento
WHERE id = ANY(SELECT id_departamento FROM empleado);

-- 7. Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando ALL o ANY).
SELECT nombre
FROM departamento
WHERE id NOT IN (
    SELECT id_departamento
    FROM empleado
    WHERE id_departamento IS NOT NULL
);

-- CON IN Y NOT IN
-- 8. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando IN o NOT IN).
SELECT nombre FROM departamento
WHERE id IN (SELECT id_departamento FROM empleado WHERE id_departamento IS NOT NULL);

-- 9. Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando IN o NOT IN).
SELECT nombre
FROM departamento
WHERE id NOT IN (
    SELECT id_departamento
    FROM empleado
    WHERE id_departamento IS NOT NULL
);