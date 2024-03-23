USE automotores;

DROP PROCEDURE IF EXISTS spu_categoria_listar;
DROP PROCEDURE IF EXISTS spu_marca_listar;
DROP PROCEDURE IF EXISTS spu_producto_listar;
DROP PROCEDURE IF EXISTS spu_almacen_listar;
DROP PROCEDURE IF EXISTS spu_kardex_listar;
DROP PROCEDURE IF EXISTS spu_movimiento_listar;
DROP PROCEDURE IF EXISTS spu_proveedor_listar;
DROP PROCEDURE IF EXISTS spu_compra_listar;
DROP PROCEDURE IF EXISTS spu_detalle_compra_listar;
DROP PROCEDURE IF EXISTS spu_cliente_listar;
DROP PROCEDURE IF EXISTS spu_venta_listar;
DROP PROCEDURE IF EXISTS spu_detalle_venta_listar;
DROP PROCEDURE IF EXISTS spu_rol_listar;
DROP PROCEDURE IF EXISTS spu_empleado_listar;

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE spu_categoria_listar()
BEGIN
    SELECT
		id, nombre
    FROM categorias
    WHERE inactive_at IS NULL
    ORDER BY nombre;
END$$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE spu_marca_listar()
BEGIN
    SELECT
		id, nombre
    FROM marcas
    WHERE inactive_at IS NULL
    ORDER BY nombre;
END$$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE spu_producto_listar()
BEGIN
    SELECT * FROM vw_producto;
END$$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE spu_almacen_listar()
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
CREATE PROCEDURE spu_kardex_listar()
BEGIN
    SELECT
		KAR.id,
		KAR.producto_id,
		KAR.almacen_id,
        PRO.nombre AS producto,
		KAR.minimo,
		KAR.maximo
    FROM kardex KAR
    INNER JOIN productos PRO ON PRO.id = KAR.producto_id
    WHERE KAR.inactive_at IS NULL;
END$$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE spu_movimiento_listar()
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
    WHERE MOV.inactive_at IS NULL;
END $$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE spu_proveedor_listar()
BEGIN
    SELECT * FROM vw_proveedor;
END$$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE spu_compra_listar()
BEGIN
    SELECT
		D_C.id,
		COM.id,
        COM.proveedor_id,
        COM.empleado_id,
        PROV.nombre AS proveedor,
        CONCAT(EMP.apellidos, ", ", EMP.nombres) AS empleado,
        SUM(PROD.precio * D_C.cantidad) AS total
    FROM detalles_compras D_C
		INNER JOIN productos PROD ON PROD.id = D_C.producto_id
		INNER JOIN compras COM ON COM.id = D_C.compra_id
		INNER JOIN proveedores PROV ON PROV.id = COM.proveedor_id
		INNER JOIN empleados EMP ON EMP.id = COM.empleado_id
    WHERE COM.inactive_at IS NULL
    GROUP BY D_C.compra_id;
END $$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE spu_detalle_compra_listar()
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
    WHERE D_C.inactive_at IS NULL;
END$$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE spu_cliente_listar()
BEGIN
    SELECT * FROM vw_cliente;
END $$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE spu_venta_listar()
BEGIN
	SELECT
		VEN.id,
        VEN.cliente_id,
        VEN.empleado_id,
        CONCAT(COALESCE(CLI.apellidos, ''), ", ", COALESCE(CLI.nombres, '')) AS cliente,
        CONCAT(EMP.apellidos, ", ", EMP.nombres) AS empleado,
        SUM(PRO.precio * D_V.cantidad) AS total
    FROM detalles_ventas D_V
		INNER JOIN productos PRO ON PRO.id = D_V.producto_id
		INNER JOIN ventas VEN ON VEN.id = D_V.venta_id
		LEFT JOIN clientes CLI ON CLI.id = VEN.cliente_id
		INNER JOIN empleados EMP ON EMP.id = VEN.empleado_id
    WHERE VEN.inactive_at IS NULL
    GROUP BY D_V.venta_id;
END $$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE spu_detalle_venta_listar()
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
    WHERE D_V.inactive_at IS NULL;
END$$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE spu_rol_listar()
BEGIN
    SELECT
		id, nombre
    FROM roles
    ORDER BY nombre;
END $$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE spu_empleado_listar()
BEGIN
    SELECT * FROM vw_empleado;
END $$
