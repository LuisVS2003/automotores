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
		PRO.id,
        PRO.categoria_id,
        PRO.marca_id,
        PRO.nombre AS producto,
        CAT.nombre AS categoria,
        MAR.nombre AS marca,
        PRO.codigo,
        PRO.descripcion,
        PRO.precio,
        PRO.imagen
    FROM productos PRO
	INNER JOIN categorias CAT ON CAT.id = PRO.categoria_id
	INNER JOIN marcas MAR ON MAR.id = PRO.marca_id
    WHERE PRO.inactive_at IS NULL
        AND CAT.inactive_at IS NULL
        AND MAR.inactive_at IS NULL;
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
CREATE PROCEDURE listarMovimientos()
BEGIN
    SELECT
		id,
        kardex_id,
        cantidad,
        saldo,
        tipo
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
		COM.id,
        COM.proveedor_id,
        PRO.nombre AS proveedor
    FROM compras COM
    INNER JOIN proveedores PRO ON PRO.id = COM.proveedor_id
    WHERE COM.inactive_at IS NULL;
END$$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE listarDetallesCompras()
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
		VEN.id,
        VEN.cliente_id,
        VEN.empleado_id,
        CLI.nombres AS cliente,
        CONCAT(EMP.apellidos, ", ", EMP.nombres) AS empleado
    FROM ventas VEN
    INNER JOIN clientes CLI ON CLI.id = VEN.cliente_id
    INNER JOIN empleados EMP ON EMP.id = VEN.empleado_id
    WHERE VEN.inactive_at IS NULL;
END$$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE listarDetallesVentas()
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
CREATE PROCEDURE listarRoles()
BEGIN
    SELECT
		id, nombre
    FROM roles;
END $$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE listarEmpleados()
BEGIN
    SELECT
        EMP.id,
        EMP.rol_id,
        CONCAT(EMP.apellidos, ", ", EMP.nombres) AS 'nombre_completo',
        ROL.nombre AS rol,
        EMP.dni,
        EMP.correo,
        EMP.direccion,
        EMP.salario
    FROM empleados EMP
	INNER JOIN roles ROL ON ROL.id = EMP.rol_id
    WHERE EMP.inactive_at IS NULL;
END $$
