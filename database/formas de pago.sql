CREATE TABLE pagos_cuotas (
    id	INT AUTO_INCREMENT PRIMARY KEY,
	venta_id	INT				NOT NULL,
    monto		DECIMAL(9,2)	NOT NULL,
    fecha_pago	DATE NOT		NULL,
    create_at	DATETIME		DEFAULT NOW(),
    update_at	DATETIME		NULL,
    inactive_at	DATETIME		NULL,
    CONSTRAINT fk_venta_pc FOREIGN KEY (venta_id) REFERENCES ventas(id)
) ENGINE = InnoDB;

CREATE TABLE formas_pago (
	id	INT AUTO_INCREMENT PRIMARY KEY,
    nombre		VARCHAR(50) NOT NULL,
    descripcion	TEXT NULL,
    create_at	DATETIME DEFAULT NOW(),
    update_at	DATETIME NULL,
    inactive_at	DATETIME NULL
) ENGINE = InnoDB;

-- Campos calculados: total, subtotal, igv
CREATE TABLE ventas (
	id	INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id	INT			NULL,
    empleado_id	INT			NOT NULL,
    create_at	DATETIME	DEFAULT NOW(),
    update_at	DATETIME	NULL,
    inactive_at	DATETIME	NULL,
    CONSTRAINT fk_cliente_ven FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    CONSTRAINT fk_empleado_ven FOREIGN KEY (empleado_id) REFERENCES empleados(id)
) ENGINE = InnoDB;

-- Campos calculados: subtotal -> precio del producto * cantidad
CREATE TABLE detalles_ventas (
	id	INT	AUTO_INCREMENT PRIMARY KEY,
    venta_id	INT			NOT NULL,
    producto_id	INT			NOT NULL,
    cantidad	SMALLINT	NOT NULL,
    create_at	DATETIME	DEFAULT NOW(),
    update_at	DATETIME	NULL,
    inactive_at	DATETIME	NULL,
    CONSTRAINT fk_venta_d_v FOREIGN KEY (venta_id) REFERENCES ventas(id),
    CONSTRAINT fk_producto_d_v FOREIGN KEY (producto_id) REFERENCES productos(id),
    CONSTRAINT ck_cantidad_ven CHECK (cantidad > 0)
) ENGINE = InnoDB;