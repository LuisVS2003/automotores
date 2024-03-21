USE automotores;

DROP PROCEDURE IF EXISTS registrarCategoria;
DROP PROCEDURE IF EXISTS registrarMarca;
DROP PROCEDURE IF EXISTS registrarProducto;
DROP PROCEDURE IF EXISTS registrarAlmacen;
DROP PROCEDURE IF EXISTS registrarKardex;
DROP PROCEDURE IF EXISTS registrarMovimientoCompra;
DROP PROCEDURE IF EXISTS registrarMovimientoVenta;
DROP PROCEDURE IF EXISTS registrarProveedor;
DROP PROCEDURE IF EXISTS registrarCompra;
DROP PROCEDURE IF EXISTS registrarDetalleCompra;
DROP PROCEDURE IF EXISTS registrarCliente;
DROP PROCEDURE IF EXISTS registrarVenta;
DROP PROCEDURE IF EXISTS registrarDetalleVenta;
DROP PROCEDURE IF EXISTS registrarRol;
DROP PROCEDURE IF EXISTS registrarEmpleado;

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE registrarCategoria(
    IN _nombre VARCHAR(50)
)
BEGIN
    INSERT INTO categorias(nombre)
    VALUES (_nombre);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE registrarMarca(
    IN _nombre VARCHAR(50)
)
BEGIN
    INSERT INTO marcas(nombre)
    VALUES (_nombre);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE registrarProducto(
    IN _categoria_id	INT,
    IN _marca_id		INT,
    IN _nombre			VARCHAR(120),
    IN _codigo			VARCHAR(20),
    IN _descripcion		TEXT,
    IN _precio			DECIMAL(7,2),
    IN _imagen			VARCHAR(60)
)
BEGIN
    INSERT INTO productos
		(categoria_id, marca_id, nombre, codigo, descripcion, precio, imagen)
    VALUES
		(_categoria_id, IFNULL(_marca_id, ''), _nombre, _codigo, _descripcion, _precio, IFNULL(_imagen, ''));
        
    SELECT LAST_INSERT_ID() 'id';
END$$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE registrarAlmacen(
    IN _direccion	VARCHAR(255),
    IN _referencia	VARCHAR(255),
    IN _latitud		VARCHAR(15),
    IN _longitud	VARCHAR(15)
)
BEGIN
    INSERT INTO almacen
		(direccion, referencia, latitud, longitud)
    VALUES
		(_direccion, _referencia, _latitud, _longitud);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE registrarKardex(
    IN _producto_id INT,
    IN _almacen_id INT,
    IN _minimo SMALLINT,
    IN _maximo SMALLINT
)
BEGIN
    INSERT INTO kardex
		(producto_id, almacen_id, minimo, maximo)
    VALUES
		(_producto_id, _almacen_id, _minimo, _maximo);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE registrarMovimientoCompra (
    IN _kardex_id	INT,
    IN _cantidad	SMALLINT
)
BEGIN
	DECLARE _saldo_actual SMALLINT;
    
    SET _saldo_actual = (
		SELECT saldo
        FROM movimientos
        WHERE kardex_id = _kardex_id
        ORDER BY id DESC
        LIMIT 1
	);
    
    INSERT INTO movimientos
		(kardex_id, cantidad, saldo, tipo)
    VALUES
		(_kardex_id, _cantidad, (_saldo_actual + _cantidad), 'E');
        
    SELECT LAST_INSERT_ID() 'id';
END $$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE registrarMovimientoVenta (
    IN _kardex_id	INT,
    IN _cantidad	SMALLINT
)
BEGIN
	DECLARE _saldo_actual SMALLINT;
    
    SET _saldo_actual = (
		SELECT saldo
        FROM movimientos
        WHERE kardex_id = _kardex_id
        ORDER BY id DESC
        LIMIT 1
	);
    
    INSERT INTO movimientos
		(kardex_id, cantidad, saldo, tipo)
    VALUES
		(_kardex_id, _cantidad, (_saldo_actual - _cantidad), 'S');
        
    SELECT LAST_INSERT_ID() 'id';
END $$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE registrarProveedor(
    IN _nombre		VARCHAR(80),
    IN _telefono	VARCHAR(9),
    IN _correo		VARCHAR(120),
    IN _ruc			CHAR(11),
    IN _direccion	VARCHAR(255)
)
BEGIN
    INSERT INTO proveedores
		(nombre, telefono, correo, ruc, direccion)
    VALUES
		(_nombre, _telefono, _correo, _ruc, _direccion);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE registrarCompra(
    IN _proveedor_id	INT,
    IN _empleado_id		INT
)
BEGIN
    INSERT INTO compras (proveedor_id, empleado_id)
    VALUES (_proveedor_id, _empleado_id);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE registrarDetalleCompra(
    IN _compra_id	INT,
    IN _producto_id	INT,
    IN _cantidad	SMALLINT,
    IN _almacen_id	TINYINT
)
BEGIN
	DECLARE _kardex_id		INT;
    DECLARE _saldo_actual	INT;

    INSERT INTO detalles_compras
		(compra_id, producto_id, cantidad)
    VALUES
		(_compra_id, _producto_id, _cantidad);
        
    SELECT LAST_INSERT_ID() 'id';
    
	SET _kardex_id = (
		SELECT id FROM kardex
        WHERE producto_id = _producto_id AND almacen_id = _almacen_id
    );
    
    SET _saldo_actual = (
		SELECT saldo FROM movimientos
        WHERE kardex_id = _kardex_id
		ORDER BY id DESC
		LIMIT 1
    );
    
    INSERT INTO movimientos
		(kardex_id, cantidad, saldo, tipo)
    VALUES
		(_kardex_id, _cantidad, (_saldo_actual + cantidad), 'E');
    
END $$

SELECT * FROM kardex;
-- ###################################################################
DELIMITER $$
CREATE PROCEDURE registrarCliente(
    IN _nombres		VARCHAR(50),
    IN _apellidos	VARCHAR(50),
    IN _dni			CHAR(8)
)
BEGIN
    INSERT INTO clientes
		(nombres, apellidos, dni)
    VALUES
		(_nombres, _apellidos, _dni);

    SELECT LAST_INSERT_ID() 'id';
END $$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE registrarVenta(
    IN _cliente_id	INT,
    IN _empleado_id	INT
)
BEGIN
    INSERT INTO ventas (cliente_id, empleado_id)
    VALUES (_cliente_id, _empleado_id);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE registrarDetalleVenta(
    IN _venta_id	INT,
    IN _producto_id	INT,
    IN _cantidad	SMALLINT
)
BEGIN
    INSERT INTO detalles_ventas
		(venta_id, producto_id, cantidad)
    VALUES
		(_venta_id, _producto_id, _cantidad);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE registrarEmpleado(
    IN _rol_id		INT,
    IN _nombres		VARCHAR(50),
    IN _apellidos	VARCHAR(50),
    IN _dni			CHAR(8),
    IN _correo		VARCHAR(120),
    IN _clave		VARCHAR(60),
    IN _direccion	VARCHAR(255),
    IN _salario		DECIMAL(9,2)
)
BEGIN
    INSERT INTO empleados
		(rol_id, nombres, apellidos, dni, correo, clave, direccion, salario)
    VALUES
		(_rol_id, _nombres, _apellidos, _dni, _correo, _clave, _direccion, _salario);

    SELECT LAST_INSERT_ID() 'id';
END $$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE registrarRol(
    IN _nombre VARCHAR(20)
)
BEGIN
    INSERT INTO roles (nombre)
    VALUES (_nombre);

    SELECT LAST_INSERT_ID() 'id';
END $$
