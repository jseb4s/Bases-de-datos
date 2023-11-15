-- 1. Muestra los clientes que han realizado al menos una reserva
SELECT DISTINCT C.*
FROM ClientePLSQL C
JOIN ReservaPLSQL R ON C.id_cliente = R.id_cliente;

-- 2. Muestra los autos que no han sido alquilados aún
SELECT A.*
FROM AutoPLSQL A
LEFT JOIN AlquilerPLSQL ALQ ON A.id_auto = ALQ.id_auto
WHERE ALQ.id_auto IS NULL;

-- 3. Encuentra los clientes que han alquilado el mismo auto más de una vez. Sale en blanco porque los clientes nunca han alquilado el mismo auto +2 veces.
SELECT C.id_cliente, C.nombre, A.id_auto, COUNT(ALQ.id_alquiler) AS total_alquileres
FROM ClientePLSQL C
JOIN AlquilerPLSQL ALQ ON C.id_cliente = ALQ.id_cliente
JOIN AutoPLSQL A ON ALQ.id_auto = A.id_auto
GROUP BY C.id_cliente, C.nombre, A.id_auto
HAVING COUNT(ALQ.id_alquiler) > 1;

-- 4. Muestra los clientes que han realizado alquileres en la misma ciudad en la que viven. 
-- En este caso arroja error porque la tabla Clientes no contiene el campo Ciudad.
SELECT C.id_cliente, C.nombre, S.ciudad AS ciudad_vivienda, ALQ.ciudad AS ciudad_alquiler
FROM ClientePLSQL C
JOIN AlquilerPLSQL ALQ ON C.id_cliente = ALQ.id_cliente
JOIN SucursalPLSQL S ON C.ciudad = S.ciudad;

-- 5. Encuentra los autos que han sido alquilados en la misma sucursal donde se realizó una reserva
SELECT R.id_reserva, A.id_auto, A.marca, A.modelo, S.nombre AS sucursal_reserva
FROM ReservaPLSQL R
JOIN AlquilerPLSQL ALQ ON R.id_reserva = ALQ.id_reserva
JOIN AutoPLSQL A ON ALQ.id_auto = A.id_auto
JOIN SucursalPLSQL S ON R.id_sucursal = S.id_sucursal;



