-- Actualizaciones y eliminaciones

-- 1. Actualiza la direcci�n de un cliente espec�fico.
UPDATE ClientePLSQL
SET direccion = "Calle 925 Sur"
WHERE id_cliente = 626;


-- 2. Elimina un auto de la tabla "Auto" 
DELETE FROM AutoPLSQL
WHERE id_auto = 2;

-- 3. Marca una reserva como completada actualizando la fecha de fin
UPDATE ReservaPLSQL
SET fecha_fin = '01/01/2023'
WHERE id_reserva = '31/08/2022';


-- 4. Elimina todas las reservas realizadas por un cliente espec�fico.
DELETE FROM ReservaPLSQL
WHERE id_cliente = 5;

-- 5. Actualiza el a�o de un auto en la tabla "Auto" 
UPDATE AutoPLSQL
SET ano = 2021
WHERE id_auto = 9;

