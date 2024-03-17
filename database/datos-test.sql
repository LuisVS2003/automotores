INSERT INTO marcas (nombre) VALUES
	("Bosch"),
	("Fram"),
	("Purolator"),
	("NGK"),
	("Denso"),
	("Champion"),
	("Brembo"),
	("Wagner"),
	("Akebono"),
	("Monroe"),
	("KYB"),
	("Bilstein"),
	("Gates"),
	("ACDelco"),
	("GMB"),
	("Gates"),
	("Continental"),
	("Dayco"),
	("Interstate"),
	("Optima"),
	("AC Delco"),
	("K&N"),
	("Fram"),
	("Wagner"),
	("ACDelco"),
	("Bosch"),
	("Denso");

-- CATEGPRIA ###############################################################################
INSERT INTO categorias (nombre) VALUES
	("Filtro de aceite"),
	("Bujias"),
	("Pastillas de freno"),
	("Bomba de agua"),
	("Correa de distribución"),
	("Batería"),
	("Rotor de freno"),
	("Alternador");

-- CLIENTE #################################################################################
INSERT INTO clientes (nombres) VALUES
	("Alejandra Flores Velasco"),
	("Manuel Díaz Torres"),
	("Patricia Gómez Sánchez"),
	("Ricardo López Herrera"),
	("Laura Martínez Ramírez");

-- PRODUCTO ################################################################################
INSERT INTO productos (categoria_id, marca_id, nombre, codigo, descripcion, precio, imagen)
VALUES
	(1, 2, "Filtro de aceite Fram XYZ", "COD000000002", "Filtro de aceite de alta calidad", 15.99, "imagen2.jpg"),
	(2, 5, "Bujía Denso ABC", "COD000000003", "Bujía de platino para un mejor rendimiento", 8.50, "imagen3.jpg"),
	(3, 7, "Pastillas de freno Brembo 123", "COD000000004", "Pastillas de freno de cerámica para un frenado suave", 45.75, "imagen4.jpg"),
	(4, 10, "Bomba de agua Monroe XYZ", "COD000000005", "Bomba de agua de alta eficiencia", 65.30, "imagen5.jpg"),
	(5, 4, "Correa de distribución NGK 567", "COD000000006", "Correa de distribución resistente y duradera", 25.99, "imagen6.jpg");

-- ROL #####################################################################################
INSERT INTO roles (nombre) VALUES
	("Administrador"),
	("Gerente"),
	("Vendedor"),
	("Técnico"),
	("Contador");

-- EMPLEADO ################################################################################
INSERT INTO empleados (rol_id, nombres, apellidos, dni, correo, clave, direccion, salario)
VALUES
	(1, "Juan", "Pérez", "12345678", "juan@example.com", "clave123", "Calle 123", 2000.00 ),
	(2, "María", "González", "87654321", "maria@example.com", "clave456", "Avenida 456", 2500.00 ),
	(3, "Carlos", "Martínez", "23456789", "carlos@example.com", "clave789", "Plaza 789", 1800.00 );

-- PROVEEDOR ###############################################################################
INSERT INTO proveedores(nombre, telefono, correo, ruc, direccion) VALUES
    ('Tech Solutions Inc.', '555123456', 'info@techsolutions.com', '12345678912', '123 Main Street'),
	('Fresh Foods LLC', '444987654', 'contact@freshfoods.com', '98765432145', '456 Oak Avenue'),
	('Green Energy Corp.', '333555999', 'info@greenenergy.com','55555555578', '789 Elm Street');

-- ALMACEN #################################################################################
INSERT INTO almacen (direccion) VALUES
	('Lima'),
    ('Chincha');

-- KARDEX ##################################################################################
INSERT INTO kardex (producto_id, almacen_id) VALUES
	(1,1),
    (2,1),
    (1,2),
    (3,2),
    (4,2);

-- MOVIMIENTO ##############################################################################
INSERT INTO movimientos (kardex_id, cantidad, saldo, tipo) VALUES
	(1, 15, 15, 'E'),
	(1, 15, 30, 'E'),
    (2, 20, 20, 'E'),
    (3, 30, 30, 'E'),
    (4, 40, 40, 'E');

-- VENTA ###################################################################################
INSERT INTO ventas (cliente_id, empleado_id) VALUES
	(1, 1),
    (2, 1),
    (NULL, 2),
    (NULL, 3);
    
-- DETALLE VENTA ###########################################################################
INSERT INTO detalles_ventas (venta_id, producto_id, cantidad) VALUES
	(1, 1, 5),
    (1, 2, 2),
    (1, 3, 7),
    (2, 2, 1),
    (2, 5, 10),
    (3, 1, 10),
    (4, 1, 10);
    
-- COMPRA ###################################################################################
INSERT INTO compras (proveedor_id, empleado_id) VALUES
	(1, 2),
    (2, 1),
    (3, 3),
    (1, 2);
    
-- DETALLE VENTA ###########################################################################
INSERT INTO detalles_compras (compra_id, producto_id, cantidad) VALUES
	(1, 1, 10),
    (1, 2, 5),
    (1, 3, 15),
    (2, 2, 5),
    (2, 5, 20),
    (3, 1, 15),
    (4, 1, 30);
