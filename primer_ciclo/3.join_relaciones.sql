-- Join y relaciones

-- 1. Muestra los detalles de los alquileres con nombres de clientes y marcas de autos
SELECT A.id_alquiler, C.nombre AS nombre_cliente, Au.marca
FROM AlquilerPLSQL A
JOIN ClientePLSQL C ON A.id_cliente = C.id_cliente
JOIN AutoPLSQL Au ON A.id_auto = Au.id_auto;

-- 2. Muestra los clientes que han realizado reservas en la sucursal 12
SELECT DISTINCT C.*
FROM ClientePLSQL C
JOIN ReservaPLSQL R ON C.id_cliente = R.id_cliente
WHERE R.id_sucursal = 12;

-- 3. Muestra los autos alquilados con los nombres de los clientes
SELECT A.id_auto, Au.marca, Au.modelo, Au.ano, C.nombre AS nombre_cliente
FROM AlquilerPLSQL A
JOIN ClientePLSQL C ON A.id_cliente = C.id_cliente
JOIN AutoPLSQL Au ON A.id_auto = Au.id_auto;

-- 4. Muestra los detalles de las reservas con nombres de clientes y ciudades de sucursales
SELECT R.id_reserva, C.nombre AS nombre_cliente, S.ciudad
FROM ReservaPLSQL R
JOIN ClientePLSQL C ON R.id_cliente = C.id_cliente
JOIN SucursalPLSQL S ON R.id_sucursal = S.id_sucursal;

-- 5. Muestra los clientes que no han realizado ninguna reserva
SELECT C.*
FROM ClientePLSQL C
LEFT JOIN ReservaPLSQL R ON C.id_cliente = R.id_cliente
WHERE R.id_reserva IS NULL;
