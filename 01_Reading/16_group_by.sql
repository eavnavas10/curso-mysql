SELECT COUNT(age), age FROM users GROUP BY age;     --Se encarga de agrupar valores iguales y en el caso del count, cuenta cuantos de esos hay

SELECT COUNT(age), age FROM users GROUP BY age ORDER BY age DESC; -- Lo ordena por edades de forma descendente