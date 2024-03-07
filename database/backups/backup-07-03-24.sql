-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 07-03-2024 a las 20:18:03
-- Versión del servidor: 8.2.0
-- Versión de PHP: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `automotores`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `listarAlmacenes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarAlmacenes` ()   BEGIN
    SELECT
		id,
        direccion,
        referencia,
        latitud,
        longitud
    FROM almacen
    WHERE inactive_at IS NULL;
END$$

DROP PROCEDURE IF EXISTS `listarCategorias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarCategorias` ()   BEGIN
    SELECT
		id, nombre
    FROM categorias
    WHERE inactive_at IS NULL;
END$$

DROP PROCEDURE IF EXISTS `listarClientes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarClientes` ()   BEGIN
    SELECT
        id,
        nombres,
        apellidos,
        dni,
		correo
    FROM clientes
    WHERE inactive_at IS NULL;
END$$

DROP PROCEDURE IF EXISTS `listarCompras`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarCompras` ()   BEGIN
    SELECT
		id,
        proveedor_id,
        fecha
    FROM compras
    WHERE inactive_at IS NULL;
END$$

DROP PROCEDURE IF EXISTS `listarDetallesCompras`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarDetallesCompras` ()   BEGIN
    SELECT
		id,
        compra_id,
        producto_id,
        cantidad
    FROM detalles_compras
    WHERE inactive_at IS NULL;
END$$

DROP PROCEDURE IF EXISTS `listarDetallesVentas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarDetallesVentas` ()   BEGIN
    SELECT
		id,
        venta_id,
        producto_id,
        cantidad
    FROM detalles_ventas
    WHERE inactive_at IS NULL;
END$$

DROP PROCEDURE IF EXISTS `listarEmpleados`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarEmpleados` ()   BEGIN
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
END$$

DROP PROCEDURE IF EXISTS `listarKardex`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarKardex` ()   BEGIN
    SELECT
		id,
		producto_id,
		almacen_id,
		minimo,
		maximo
    FROM kardex
    WHERE inactive_at IS NULL;
END$$

DROP PROCEDURE IF EXISTS `listarMarcas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarMarcas` ()   BEGIN
    SELECT
		id, nombre
    FROM marcas
    WHERE inactive_at IS NULL;
END$$

DROP PROCEDURE IF EXISTS `listarMovimientos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarMovimientos` ()   BEGIN
    SELECT
		id,
        kardex_id,
        cantidad,
        saldo,
        tipo,
        fecha
    FROM movimientos
    WHERE inactive_at IS NULL;
END$$

DROP PROCEDURE IF EXISTS `listarProductos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarProductos` ()   BEGIN
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

DROP PROCEDURE IF EXISTS `listarProveedores`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarProveedores` ()   BEGIN
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

DROP PROCEDURE IF EXISTS `listarRoles`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarRoles` ()   BEGIN
    SELECT
		id, nombre
    FROM roles;
END$$

DROP PROCEDURE IF EXISTS `listarVentas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarVentas` ()   BEGIN
    SELECT
		id,
        cliente_id,
        empleado_id,
        fecha
    FROM ventas
    WHERE inactive_at IS NULL;
END$$

DROP PROCEDURE IF EXISTS `registrarAlmacen`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarAlmacen` (IN `_direccion` VARCHAR(255), IN `_referencia` VARCHAR(255), IN `_latitud` VARCHAR(15), IN `_longitud` VARCHAR(15))   BEGIN
    INSERT INTO almacen
		(direccion, referencia, latitud, longitud)
    VALUES
		(_direccion, _referencia, _latitud, _longitud);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

DROP PROCEDURE IF EXISTS `registrarCategoria`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarCategoria` (IN `_nombre` VARCHAR(50))   BEGIN
    INSERT INTO categorias(nombre)
    VALUES (_nombre);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

DROP PROCEDURE IF EXISTS `registrarCliente`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarCliente` (IN `_nombres` VARCHAR(50), IN `_apellidos` VARCHAR(50), IN `_dni` CHAR(8), IN `_correo` VARCHAR(120), IN `_clave` VARCHAR(60))   BEGIN
    INSERT INTO clientes
		(nombres, apellidos, dni, correo, clave)
    VALUES
		(_nombres, _apellidos, _dni, _correo, _clave);

    SELECT LAST_INSERT_ID() 'id';
END$$

DROP PROCEDURE IF EXISTS `registrarCompra`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarCompra` (IN `_proveedor_id` INT, IN `_fecha` DATETIME)   BEGIN
    INSERT INTO compras
		(proveedor_id, fecha)
    VALUES
		(_proveedor_id, _fecha);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

