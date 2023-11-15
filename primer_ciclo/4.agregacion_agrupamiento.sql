-- 1. Cuenta cuántos autos hay de cada marca
SELECT marca, COUNT(*) AS cantidad
FROM AutoPLSQL
GROUP BY marca;

-- 2. Calcula la duración promedio de los alquileres
SELECT AVG(fecha_fin - fecha_inicio) AS duracion_promedio
FROM AlquilerPLSQL;

-- 3. Muestra el número total de reservas realizadas en cada sucursal
SELECT S.id_sucursal, S.nombre, COUNT(R.id_reserva) AS total_reservas
FROM SucursalPLSQL S
LEFT JOIN ReservaPLSQL R ON S.id_sucursal = R.id_sucursal
GROUP BY S.id_sucursal, S.nombre;

-- 4. Encuentra el cliente que ha realizado la mayor cantidad de alquileres
SELECT C.id_cliente, C.nombre, COUNT(A.id_alquiler) AS total_alquileres
FROM ClientePLSQL C
LEFT JOIN AlquilerPLSQL A ON C.id_cliente = A.id_cliente
GROUP BY C.id_cliente, C.nombre
ORDER BY total_alquileres DESC
FETCH FIRST 1 ROW ONLY;

-- 5. Calcula el promedio de años de los autos
SELECT AVG(ano) AS promedio_anos
FROM AutoPLSQL;




