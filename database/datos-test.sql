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

INSERT INTO categorias (nombre) VALUES
	("Filtro de aceite"),
	("Bujias"),
	("Pastillas de freno"),
	("Bomba de agua"),
	("Correa de distribución"),
	("Batería"),
	("Rotor de freno"),
	("Alternador");

INSERT INTO clientes (nombres) VALUES
	("Alejandra Flores Velasco"),
	("Manuel Díaz Torres"),
	("Patricia Gómez Sánchez"),
	("Ricardo López Herrera"),
	("Laura Martínez Ramírez");

INSERT INTO productos (categoria_id, marca_id, nombre, codigo, descripcion, precio, imagen)
VALUES
	(1, 2, "Filtro de aceite Fram XYZ", "COD000000002", "Filtro de aceite de alta calidad", 15.99, "imagen2.jpg"),
	(2, 5, "Bujía Denso ABC", "COD000000003", "Bujía de platino para un mejor rendimiento", 8.50, "imagen3.jpg"),
	(3, 7, "Pastillas de freno Brembo 123", "COD000000004", "Pastillas de freno de cerámica para un frenado suave", 45.75, "imagen4.jpg"),
	(4, 10, "Bomba de agua Monroe XYZ", "COD000000005", "Bomba de agua de alta eficiencia", 65.30, "imagen5.jpg"),
	(5, 4, "Correa de distribución NGK 567", "COD000000006", "Correa de distribución resistente y duradera", 25.99, "imagen6.jpg");

INSERT INTO roles (nombre) VALUES
	("Administrador"),
	("Gerente"),
	("Vendedor"),
	("Técnico"),
	("Contador");

INSERT INTO empleados (rol_id, nombres, apellidos, dni, correo, clave, direccion, salario)
VALUES
	(1, "Juan", "Pérez", "12345678", "juan@example.com", "clave123", "Calle 123", 2000.00 ),
	(2, "María", "González", "87654321", "maria@example.com", "clave456", "Avenida 456", 2500.00 ),
	(3, "Carlos", "Martínez", "23456789", "carlos@example.com", "clave789", "Plaza 789", 1800.00 );
    
    
--  SELECT * FROM automotores.proveedores;

INSERT INTO proveedores(nombre, telefono, correo, ruc, direccion) 
VALUES
	('test', '987654321', 'esteesuncorreotest@gmail.com', '12345678901', 'direcciontest');
    
    
    