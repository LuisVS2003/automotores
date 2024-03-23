USE automotores;

DROP VIEW IF EXISTS vw_producto;
DROP VIEW IF EXISTS vw_proveedor;
DROP VIEW IF EXISTS vw_cliente;
DROP VIEW IF EXISTS vw_empleado;

-- ###################################################################################
CREATE VIEW vw_producto AS
	SELECT 
		PRO.id,
		PRO.categoria_id,
		PRO.marca_id,
		PRO.nombre AS producto,
		CAT.nombre AS categoria,
		MAR.nombre AS marca,
        COALESCE((SELECT saldo FROM movimientos WHERE kardex_id = KAR.id ORDER BY id DESC LIMIT 1), 0) AS cantidad,
		PRO.codigo,
		PRO.descripcion,
		PRO.precio,
		PRO.imagen
	FROM kardex KAR
    RIGHT JOIN productos PRO ON PRO.id = KAR.id
	INNER JOIN categorias CAT ON CAT.id = PRO.categoria_id
	INNER JOIN marcas MAR ON MAR.id = PRO.marca_id
	WHERE PRO.inactive_at IS NULL
		AND CAT.inactive_at IS NULL
		AND MAR.inactive_at IS NULL
	ORDER BY PRO.nombre;

-- ###################################################################################
CREATE VIEW vw_proveedor AS
	SELECT
		id,
		nombre,
		telefono,
		correo,
		ruc,
		direccion
	FROM proveedores
	WHERE inactive_at IS NULL
	ORDER BY nombre;

-- ###################################################################################
CREATE VIEW vw_cliente AS
	SELECT
        id,
        CONCAT(apellidos, ", ", nombres) AS nombre_completo,
        dni
    FROM clientes
    WHERE inactive_at IS NULL
    ORDER BY nombres;

-- ###################################################################################
CREATE VIEW vw_empleado AS
	SELECT
        EMP.id,
        EMP.rol_id,
        CONCAT(EMP.apellidos, ", ", EMP.nombres) AS nombre_completo,
        ROL.nombre AS rol,
        EMP.dni,
        EMP.correo,
        EMP.direccion,
        EMP.salario
    FROM empleados EMP
	INNER JOIN roles ROL ON ROL.id = EMP.rol_id
    WHERE EMP.inactive_at IS NULL
    ORDER BY nombre_completo;