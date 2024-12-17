-- Ejercicios extraidos de la página web: https://josejuansanchez.org/bd/ejercicios-consultas-sql/index.html#base-de-datos-para-mysql

-- 1. Calcula la suma del presupuesto de todos los departamentos.
SELECT SUM(presupuesto) FROM departamento;

-- 2. Calcula la media del presupuesto de todos los departamentos.
SELECT AVG(presupuesto) FROM departamento;

-- 3. Calcula el valor mínimo del presupuesto de todos los departamentos.
SELECT MIN(presupuesto) FROM departamento;

-- 4. Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con menor presupuesto.
SELECT nombre,presupuesto FROM departamento
WHERE presupuesto = (SELECT MIN(presupuesto) FROM departamento);

-- 5. Calcula el valor máximo del presupuesto de todos los departamentos.
SELECT MAX(presupuesto) FROM departamento;

-- 6. Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con mayor presupuesto.
SELECT nombre, presupuesto FROM departamento
WHERE presupuesto = (SELECT MAX(presupuesto) FROM departamento);

-- 7. Calcula el número total de empleados que hay en la tabla empleado.
SELECT COUNT(*) FROM empleado;

-- 8. Calcula el número de empleados que no tienen NULL en su segundo apellido.
SELECT COUNT(*) FROM empleado
WHERE apellido2 IS NOT NULL;

/* 9. Calcula el número de empleados que hay en cada departamento. Tienes que devolver dos columnas,
una con el nombre del departamento y otra con el número de empleados que tiene asignados. */
SELECT d.nombre, COUNT(id_departamento) AS cantidad_empleados
FROM departamento d
JOIN empleado e
ON d.id = e.id_departamento
GROUP BY nombre;

/* 10. Calcula el nombre de los departamentos que tienen más de 2 empleados. El resultado debe tener dos columnas,
una con el nombre del departamento y otra con el número de empleados que tiene asignados. */
SELECT d.nombre, COUNT(id_departamento) AS cantidad_empleados
FROM departamento d
LEFT JOIN empleado e
ON d.id = e.id_departamento
GROUP BY nombre
HAVING COUNT(id_departamento) > 2;

/* 11. Calcula el número de empleados que trabajan en cada uno de los departamentos. El resultado de esta consulta
también tiene que incluir aquellos departamentos que no tienen ningún empleado asociado. */
SELECT d.nombre, COUNT(id_departamento) AS cantidad_empleados
FROM departamento d
LEFT JOIN empleado e
ON d.id = e.id_departamento
GROUP BY nombre;

-- 12. Calcula el número de empleados que trabajan en cada unos de los departamentos que tienen un presupuesto mayor a 200000 euros.
SELECT d.nombre, COUNT(e.id) AS cantidad_empleados
FROM departamento d
LEFT JOIN empleado e
ON d.id = e.id_departamento
WHERE d.presupuesto > 200000
GROUP BY d.nombre;