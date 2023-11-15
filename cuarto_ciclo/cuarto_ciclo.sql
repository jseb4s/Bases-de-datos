-- Ejercicios tercer ciclo

-- Triggers para la tabla AutoPLSQL

-- 1. Trigger que se ejecuta antes de insertar un nuevo auto.
--    Actualiza el número de autos disponibles.
CREATE TRIGGER trg_insert_auto
BEFORE INSERT ON AutoPLSQL
FOR EACH ROW
BEGIN
  UPDATE AutoPLSQL
    SET numero_disponibles = numero_disponibles + 1
  WHERE id_auto = NEW.id_auto;
END;

-- 2. Trigger que se ejecuta antes de eliminar un auto.
--    Actualiza el número de autos disponibles.
CREATE TRIGGER trg_delete_auto
BEFORE DELETE ON AutoPLSQL
FOR EACH ROW
BEGIN
  UPDATE AutoPLSQL
    SET numero_disponibles = numero_disponibles - 1
  WHERE id_auto = OLD.id_auto;
END;

-- 3. Trigger que se ejecuta antes de actualizar un auto.
--    Actualiza el número de autos disponibles si el valor ha cambiado.
CREATE TRIGGER trg_update_auto
BEFORE UPDATE ON AutoPLSQL
FOR EACH ROW
BEGIN
  IF NEW.numero_disponibles != OLD.numero_disponibles THEN
    UPDATE AutoPLSQL
      SET numero_disponibles = NEW.numero_disponibles
      WHERE id_auto = NEW.id_auto;
  END IF;
END;

-- Triggers para la tabla ClientePLSQL

-- 4. Trigger que se ejecuta antes de insertar un nuevo cliente.
--    Actualiza el número total de clientes.
CREATE TRIGGER trg_insert_cliente
BEFORE INSERT ON ClientePLSQL
FOR EACH ROW
BEGIN
  UPDATE ClientePLSQL
    SET numero_clientes = numero_clientes + 1;
END;

-- 5. Trigger que se ejecuta antes de eliminar un cliente.
--    Actualiza el número total de clientes.
CREATE TRIGGER trg_delete_cliente
BEFORE DELETE ON ClientePLSQL
FOR EACH ROW
BEGIN
  UPDATE ClientePLSQL
    SET numero_clientes = numero_clientes - 1;
END;

-- 6. Trigger que se ejecuta antes de actualizar un cliente.
--    Actualiza el número de alquileres si el valor ha cambiado.
CREATE TRIGGER trg_update_cliente
BEFORE UPDATE ON ClientePLSQL
FOR EACH ROW
BEGIN
  IF NEW.numero_alquileres != OLD.numero_alquileres THEN
    UPDATE ClientePLSQL
      SET numero_alquileres = NEW.numero_alquileres
      WHERE id_cliente = NEW.id_cliente;
  END IF;
END;

-- Procedimientos almacenados

-- 7. Procedimiento que calcula el precio del alquiler dado el id_alquiler, id_auto, fecha_inicio y fecha_fin.
CREATE PROCEDURE proc_calcular_precio_alquiler
(
  IN id_alquiler INT,
  IN id_auto INT,
  IN fecha_inicio DATE,
  IN fecha_fin DATE
)
AS
BEGIN
  DECLARE precio_base NUMERIC(10, 2);
  DECLARE dias_alquiler INT;
  
  -- Obtiene el precio base del auto
  SELECT precio INTO precio_base FROM AutoPLSQL WHERE id_auto = id_auto;
  
  -- Calcula la duración del alquiler en días
  SET dias_alquiler := (fecha_fin - fecha_inicio) + 1;
  
  -- Actualiza el precio del alquiler
  UPDATE AlquilerPLSQL
    SET precio = precio_base * dias_alquiler
  WHERE id_alquiler = id_alquiler;
END;

-- 8. Procedimiento que lista los alquileres de un cliente dado su id_cliente.
CREATE PROCEDURE proc_listar_alquileres_cliente
(
  IN id_cliente INT
)
AS
BEGIN
  SELECT *
  FROM AlquilerPLSQL
  WHERE id_cliente = id_cliente;
END;

-- 9. Procedimiento que lista los autos de una sucursal dado su id_sucursal.
CREATE PROCEDURE proc_listar_autos_sucursal
(
  IN id_sucursal INT
)
AS
BEGIN
  SELECT *
  FROM AutoPLSQL
  WHERE id_sucursal = id_sucursal;
END;

-- 10. Procedimiento que agrega un nuevo auto con la información proporcionada.
CREATE PROCEDURE proc_agregar_auto
(
  IN marca VARCHAR(255),
  IN modelo VARCHAR(255),
  IN ano INT,
  IN numero_disponibles INT
)
AS
BEGIN
  INSERT INTO AutoPLSQL (marca, modelo, ano, numero_disponibles)
  VALUES (marca, modelo, ano, numero_disponibles);
END;

-- 11. Procedimiento que elimina un auto dado su id_auto.
CREATE PROCEDURE proc_eliminar_auto
(
  IN id_auto INT
)
AS
BEGIN
  DELETE FROM AutoPLSQL
  WHERE id_auto = id_auto;
END;
