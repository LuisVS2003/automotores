USE automotores;

--  Eliminar Cliente (Inactivar):
DELIMITER $$
CREATE PROCEDURE InactivarCliente(IN _cliente_id INT)
BEGIN
    UPDATE clientes
    SET inactive_at = NOW()
    WHERE id = _cliente_id;
END $$

--  Eliminar Empleado (Inactivar):
DELIMITER $$
CREATE PROCEDURE InactivarEmpleado(IN _empleado_id INT)
BEGIN
    UPDATE empleados
    SET inactive_at = NOW()
    WHERE id = _empleado_id;
END $$

--  Eliminar Rol (Inactivar):
DELIMITER $$
CREATE PROCEDURE InactivarRol(IN _rol_id INT)
BEGIN
    UPDATE roles
    SET inactive_at = NOW()
    WHERE id = _rol_id;
END $$
