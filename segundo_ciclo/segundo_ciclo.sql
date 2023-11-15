-- Segundo ciclo


-- 1. Muestra todos los registros de la tabla "ClientePLSQL"
SELECT * FROM ClientePLSQL;

-- 2. Muestra todos los registros de la tabla "AutoPLSQL"
SELECT * FROM AutoPLSQL;

-- 3. Muestra todos los registros de la tabla "AlquilerPLSQL"
SELECT * FROM AlquilerPLSQL;

-- 4. Combina las tablas "ClientePLSQL" y "AlquilerPLSQL" para mostrar nombres de clientes con marcas y modelos de autos en alquiler
SELECT c.nombre, a.marca, a.modelo FROM ClientePLSQL c JOIN AlquilerPLSQL a ON c.id_cliente = a.id_cliente;

-- 5. Combina las tablas "AutoPLSQL" y "AlquilerPLSQL" para mostrar marcas, modelos y años de autos alquilados
SELECT a.marca, a.modelo, a.ano FROM AutoPLSQL a JOIN AlquilerPLSQL al ON a.id_auto = al.id_auto;

-- 6. Muestra los alquileres del cliente con ID 1
SELECT * FROM AlquilerPLSQL WHERE id_cliente = 1;

-- 7. Muestra los alquileres del auto con ID 1
SELECT * FROM AlquilerPLSQL WHERE id_auto = 1;

-- 8. Muestra los alquileres realizados en la sucursal con ID 1
SELECT * FROM AlquilerPLSQL WHERE id_sucursal = 1;

-- 9. Muestra los alquileres que comenzaron el 27 de septiembre de 2023
SELECT * FROM AlquilerPLSQL WHERE fecha_inicio = '2023-09-27';

-- 10. Cuenta el número total de registros en la tabla "AlquilerPLSQL"
SELECT COUNT(*) FROM AlquilerPLSQL;

-- 11. Muestra los nombres de los clientes que han alquilado en la sucursal llamada 'Sucursal Central'
SELECT c.nombre FROM ClientePLSQL c JOIN AlquilerPLSQL a ON c.id_cliente = a.id_cliente JOIN SucursalPLSQL s ON a.id_sucursal = s.id_sucursal WHERE s.nombre = 'Sucursal Central';

-- 12. Muestra las marcas y modelos de autos alquilados por el cliente con ID 1 y que comenzaron el 27 de septiembre de 2023
SELECT a.marca, a.modelo FROM AutoPLSQL a JOIN AlquilerPLSQL al ON a.id_auto = al.id_auto WHERE al.id_cliente = 1 AND al.fecha_inicio = '2023-09-27';

-- 13. Muestra las marcas y modelos de autos alquilados por el cliente con ID 1 y que comenzaron el 27 de septiembre de 2023
SELECT a.marca, a.modelo 
FROM AutoPLSQL a
JOIN AlquilerPLSQL al ON a.id_auto = al.id_auto 
WHERE al.id_cliente = 1 AND al.fecha_inicio = '2023-09-27';

-- 14. Muestra los alquileres cuya duración es mayor a 7 días
SELECT * FROM AlquilerPLSQL WHERE fecha_fin - fecha_inicio > 7;

-- 15. Encuentra el cliente con la mayor cantidad de alquileres y muestra su nombre y el número de alquileres
SELECT c.nombre, COUNT(*) AS numero_alquileres
FROM ClientePLSQL c
JOIN AlquilerPLSQL a ON c.id_cliente = a.id_cliente
GROUP BY c.nombre
ORDER BY numero_alquileres DESC
LIMIT 1;

-- 16. Encuentra el auto con la mayor cantidad de alquileres y muestra su marca, modelo y el número de alquileres
SELECT a.marca, a.modelo, COUNT(*) AS numero_alquileres
FROM AutoPLSQL a
JOIN AlquilerPLSQL al ON a.id_auto = al.id_auto
GROUP BY a.marca, a.modelo
ORDER BY numero_alquileres DESC
LIMIT 1;

-- 17. Encuentra la sucursal con la mayor cantidad de alquileres y muestra su nombre y el número de alquileres
SELECT s.nombre, COUNT(*) AS numero_alquileres
FROM SucursalPLSQL s
JOIN AlquilerPLSQL al ON s.id_sucursal = al.id_sucursal
GROUP BY s.nombre
ORDER BY numero_alquileres DESC
LIMIT 1;

-- 18. Encuentra el mes con la mayor cantidad de alquileres y muestra el mes y el número de alquileres
SELECT EXTRACT(MONTH FROM fecha_inicio) AS mes, COUNT(*) AS numero_alquileres
FROM AlquilerPLSQL
GROUP BY EXTRACT(MONTH FROM fecha_inicio)
ORDER BY numero_alquileres DESC
LIMIT 1;

-- 19. Encuentra el día de la semana con la mayor cantidad de alquileres y muestra el día de la semana y el número de alquileres
SELECT EXTRACT(DAYOFWEEK FROM fecha_inicio) AS dia_semana, COUNT(*) AS numero_alquileres
FROM AlquilerPLSQL
GROUP BY EXTRACT(DAYOFWEEK FROM fecha_inicio)
ORDER BY numero_alquileres DESC
LIMIT 1;

-- 20. Muestra el alquiler con el precio más alto
SELECT * FROM AlquilerPLSQL
ORDER BY precio DESC
LIMIT 1;

-- 21. Muestra el alquiler con el precio más bajo
SELECT * FROM AlquilerPLSQL
ORDER BY precio ASC
LIMIT 1;

-- 22. Muestra los clientes cuyo nombre contiene "Juan"
SELECT * FROM ClientePLSQL
WHERE nombre LIKE '%Juan%';

