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
INSERT INTO clientes (nombres, apellidos) VALUES
	("Alejandra", "Flores Velasco"),
	("Manuel", "Díaz Torres"),
	("Patricia", "Gómez Sánchez"),
	("Ricardo", "López Herrera"),
	("Laura", "Martínez Ramírez");

-- PRODUCTO ################################################################################
INSERT INTO productos (categoria_id, marca_id, nombre, codigo, descripcion, precio)
VALUES
	(1, 2, "Filtro de aceite Fram XYZ", "COD000000002", "Filtro de aceite de alta calidad. Ayuda a mantener el motor limpio y protegido.", 15.99),
	(2, 5, "Bujía Denso ABC", "COD000000003", "Bujía de platino para un mejor rendimiento. Mejora la eficiencia de combustión.", 8.50),
	(3, 7, "Pastillas de freno Brembo 123", "COD000000004", "Pastillas de freno de cerámica para un frenado suave. Reduce el desgaste del disco.", 45.75),
	(4, 10, "Bomba de agua Monroe XYZ", "COD000000005", "Bomba de agua de alta eficiencia. Mantiene el motor fresco y evita el sobrecalentamiento.", 65.30),
	(5, 4, "Correa de distribución NGK 567", "COD000000006", "Correa de distribución resistente y duradera. Transmite la potencia del motor al sistema de distribución.", 25.99),
	(6, 8, "Sensor de oxígeno Bosch 789", "COD000000007", "Sensor de oxígeno para monitorear la mezcla de combustible y mejorar la eficiencia.", 38.50),
	(7, 3, "Amortiguador KYB Ultra SR", "COD000000008", "Amortiguador de alta calidad para una conducción suave y segura.", 55.00),
	(8, 6, "Alternador Denso 456", "COD000000009", "Alternador de alto rendimiento para cargar la batería del vehículo.", 120.00),
	(1, 9, "Termostato Gates 234", "COD000000010", "Termostato para regular la temperatura del motor y prevenir el sobrecalentamiento.", 18.75),
	(1, 1, "Aceite de motor Mobil 1", "COD000000011", "Aceite sintético de alta viscosidad para una lubricación óptima.", 42.99),
	(1, 12, "Filtro de aire K&N 789", "COD000000012", "Filtro de aire de alto flujo para mejorar la eficiencia del motor.", 29.50),
	(2, 11, "Radiador CSF 567", "COD000000013", "Radiador de aluminio para una disipación eficiente del calor.", 85.00),
	(3, 14, "Kit de embrague Exedy 345", "COD000000014", "Kit completo de embrague para un cambio de marchas suave.", 120.50),
	(4, 13, "Bomba de combustible Airtex 678", "COD000000015", "Bomba de combustible eléctrica para suministrar gasolina al motor.", 68.25),
	(5, 15, "Bobina de encendido NGK 789", "COD000000016", "Bobina de encendido para generar chispas en las bujías.", 22.99),
	(6, 16, "Cable de bujía Bosch 123", "COD000000017", "Cable de bujía de alta resistencia para una conducción sin problemas.", 12.75),
	(7, 17, "Kit de frenos traseros Raybestos 456", "COD000000018", "Kit completo de frenos traseros para un frenado seguro.", 78.00),
	(8, 18, "Correa de accesorios Gates 567", "COD000000019", "Correa de accesorios para la transmisión de energía a componentes como el alternador y la bomba de agua.", 19.99),
	(7, 19, "Bomba de dirección hidráulica Cardone 789", "COD000000020", "Bomba de dirección para un manejo suave y preciso.", 58.50),
	(8, 20, "Kit de juntas de motor Victor Reinz 234", "COD000000021", "Kit completo de juntas para sellar el motor y prevenir fugas.", 35.25);


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
