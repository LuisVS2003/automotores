DROP DATABASE IF EXISTS automotores;
CREATE DATABASE automotores;
USE automotores;

-- Listar
CREATE TABLE categorias (
	id	INT AUTO_INCREMENT PRIMARY KEY,
    nombre	VARCHAR(50)		NOT NULL
) ENGINE = InnoDB;

-- Listar
CREATE TABLE marcas (
	id	INT AUTO_INCREMENT PRIMARY KEY,
    nombre	VARCHAR(50)		NOT NULL	
) ENGINE = InnoDB;

-- Listar, Registrar, Editar, Eliminar
CREATE TABLE productos (
	id	INT AUTO_INCREMENT PRIMARY KEY,
    categoria_id	INT				NOT NULL, -- FK
    marca_id		INT				NULL,
    nombre			VARCHAR(120)	NOT NULL,
    codigo			VARCHAR(20) 	NOT NULL,
    descripcion		TEXT			NULL,
    precio			DECIMAL(7,2)	NOT NULL,
    imagen			VARCHAR(60)		NULL,
    CONSTRAINT fk_categoria_prod FOREIGN KEY (categoria_id) REFERENCES categorias(id),
    CONSTRAINT fk_marca_prod FOREIGN KEY (marca_id) REFERENCES marcas(id)
) ENGINE = InnoDB;

-- Listar, Registrar, Editar, Eliminar
CREATE TABLE almacen (
	id	INT AUTO_INCREMENT PRIMARY KEY,
    direccion	VARCHAR(255)	NOT NULL,
    referencia 	VARCHAR(255)	NULL,
    latitud 	VARCHAR(15)		NULL,
    longitud 	VARCHAR(15)		NULL
) ENGINE = InnoDB;

-- Listar, Registrar, Editar, Eliminar
CREATE TABLE kardex (
	id	INT AUTO_INCREMENT PRIMARY KEY,
    producto_id		INT				NOT NULL,
    almacen_id		INT				NOT NULL,
    minimo			SMALLINT		NULL,
    maximo			SMALLINT		NULL,
    CONSTRAINT fk_producto_kar FOREIGN KEY (producto_id) REFERENCES productos(id),
    CONSTRAINT fk_almacen_kar FOREIGN KEY (almacen_id) REFERENCES almacen(id)
) ENGINE = InnoDB;

-- Listar, Registrar
CREATE TABLE movimientos (
	id	INT AUTO_INCREMENT PRIMARY KEY,
    kardex_id		INT				NOT NULL,
    cantidad		SMALLINT		NOT NULL,
    saldo			SMALLINT		NOT NULL,
    tipo			CHAR(1)			NOT NULL, -- E -> Entrada | S -> Salida
    fecha			DATETIME		NOT NULL,
    CONSTRAINT fk_kardex_mov FOREIGN KEY (kardex_id) REFERENCES kardex(id)
) ENGINE = InnoDB;

-- Listar, Registrar, Editar, Eliminar
CREATE TABLE proveedores (
	id	INT AUTO_INCREMENT PRIMARY KEY,
    nombre		VARCHAR(80)		NOT NULL,
    telefono	VARCHAR(9) 		NOT NULL,
    correo		VARCHAR(120)	NULL,
    ruc			CHAR(11)		NOT NULL,
    direccion	VARCHAR(255)	NULL
) ENGINE = InnoDB;

-- Campos calculados: total, subtotal, igv
-- Listar, Registrar, Eliminar
CREATE TABLE compras (
	id	INT AUTO_INCREMENT PRIMARY KEY,
    proveedor_id	INT				NOT NULL,
    fecha			DATETIME		NOT NULL,
    CONSTRAINT fk_proveedor_com FOREIGN KEY (proveedor_id) REFERENCES proveedores(id)
) ENGINE = InnoDB;

-- Campos calculados: subtotal -> precio del producto * cantidad
-- Listar, Registrar, Eliminar
CREATE TABLE detalles_compras (
	id	INT AUTO_INCREMENT PRIMARY KEY,
    compra_id		INT				NOT NULL,
    producto_id		INT				NOT NULL,
    cantidad		SMALLINT		NOT NULL,
    CONSTRAINT fk_compra_d_c FOREIGN KEY (compra_id) REFERENCES compras(id),
    CONSTRAINT fk_producto_d_c FOREIGN KEY (producto_id) REFERENCES productos(id)
) ENGINE = InnoDB;

-- Listar, Registrar, Editar, Eliminar
CREATE TABLE clientes (
	id	INT AUTO_INCREMENT PRIMARY KEY,
    nombres		VARCHAR(50)		NULL,
    apellidos	VARCHAR(50)		NULL,
    dni			CHAR(8)			NULL,
    correo		VARCHAR(120)	NULL,
    clave		VARCHAR(60)		NULL
) ENGINE = InnoDB;

-- Campos calculados: total, subtotal, igv
-- Listar, Registrar, Eliminar
CREATE TABLE ventas (
	id	INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id	INT			NOT NULL,
    CONSTRAINT fk_cliente_ven FOREIGN KEY (cliente_id) REFERENCES clientes(id)
) ENGINE = InnoDB;

-- Campos calculados: subtotal -> precio del producto * cantidad
-- Listar, Registrar, Eliminar
CREATE TABLE detalles_ventas (
	id	INT	AUTO_INCREMENT PRIMARY KEY,
    venta_id	INT			NOT NULL,
    producto_id	INT			NOT NULL,
    cantidad	SMALLINT	NOT NULL,
    CONSTRAINT fk_venta_d_v FOREIGN KEY (venta_id) REFERENCES ventas(id),
    CONSTRAINT fk_producto_d_v FOREIGN KEY (producto_id) REFERENCES productos(id)
) ENGINE = InnoDB;

-- Listar
CREATE TABLE roles (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre		VARCHAR(20)		NOT NULL
) ENGINE = InnoDB;

-- Listar, Registrar, Editar, Eliminar
CREATE TABLE empleados (
	id INT AUTO_INCREMENT PRIMARY KEY,
    rol_id		INT				NOT NULL,
    nombres		VARCHAR(50)		NOT NULL,
    apellidos	VARCHAR(50)		NOT NULL,
    dni			CHAR(8)			NOT NULL,
    correo		VARCHAR(120)	NOT NULL,
    clave		VARCHAR(60)		NOT NULL,
    direccion	VARCHAR(255)	NULL,
    salario		DECIMAL(9,2)	NULL,
    CONSTRAINT fk_rol_emp FOREIGN KEY (rol_id) REFERENCES roles(id)
) ENGINE = InnoDB;