-- 23. Muestra autos con marca, modelo y año cuyo precio es menor a 10000
SELECT a.marca, a.modelo, a.ano
FROM AutoPLSQL a
WHERE precio < 10000;

-- 24. Muestra alquileres que ocurrieron entre el 1 y el 30 de septiembre de 2023
SELECT * FROM AlquilerPLSQL
WHERE fecha_inicio BETWEEN '2023-09-01' AND '2023-09-30';

-- 25. Muestra nombres de clientes, marcas y modelos de autos para aquellos clientes cuya dirección contiene "Bogotá"
SELECT c.nombre, a.marca, a.modelo
FROM ClientePLSQL c
JOIN AlquilerPLSQL a ON c.id_cliente = a.id_cliente
WHERE c.direccion LIKE '%Bogotá%';

-- 26. Muestra la marca, modelo y año de autos relacionados con la reserva ID 1
SELECT a.marca, a.modelo, a.ano
FROM AutoPLSQL a
JOIN AlquilerPLSQL al ON a.id_auto = al.id_auto
WHERE al.id_reserva = 1;

-- 27. Muestra los alquileres de los clientes con ID 1, 2 o 3
SELECT * FROM AlquilerPLSQL
WHERE id_cliente IN (1, 2, 3);

-- 28. Muestra los alquileres de los autos con ID 1, 2 o 3
SELECT * FROM AlquilerPLSQL
WHERE id_auto IN (1, 2, 3);

-- 29. Muestra los alquileres de las sucursales con ID 1, 2 o 3
SELECT * FROM AlquilerPLSQL
WHERE id_sucursal IN (1, 2, 3);

-- 30. Muestra los alquileres que ocurrieron entre el 1 y el 30 de septiembre de 2023 y son de los clientes con ID 1, 2 o 3
SELECT * FROM AlquilerPLSQL
WHERE fecha_inicio BETWEEN '2023-09-01' AND '2023-09-30' AND id_cliente IN (1, 2, 3);

-- 31. Muestra los alquileres que ocurrieron entre el 1 y el 30 de septiembre de 2023 y son de los autos con ID 1, 2 o 3
SELECT * FROM AlquilerPLSQL
WHERE fecha_inicio BETWEEN '2023-09-01' AND '2023-09-30' AND id_auto IN (1, 2, 3);

-- 32. Muestra los alquileres que ocurrieron entre el 1 y el 30 de septiembre de 2023 y son de las sucursales con ID 1, 2 o 3
SELECT * FROM AlquilerPLSQL
WHERE fecha_inicio BETWEEN '2023-09-01' AND '2023-09-30' AND id_sucursal IN (1, 2, 3);

-- 33. Encuentra el cliente con la mayor cantidad de alquileres y muestra su nombre y el número de alquileres
SELECT c.nombre, COUNT(*) AS numero_alquileres
FROM ClientePLSQL c
JOIN AlquilerPLSQL a ON c.id_cliente = a.id_cliente
GROUP BY c.nombre
ORDER BY numero_alquileres DESC
LIMIT 1;

-- 34. Encuentra el auto con la mayor cantidad de alquileres y muestra su marca, modelo y el número de alquileres
SELECT a.marca, a.modelo, COUNT(*) AS numero_alquileres
FROM AutoPLSQL a
JOIN AlquilerPLSQL al ON a.id_auto = al.id_auto
GROUP BY a.marca, a.modelo
ORDER BY numero_alquileres DESC
LIMIT 1;

-- 35. Encuentra la sucursal con la mayor cantidad de alquileres y muestra su nombre y el número de alquileres
SELECT s.nombre, COUNT(*) AS numero_alquileres
FROM SucursalPLSQL s
JOIN AlquilerPLSQL al ON s.id_sucursal = al.id_sucursal
GROUP BY s.nombre
ORDER BY numero_alquileres DESC
LIMIT 1;

-- 36. Encuentra el mes con la mayor cantidad de alquileres y muestra el mes y el número de alquileres
SELECT EXTRACT(MONTH FROM fecha_inicio) AS mes, COUNT(*) AS numero_alquileres
FROM AlquilerPLSQL
GROUP BY EXTRACT(MONTH FROM fecha_inicio)
ORDER BY numero_alquileres DESC
LIMIT 1;

-- 37. Encuentra el día de la semana con la mayor cantidad de alquileres y muestra el día de la semana y el número de alquileres
SELECT EXTRACT(DAYOFWEEK FROM fecha_inicio) AS dia_semana, COUNT(*) AS numero_alquileres
FROM AlquilerPLSQL
GROUP BY EXTRACT(DAYOFWEEK FROM fecha_inicio)
ORDER BY numero_alquileres DESC
LIMIT 1;

-- 38. Muestra el alquiler con el precio más alto
SELECT * FROM AlquilerPLSQL
ORDER BY precio DESC
LIMIT 1;

-- 39. Muestra el alquiler con el precio más bajo
SELECT * FROM AlquilerPLSQL
ORDER BY precio ASC
LIMIT 1;

-- 40. Muestra los clientes cuyo nombre contiene "Juan" y que han realizado alquileres entre el 1 y el 30 de septiembre de 2023
SELECT * FROM ClientePLSQL
WHERE nombre LIKE '%Juan%' AND fecha_inicio BETWEEN '2023-09-01' AND '2023-09-30';

-- 41. Muestra autos con marca, modelo y año cuyo precio es menor a 10000 y que han sido alquilados entre el 1 y el 30 de septiembre de 2023
SELECT a.marca, a.modelo, a.ano
FROM AutoPLSQL a
WHERE precio < 10000 AND fecha_inicio BETWEEN '2023-09-01' AND '2023-09-30';


