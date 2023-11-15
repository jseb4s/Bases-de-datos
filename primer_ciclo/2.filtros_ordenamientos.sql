-- Filtros y ordenamiento

--1. Muestra todos los clientes cuyo nombre es "Juan"
SELECT * FROM ClientePLSQL
WHERE Nombre LIKE '%Juan%';

-- 2. Muestra todos los autos de la marca "Toyota". El campo sale vacío porque en la tabla no hay registros de la marca Toyota
SELECT * FROM AutoPLSQL
WHERE MARCA = 'Toyota';

-- 3. Muestra todos los alquileres que ocurrieron después de '2023-01-01'
SELECT * FROM AlquilerPLSQL
WHERE FECHA_INICIO > '01/01/2023';

-- 4. Muestra todas las sucursales ubicadas en "Madrid". El campo sale vacío porque en la tabla no hay registros de la ciudad Madrid
SELECT * FROM SucursalPLSQL
WHERE CIUDAD = 'Madrid';

-- 5. Muestra todas las reservas realizadas por el cliente con ID 1. El campo sale vacío porque en la tabla no hay registros deL cliente 1
SELECT * FROM ReservaPLSQL
WHERE ID_CLIENTE = 1;