DROP PROCEDURE IF EXISTS `registrarDetalleCompra`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarDetalleCompra` (IN `_compra_id` INT, IN `_producto_id` INT, IN `_cantidad` SMALLINT)   BEGIN
    INSERT INTO detalles_compras
		(compra_id, producto_id, cantidad)
    VALUES
		(_compra_id, _producto_id, _cantidad);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

DROP PROCEDURE IF EXISTS `registrarDetalleVenta`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarDetalleVenta` (IN `_venta_id` INT, IN `_producto_id` INT, IN `_cantidad` SMALLINT)   BEGIN
    INSERT INTO detalles_ventas
		(_venta_id, producto_id, cantidad)
    VALUES
		(_venta_id, _producto_id, _cantidad);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

DROP PROCEDURE IF EXISTS `registrarEmpleado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarEmpleado` (IN `_rol_id` INT, IN `_nombres` VARCHAR(50), IN `_apellidos` VARCHAR(50), IN `_dni` CHAR(8), IN `_correo` VARCHAR(120), IN `_clave` VARCHAR(60), IN `_direccion` VARCHAR(255), IN `_salario` DECIMAL(9,2))   BEGIN
    INSERT INTO empleados
		(rol_id, nombres, apellidos, dni, correo, clave, direccion, salario)
    VALUES
		(_rol_id, _nombres, _apellidos, _dni, _correo, _clave, _direccion, _salario);

    SELECT LAST_INSERT_ID() 'id';
END$$

DROP PROCEDURE IF EXISTS `registrarKardex`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarKardex` (IN `_producto_id` INT, IN `_almacen_id` INT, IN `_minimo` SMALLINT, IN `_maximo` SMALLINT)   BEGIN
    INSERT INTO kardex
		(producto_id, almacen_id, minimo, maximo)
    VALUES
		(_producto_id, _almacen_id, _minimo, _maximo);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

DROP PROCEDURE IF EXISTS `registrarMarca`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarMarca` (IN `_nombre` VARCHAR(50))   BEGIN
    INSERT INTO marcas(nombre)
    VALUES (_nombre);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

DROP PROCEDURE IF EXISTS `registrarMovimiento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarMovimiento` (IN `_kardexId` INT, IN `_cantidad` SMALLINT, IN `_saldo` SMALLINT, IN `_tipo` CHAR(1))   BEGIN
    INSERT INTO movimientos
		(kardex_id, cantidad, saldo, tipo)
    VALUES
		(_kardexId, _cantidad, _saldo, _tipo);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

DROP PROCEDURE IF EXISTS `registrarProducto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarProducto` (IN `_categoria_id` INT, IN `_marca_id` INT, IN `_nombre` VARCHAR(120), IN `_codigo` VARCHAR(20), IN `_descripcion` TEXT, IN `_precio` DECIMAL(7,2), IN `_imagen` VARCHAR(60))   BEGIN
    INSERT INTO productos
		(categoria_id, marca_id, nombre, codigo, descripcion, precio, imagen)
    VALUES
		(_categoria_id, IFNULL(_marca_id, ''), _nombre, _codigo, _descripcion, _precio, _imagen);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

DROP PROCEDURE IF EXISTS `registrarProveedor`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarProveedor` (IN `_nombre` VARCHAR(80), IN `_telefono` VARCHAR(9), IN `_correo` VARCHAR(120), IN `_ruc` CHAR(11), IN `_direccion` VARCHAR(255))   BEGIN
    INSERT INTO proveedores
		(nombre, telefono, correo, ruc, direccion)
    VALUES
		(_nombre, _telefono, _correo, _ruc, _direccion);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

DROP PROCEDURE IF EXISTS `registrarRol`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarRol` (IN `_nombre` VARCHAR(20))   BEGIN
    INSERT INTO roles (nombre)
    VALUES (_nombre);

    SELECT LAST_INSERT_ID() 'id';
END$$

DROP PROCEDURE IF EXISTS `registrarVenta`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarVenta` (IN `_cliente_id` INT, IN `_empleado_id` INT, IN `_fecha` DATETIME)   BEGIN
    INSERT INTO ventas
		(_cliente_id, fecha)
    VALUES
		(_cliente_id, _fecha);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

DROP TABLE IF EXISTS `almacen`;
CREATE TABLE IF NOT EXISTS `almacen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `direccion` varchar(255) NOT NULL,
  `referencia` varchar(255) DEFAULT NULL,
  `latitud` varchar(15) DEFAULT NULL,
  `longitud` varchar(15) DEFAULT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 'Filtro de aceite', '2024-03-07 15:17:37', NULL, NULL),
