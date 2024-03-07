USE automotores;

DROP PROCEDURE IF EXISTS listarCategorias;
DROP PROCEDURE IF EXISTS listarMarcas;
DROP PROCEDURE IF EXISTS listarProductos;
DROP PROCEDURE IF EXISTS listarAlmacenes;
DROP PROCEDURE IF EXISTS listarKardex;
DROP PROCEDURE IF EXISTS listarMovimientos;
DROP PROCEDURE IF EXISTS listarProveedores;
DROP PROCEDURE IF EXISTS listarCompras;
DROP PROCEDURE IF EXISTS listarDetallesCompras;
DROP PROCEDURE IF EXISTS listarClientes;
DROP PROCEDURE IF EXISTS listarVentas;
DROP PROCEDURE IF EXISTS listarDetallesVentas;
DROP PROCEDURE IF EXISTS listarRoles;
DROP PROCEDURE IF EXISTS listarEmpleados;

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE listarCategorias()
BEGIN
    SELECT
		id, nombre
    FROM categorias
    WHERE inactive_at IS NULL;
END$$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE listarMarcas()
BEGIN
    SELECT
		id, nombre
    FROM marcas
    WHERE inactive_at IS NULL;
END$$

-- ###################################################################
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

-- ###################################################################
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

-- ###################################################################
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

-- ###################################################################
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

-- ###################################################################
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

-- ###################################################################
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

-- ###################################################################
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

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE listarClientes()
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

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE listarVentas()
BEGIN
    SELECT
		id,
        cliente_id,
        empleado_id,
        fecha
    FROM ventas
    WHERE inactive_at IS NULL;
END$$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE listarDetallesVentas()
BEGIN
    SELECT
		id,
        venta_id,
        producto_id,
        cantidad
    FROM detalles_ventas
    WHERE inactive_at IS NULL;
END$$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE listarRoles()
BEGIN
    SELECT *
    FROM roles;
END $$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE listarEmpleados()
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
