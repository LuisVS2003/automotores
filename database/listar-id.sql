USE automotores;

DROP PROCEDURE IF EXISTS listarProductoId;
DROP PROCEDURE IF EXISTS listarMovimientoId;
DROP PROCEDURE IF EXISTS listarProveedorId;
DROP PROCEDURE IF EXISTS listarCompraId;
DROP PROCEDURE IF EXISTS listarClienteId;
DROP PROCEDURE IF EXISTS listarVentaId;
DROP PROCEDURE IF EXISTS listarEmpleadoId;

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE listarProductoId(IN _producto_id INT)
BEGIN
    SELECT * FROM vw_producto
    WHERE id = _producto_id;
END$$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE listarMovimientoId(IN _kardex_id INT)
BEGIN
    SELECT
		MOV.id,
        MOV.kardex_id,
        KAR.producto_id,
        KAR.almacen_id,
        MOV.cantidad,
        MOV.saldo,
        MOV.tipo,
        PRO.nombre AS producto,
        ALM.direccion AS almacen
    FROM movimientos MOV
    INNER JOIN kardex KAR ON KAR.id = MOV.kardex_id
    INNER JOIN productos PRO ON PRO.id = KAR.producto_id
    INNER JOIN almacen ALM ON ALM.id = KAR.almacen_id
    WHERE MOV.inactive_at IS NULL
		AND MOV.kardex_id = _kardex_id;
END $$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE listarProveedorId(IN _proveedor_id INT)
BEGIN
    SELECT * FROM vw_proveedor
    WHERE id = _proveedor_id;
END$$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE listarCompraId(IN _compra_id INT)
BEGIN
    SELECT
		D_C.id,
        D_C.compra_id,
        D_C.producto_id,
        D_C.cantidad,
        PRO.nombre AS producto,
        PRO.precio,
        D_C.cantidad * PRO.precio AS importe
    FROM detalles_compras D_C
    INNER JOIN productos PRO ON PRO.id = D_C.producto_id
    WHERE D_C.inactive_at IS NULL
		AND compra_id = _compra_id;
END$$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE listarClienteId(IN _cliente_id INT)
BEGIN
    SELECT 
		id,
        apellidos,
        nombres,
        dni
	FROM clientes
    WHERE inactive_at IS NULL
		AND id = _cliente_id;
END $$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE listarVentaId(IN _venta_id INT)
BEGIN
    SELECT
		D_V.id,
        D_V.venta_id,
        D_V.producto_id,
        D_V.cantidad,
        PRO.nombre AS producto,
        PRO.precio,
        D_V.cantidad * PRO.precio AS importe
    FROM detalles_ventas D_V
    INNER JOIN productos PRO ON PRO.id = D_V.producto_id
    WHERE D_V.inactive_at IS NULL
		AND D_V.venta_id = _venta_id;
END$$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE listarEmpleadoId(IN _empleado_id INT)
BEGIN
    SELECT * FROM vw_empleado
    WHERE id = _empleado_id;
END $$