(2, 'Bujias', '2024-03-07 15:17:37', NULL, NULL),
(3, 'Pastillas de freno', '2024-03-07 15:17:37', NULL, NULL),
(4, 'Bomba de agua', '2024-03-07 15:17:37', NULL, NULL),
(5, 'Correa de distribución', '2024-03-07 15:17:37', NULL, NULL),
(6, 'Batería', '2024-03-07 15:17:37', NULL, NULL),
(7, 'Rotor de freno', '2024-03-07 15:17:37', NULL, NULL),
(8, 'Alternador', '2024-03-07 15:17:37', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `dni` char(8) DEFAULT NULL,
  `correo` varchar(120) DEFAULT NULL,
  `clave` varchar(60) DEFAULT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombres`, `apellidos`, `dni`, `correo`, `clave`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 'Alejandra Flores Velasco', NULL, NULL, NULL, NULL, '2024-03-07 15:17:37', NULL, NULL),
(2, 'Manuel Díaz Torres', NULL, NULL, NULL, NULL, '2024-03-07 15:17:37', NULL, NULL),
(3, 'Patricia Gómez Sánchez', NULL, NULL, NULL, NULL, '2024-03-07 15:17:37', NULL, NULL),
(4, 'Ricardo López Herrera', NULL, NULL, NULL, NULL, '2024-03-07 15:17:37', NULL, NULL),
(5, 'Laura Martínez Ramírez', NULL, NULL, NULL, NULL, '2024-03-07 15:17:37', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

DROP TABLE IF EXISTS `compras`;
CREATE TABLE IF NOT EXISTS `compras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proveedor_id` int NOT NULL,
  `fecha` datetime NOT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proveedor_com` (`proveedor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_compras`
--

DROP TABLE IF EXISTS `detalles_compras`;
CREATE TABLE IF NOT EXISTS `detalles_compras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `compra_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `cantidad` smallint NOT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_compra_d_c` (`compra_id`),
  KEY `fk_producto_d_c` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_ventas`
--

DROP TABLE IF EXISTS `detalles_ventas`;
CREATE TABLE IF NOT EXISTS `detalles_ventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `venta_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `cantidad` smallint NOT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_venta_d_v` (`venta_id`),
  KEY `fk_producto_d_v` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

DROP TABLE IF EXISTS `empleados`;
CREATE TABLE IF NOT EXISTS `empleados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rol_id` int NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `dni` char(8) NOT NULL,
  `correo` varchar(120) NOT NULL,
  `clave` varchar(60) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `salario` decimal(9,2) DEFAULT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rol_emp` (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `rol_id`, `nombres`, `apellidos`, `dni`, `correo`, `clave`, `direccion`, `salario`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 1, 'Juan', 'Pérez', '12345678', 'juan@example.com', 'clave123', 'Calle 123', 2000.00, '2024-03-07 15:17:37', NULL, NULL),
(2, 2, 'María', 'González', '87654321', 'maria@example.com', 'clave456', 'Avenida 456', 2500.00, '2024-03-07 15:17:37', NULL, NULL),
(3, 3, 'Carlos', 'Martínez', '23456789', 'carlos@example.com', 'clave789', 'Plaza 789', 1800.00, '2024-03-07 15:17:37', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex`
--

DROP TABLE IF EXISTS `kardex`;
CREATE TABLE IF NOT EXISTS `kardex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `producto_id` int NOT NULL,
  `almacen_id` int NOT NULL,
  `minimo` smallint DEFAULT NULL,
  `maximo` smallint DEFAULT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_producto_kar` (`producto_id`),
  KEY `fk_almacen_kar` (`almacen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

DROP TABLE IF EXISTS `marcas`;
CREATE TABLE IF NOT EXISTS `marcas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `nombre`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 'Bosch', '2024-03-07 15:17:37', NULL, NULL),
(2, 'Fram', '2024-03-07 15:17:37', NULL, NULL),
(3, 'Purolator', '2024-03-07 15:17:37', NULL, NULL),
(4, 'NGK', '2024-03-07 15:17:37', NULL, NULL),
(5, 'Denso', '2024-03-07 15:17:37', NULL, NULL),
(6, 'Champion', '2024-03-07 15:17:37', NULL, NULL),
(7, 'Brembo', '2024-03-07 15:17:37', NULL, NULL),
(8, 'Wagner', '2024-03-07 15:17:37', NULL, NULL),
(9, 'Akebono', '2024-03-07 15:17:37', NULL, NULL),
(10, 'Monroe', '2024-03-07 15:17:37', NULL, NULL),
(11, 'KYB', '2024-03-07 15:17:37', NULL, NULL),
(12, 'Bilstein', '2024-03-07 15:17:37', NULL, NULL),
(13, 'Gates', '2024-03-07 15:17:37', NULL, NULL),
(14, 'ACDelco', '2024-03-07 15:17:37', NULL, NULL),
(15, 'GMB', '2024-03-07 15:17:37', NULL, NULL),
(16, 'Gates', '2024-03-07 15:17:37', NULL, NULL),
(17, 'Continental', '2024-03-07 15:17:37', NULL, NULL),
(18, 'Dayco', '2024-03-07 15:17:37', NULL, NULL),
(19, 'Interstate', '2024-03-07 15:17:37', NULL, NULL),
(20, 'Optima', '2024-03-07 15:17:37', NULL, NULL),
(21, 'AC Delco', '2024-03-07 15:17:37', NULL, NULL),
(22, 'K&N', '2024-03-07 15:17:37', NULL, NULL),
(23, 'Fram', '2024-03-07 15:17:37', NULL, NULL),
(24, 'Wagner', '2024-03-07 15:17:37', NULL, NULL),
(25, 'ACDelco', '2024-03-07 15:17:37', NULL, NULL),
(26, 'Bosch', '2024-03-07 15:17:37', NULL, NULL),
(27, 'Denso', '2024-03-07 15:17:37', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
CREATE TABLE IF NOT EXISTS `movimientos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kardex_id` int NOT NULL,
  `cantidad` smallint NOT NULL,
  `saldo` smallint NOT NULL,
  `tipo` char(1) NOT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_kardex_mov` (`kardex_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categoria_id` int NOT NULL,
  `marca_id` int DEFAULT NULL,
  `nombre` varchar(120) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `descripcion` text,
  `precio` decimal(7,2) NOT NULL,
  `imagen` varchar(60) DEFAULT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_categoria_prod` (`categoria_id`),
  KEY `fk_marca_prod` (`marca_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `categoria_id`, `marca_id`, `nombre`, `codigo`, `descripcion`, `precio`, `imagen`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 1, 2, 'Filtro de aceite Fram XYZ', 'COD000000002', 'Filtro de aceite de alta calidad', 15.99, 'imagen2.jpg', '2024-03-07 15:17:37', NULL, NULL),
(2, 2, 5, 'Bujía Denso ABC', 'COD000000003', 'Bujía de platino para un mejor rendimiento', 8.50, 'imagen3.jpg', '2024-03-07 15:17:37', NULL, NULL),
(3, 3, 7, 'Pastillas de freno Brembo 123', 'COD000000004', 'Pastillas de freno de cerámica para un frenado suave', 45.75, 'imagen4.jpg', '2024-03-07 15:17:37', NULL, NULL),
(4, 4, 10, 'Bomba de agua Monroe XYZ', 'COD000000005', 'Bomba de agua de alta eficiencia', 65.30, 'imagen5.jpg', '2024-03-07 15:17:37', NULL, NULL),
(5, 5, 4, 'Correa de distribución NGK 567', 'COD000000006', 'Correa de distribución resistente y duradera', 25.99, 'imagen6.jpg', '2024-03-07 15:17:37', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE IF NOT EXISTS `proveedores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `correo` varchar(120) DEFAULT NULL,
  `ruc` char(11) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`) VALUES
(1, 'Administrador'),
(2, 'Gerente'),
(3, 'Vendedor'),
(4, 'Técnico'),
(5, 'Contador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `empleado_id` int NOT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cliente_ven` (`cliente_id`),
  KEY `fk_empleado_ven` (`empleado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `fk_proveedor_com` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`);

--
-- Filtros para la tabla `detalles_compras`
--
ALTER TABLE `detalles_compras`
  ADD CONSTRAINT `fk_compra_d_c` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`),
  ADD CONSTRAINT `fk_producto_d_c` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `detalles_ventas`
--
ALTER TABLE `detalles_ventas`
  ADD CONSTRAINT `fk_producto_d_v` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `fk_venta_d_v` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `fk_rol_emp` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD CONSTRAINT `fk_almacen_kar` FOREIGN KEY (`almacen_id`) REFERENCES `almacen` (`id`),
  ADD CONSTRAINT `fk_producto_kar` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `fk_kardex_mov` FOREIGN KEY (`kardex_id`) REFERENCES `kardex` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_categoria_prod` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `fk_marca_prod` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_cliente_ven` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `fk_empleado_ven` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
