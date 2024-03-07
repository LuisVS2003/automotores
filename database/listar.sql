USE automotores;

-- Listar categorias
DELIMITER $$
CREATE PROCEDURE listarCategorias()
BEGIN
    SELECT
		id, nombre
    FROM categorias
    WHERE inactive_at IS NULL;
END$$

-- Listar marcas
DELIMITER $$
CREATE PROCEDURE listarMarcas()
BEGIN
    SELECT
		id, nombre
    FROM marcas
    WHERE inactive_at IS NULL;
END$$

-- Listar productos
DELIMITER $$
CREATE PROCEDURE listarProductos()
BEGIN
    SELECT 
		id,
        categoria_id,
        marca_id,
        nombre,
        codigo,
        descripcion,
        precio,
        imagen
    FROM productos
    WHERE inactive_at IS NULL;
END$$

-- Listar almacenes
DELIMITER $$
CREATE PROCEDURE listarAlmacenes()
BEGIN
    SELECT
		id,
        direccion,
        referencia,
        latitud,
        longitud
    FROM almacen
    WHERE inactive_at IS NULL;
END$$

-- Listar kardex
DELIMITER $$
CREATE PROCEDURE listarKardex()
BEGIN
    SELECT
		id,
		producto_id,
		almacen_id,
		minimo,
		maximo
    FROM kardex
    WHERE inactive_at IS NULL;
END$$

-- Listar movimientos
DELIMITER $$
CREATE PROCEDURE listarMovimientos()
BEGIN
    SELECT
		id,
        kardex_id,
        cantidad,
        saldo,
        tipo,
        fecha
    FROM movimientos
    WHERE inactive_at IS NULL;
END$$

-- Listar proveedores
DELIMITER $$
CREATE PROCEDURE listarProveedores()
BEGIN
    SELECT
		id,
        nombre,
        telefono,
        correo,
        ruc,
        direccion
    FROM proveedores
    WHERE inactive_at IS NULL;
END$$

-- Listar compras
DELIMITER $$
CREATE PROCEDURE listarCompras()
BEGIN
    SELECT
		id,
        proveedor_id,
        fecha
    FROM compras
    WHERE inactive_at IS NULL;
END$$

-- Listar detalles de compras
DELIMITER $$
CREATE PROCEDURE listarDetallesCompras()
BEGIN
    SELECT
		id,
        compra_id,
        producto_id,
        cantidad
    FROM detalles_compras
    WHERE inactive_at IS NULL;
END$$


DELIMITER $$
CREATE PROCEDURE ListarClientes()
BEGIN
    SELECT
        id,
        nombres,
        apellidos,
        dni,
		correo
    FROM clientes
    WHERE inactive_at IS NULL;
END $$

--  Listar Roles:
DELIMITER $$
CREATE PROCEDURE ListarRoles()
BEGIN
    SELECT *
    FROM roles;
END $$

--  Listar Empleados Activos:
DELIMITER $$
CREATE PROCEDURE ListarEmpleados()
BEGIN
    SELECT
        id,
        nombres,
        apellidos,
        dni,
        correo,
        direccion,
        salario
    FROM empleados
    WHERE inactive_at IS NULL;
END $$
