-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-03-2024 a las 15:11:12
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarCategorias` ()   BEGIN
    SELECT
		id, nombre
    FROM categorias
    WHERE inactive_at IS NULL
    ORDER BY nombre;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarClientes` ()   BEGIN
    SELECT * FROM clientes;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarCompras` ()   BEGIN
    SELECT
		COM.id,
        COM.proveedor_id,
        PRO.nombre AS proveedor
    FROM compras COM
    INNER JOIN proveedores PRO ON PRO.id = COM.proveedor_id
    WHERE COM.inactive_at IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarDetallesCompras` ()   BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarDetallesVentas` ()   BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarEmpleados` ()   BEGIN
    SELECT * FROM vw_empleado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarKardex` ()   BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarMarcas` ()   BEGIN
    SELECT
		id, nombre
    FROM marcas
    WHERE inactive_at IS NULL
    ORDER BY nombre;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarMovimientos` ()   BEGIN
    SELECT
		id,
        kardex_id,
        cantidad,
        saldo,
        tipo
    FROM movimientos
    WHERE inactive_at IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarProductos` ()   BEGIN
    SELECT * FROM vw_producto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarProveedores` ()   BEGIN
    SELECT * FROM vw_proveedor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarRoles` ()   BEGIN
    SELECT
		id, nombre
    FROM roles
    ORDER BY nombre;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarVentas` ()   BEGIN
    SELECT
		VEN.id,
        VEN.cliente_id,
        VEN.empleado_id,
        CLI.nombres AS cliente,
        CONCAT(EMP.apellidos, ", ", EMP.nombres) AS empleado
    FROM ventas VEN
    LEFT JOIN clientes CLI ON CLI.id = VEN.cliente_id
    INNER JOIN empleados EMP ON EMP.id = VEN.empleado_id
    WHERE VEN.inactive_at IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarAlmacen` (IN `_direccion` VARCHAR(255), IN `_referencia` VARCHAR(255), IN `_latitud` VARCHAR(15), IN `_longitud` VARCHAR(15))   BEGIN
    INSERT INTO almacen
		(direccion, referencia, latitud, longitud)
    VALUES
		(_direccion, _referencia, _latitud, _longitud);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarCategoria` (IN `_nombre` VARCHAR(50))   BEGIN
    INSERT INTO categorias(nombre)
    VALUES (_nombre);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarCliente` (IN `_nombres` VARCHAR(50), IN `_apellidos` VARCHAR(50), IN `_dni` CHAR(8), IN `_correo` VARCHAR(120), IN `_clave` VARCHAR(60))   BEGIN
    INSERT INTO clientes
		(nombres, apellidos, dni, correo, clave)
    VALUES
		(_nombres, _apellidos, _dni, _correo, _clave);

    SELECT LAST_INSERT_ID() 'id';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarCompra` (IN `_proveedor_id` INT)   BEGIN
    INSERT INTO compras (proveedor_id)
    VALUES (_proveedor_id);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarDetalleCompra` (IN `_compra_id` INT, IN `_producto_id` INT, IN `_cantidad` SMALLINT)   BEGIN
    INSERT INTO detalles_compras
		(compra_id, producto_id, cantidad)
    VALUES
		(_compra_id, _producto_id, _cantidad);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarDetalleVenta` (IN `_venta_id` INT, IN `_producto_id` INT, IN `_cantidad` SMALLINT)   BEGIN
    INSERT INTO detalles_ventas
		(venta_id, producto_id, cantidad)
    VALUES
		(_venta_id, _producto_id, _cantidad);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarEmpleado` (IN `_rol_id` INT, IN `_nombres` VARCHAR(50), IN `_apellidos` VARCHAR(50), IN `_dni` CHAR(8), IN `_correo` VARCHAR(120), IN `_clave` VARCHAR(60), IN `_direccion` VARCHAR(255), IN `_salario` DECIMAL(9,2))   BEGIN
    INSERT INTO empleados
		(rol_id, nombres, apellidos, dni, correo, clave, direccion, salario)
    VALUES
		(_rol_id, _nombres, _apellidos, _dni, _correo, _clave, _direccion, _salario);

    SELECT LAST_INSERT_ID() 'id';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarKardex` (IN `_producto_id` INT, IN `_almacen_id` INT, IN `_minimo` SMALLINT, IN `_maximo` SMALLINT)   BEGIN
    INSERT INTO kardex
		(producto_id, almacen_id, minimo, maximo)
    VALUES
		(_producto_id, _almacen_id, _minimo, _maximo);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarMarca` (IN `_nombre` VARCHAR(50))   BEGIN
    INSERT INTO marcas(nombre)
    VALUES (_nombre);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarMovimientoCompra` (IN `_kardex_id` INT, IN `_cantidad` SMALLINT)   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarMovimientoVenta` (IN `_kardex_id` INT, IN `_cantidad` SMALLINT)   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarProducto` (IN `_categoria_id` INT, IN `_marca_id` INT, IN `_nombre` VARCHAR(120), IN `_codigo` VARCHAR(20), IN `_descripcion` TEXT, IN `_precio` DECIMAL(7,2), IN `_imagen` VARCHAR(60))   BEGIN
    INSERT INTO productos
		(categoria_id, marca_id, nombre, codigo, descripcion, precio, imagen)
    VALUES
		(_categoria_id, IFNULL(_marca_id, ''), _nombre, _codigo, _descripcion, _precio, _imagen);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarProveedor` (IN `_nombre` VARCHAR(80), IN `_telefono` VARCHAR(9), IN `_correo` VARCHAR(120), IN `_ruc` CHAR(11), IN `_direccion` VARCHAR(255))   BEGIN
    INSERT INTO proveedores
		(nombre, telefono, correo, ruc, direccion)
    VALUES
		(_nombre, _telefono, _correo, _ruc, _direccion);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarRol` (IN `_nombre` VARCHAR(20))   BEGIN
    INSERT INTO roles (nombre)
    VALUES (_nombre);

    SELECT LAST_INSERT_ID() 'id';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarVenta` (IN `_cliente_id` INT, IN `_empleado_id` INT)   BEGIN
    INSERT INTO ventas (cliente_id, empleado_id)
    VALUES (_cliente_id, _empleado_id);
        
    SELECT LAST_INSERT_ID() 'id';
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE `almacen` (
  `id` int(11) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `referencia` varchar(255) DEFAULT NULL,
  `latitud` varchar(15) DEFAULT NULL,
  `longitud` varchar(15) DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `almacen`
--

INSERT INTO `almacen` (`id`, `direccion`, `referencia`, `latitud`, `longitud`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 'Lima', NULL, NULL, NULL, '2024-03-11 09:05:28', NULL, NULL),
(2, 'Chincha', NULL, NULL, NULL, '2024-03-11 09:05:28', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 'Filtro de aceite', '2024-03-11 09:05:28', NULL, NULL),
(2, 'Bujias', '2024-03-11 09:05:28', NULL, NULL),
(3, 'Pastillas de freno', '2024-03-11 09:05:28', NULL, NULL),
(4, 'Bomba de agua', '2024-03-11 09:05:28', NULL, NULL),
(5, 'Correa de distribución', '2024-03-11 09:05:28', NULL, NULL),
(6, 'Batería', '2024-03-11 09:05:28', NULL, NULL),
(7, 'Rotor de freno', '2024-03-11 09:05:28', NULL, NULL),
(8, 'Alternador', '2024-03-11 09:05:28', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `dni` char(8) DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombres`, `apellidos`, `dni`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 'Alejandra Flores Velasco', NULL, NULL, '2024-03-11 09:05:28', NULL, NULL),
(2, 'Manuel Díaz Torres', NULL, NULL, '2024-03-11 09:05:28', NULL, NULL),
(3, 'Patricia Gómez Sánchez', NULL, NULL, '2024-03-11 09:05:28', NULL, NULL),
(4, 'Ricardo López Herrera', NULL, NULL, '2024-03-11 09:05:28', NULL, NULL),
(5, 'Laura Martínez Ramírez', NULL, NULL, '2024-03-11 09:05:28', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `proveedor_id`, `empleado_id`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 1, 2, '2024-03-11 09:06:15', NULL, NULL),
(2, 2, 1, '2024-03-11 09:06:15', NULL, NULL),
(3, 3, 3, '2024-03-11 09:06:15', NULL, NULL),
(4, 1, 2, '2024-03-11 09:06:15', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_compras`
--

CREATE TABLE `detalles_compras` (
  `id` int(11) NOT NULL,
  `compra_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` smallint(6) NOT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalles_compras`
--

INSERT INTO `detalles_compras` (`id`, `compra_id`, `producto_id`, `cantidad`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 1, 1, 10, '2024-03-11 09:06:15', NULL, NULL),
(2, 1, 2, 5, '2024-03-11 09:06:15', NULL, NULL),
(3, 1, 3, 15, '2024-03-11 09:06:15', NULL, NULL),
(4, 2, 2, 5, '2024-03-11 09:06:15', NULL, NULL),
(5, 2, 5, 20, '2024-03-11 09:06:15', NULL, NULL),
(6, 3, 1, 15, '2024-03-11 09:06:15', NULL, NULL),
(7, 4, 1, 30, '2024-03-11 09:06:15', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_ventas`
--

CREATE TABLE `detalles_ventas` (
  `id` int(11) NOT NULL,
  `venta_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` smallint(6) NOT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalles_ventas`
--

INSERT INTO `detalles_ventas` (`id`, `venta_id`, `producto_id`, `cantidad`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 1, 1, 5, '2024-03-11 09:06:15', NULL, NULL),
(2, 1, 2, 2, '2024-03-11 09:06:15', NULL, NULL),
(3, 1, 3, 7, '2024-03-11 09:06:15', NULL, NULL),
(4, 2, 2, 1, '2024-03-11 09:06:15', NULL, NULL),
(5, 2, 5, 10, '2024-03-11 09:06:15', NULL, NULL),
(6, 3, 1, 10, '2024-03-11 09:06:15', NULL, NULL),
(7, 4, 1, 10, '2024-03-11 09:06:15', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `dni` char(8) NOT NULL,
  `correo` varchar(120) NOT NULL,
  `clave` varchar(60) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `salario` decimal(9,2) DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `rol_id`, `nombres`, `apellidos`, `dni`, `correo`, `clave`, `direccion`, `salario`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 1, 'Juan', 'Pérez', '12345678', 'juan@example.com', 'clave123', 'Calle 123', '2000.00', '2024-03-11 09:05:28', NULL, NULL),
(2, 2, 'María', 'González', '87654321', 'maria@example.com', 'clave456', 'Avenida 456', '2500.00', '2024-03-11 09:05:28', NULL, NULL),
(3, 3, 'Carlos', 'Martínez', '23456789', 'carlos@example.com', 'clave789', 'Plaza 789', '1800.00', '2024-03-11 09:05:28', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex`
--

CREATE TABLE `kardex` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `almacen_id` int(11) NOT NULL,
  `minimo` smallint(6) DEFAULT NULL,
  `maximo` smallint(6) DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `kardex`
--

INSERT INTO `kardex` (`id`, `producto_id`, `almacen_id`, `minimo`, `maximo`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 1, 1, NULL, NULL, '2024-03-11 09:05:28', NULL, NULL),
(2, 2, 1, NULL, NULL, '2024-03-11 09:05:28', NULL, NULL),
(3, 1, 2, NULL, NULL, '2024-03-11 09:05:28', NULL, NULL),
(4, 3, 2, NULL, NULL, '2024-03-11 09:05:28', NULL, NULL),
(5, 4, 2, NULL, NULL, '2024-03-11 09:05:28', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `nombre`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 'Bosch', '2024-03-11 09:05:28', NULL, NULL),
(2, 'Fram', '2024-03-11 09:05:28', NULL, NULL),
(3, 'Purolator', '2024-03-11 09:05:28', NULL, NULL),
(4, 'NGK', '2024-03-11 09:05:28', NULL, NULL),
(5, 'Denso', '2024-03-11 09:05:28', NULL, NULL),
(6, 'Champion', '2024-03-11 09:05:28', NULL, NULL),
(7, 'Brembo', '2024-03-11 09:05:28', NULL, NULL),
(8, 'Wagner', '2024-03-11 09:05:28', NULL, NULL),
(9, 'Akebono', '2024-03-11 09:05:28', NULL, NULL),
(10, 'Monroe', '2024-03-11 09:05:28', NULL, NULL),
(11, 'KYB', '2024-03-11 09:05:28', NULL, NULL),
(12, 'Bilstein', '2024-03-11 09:05:28', NULL, NULL),
(13, 'Gates', '2024-03-11 09:05:28', NULL, NULL),
(14, 'ACDelco', '2024-03-11 09:05:28', NULL, NULL),
(15, 'GMB', '2024-03-11 09:05:28', NULL, NULL),
(16, 'Gates', '2024-03-11 09:05:28', NULL, NULL),
(17, 'Continental', '2024-03-11 09:05:28', NULL, NULL),
(18, 'Dayco', '2024-03-11 09:05:28', NULL, NULL),
(19, 'Interstate', '2024-03-11 09:05:28', NULL, NULL),
(20, 'Optima', '2024-03-11 09:05:28', NULL, NULL),
(21, 'AC Delco', '2024-03-11 09:05:28', NULL, NULL),
(22, 'K&N', '2024-03-11 09:05:28', NULL, NULL),
(23, 'Fram', '2024-03-11 09:05:28', NULL, NULL),
(24, 'Wagner', '2024-03-11 09:05:28', NULL, NULL),
(25, 'ACDelco', '2024-03-11 09:05:28', NULL, NULL),
(26, 'Bosch', '2024-03-11 09:05:28', NULL, NULL),
(27, 'Denso', '2024-03-11 09:05:28', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `id` int(11) NOT NULL,
  `kardex_id` int(11) NOT NULL,
  `cantidad` smallint(6) NOT NULL,
  `saldo` smallint(6) NOT NULL,
  `tipo` char(1) NOT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`id`, `kardex_id`, `cantidad`, `saldo`, `tipo`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 1, 10, 10, 'E', '2024-03-11 09:05:28', NULL, NULL),
(2, 2, 20, 20, 'E', '2024-03-11 09:05:28', NULL, NULL),
(3, 3, 30, 30, 'E', '2024-03-11 09:05:28', NULL, NULL),
(4, 4, 40, 40, 'E', '2024-03-11 09:05:28', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `marca_id` int(11) DEFAULT NULL,
  `nombre` varchar(120) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(7,2) NOT NULL,
  `imagen` varchar(60) DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `categoria_id`, `marca_id`, `nombre`, `codigo`, `descripcion`, `precio`, `imagen`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 1, 2, 'Filtro de aceite Fram XYZ', 'COD000000002', 'Filtro de aceite de alta calidad', '15.99', 'imagen2.jpg', '2024-03-11 09:05:28', NULL, NULL),
(2, 2, 5, 'Bujía Denso ABC', 'COD000000003', 'Bujía de platino para un mejor rendimiento', '8.50', 'imagen3.jpg', '2024-03-11 09:05:28', NULL, NULL),
(3, 3, 7, 'Pastillas de freno Brembo 123', 'COD000000004', 'Pastillas de freno de cerámica para un frenado suave', '45.75', 'imagen4.jpg', '2024-03-11 09:05:28', NULL, NULL),
(4, 4, 10, 'Bomba de agua Monroe XYZ', 'COD000000005', 'Bomba de agua de alta eficiencia', '65.30', 'imagen5.jpg', '2024-03-11 09:05:28', NULL, NULL),
(5, 5, 4, 'Correa de distribución NGK 567', 'COD000000006', 'Correa de distribución resistente y duradera', '25.99', 'imagen6.jpg', '2024-03-11 09:05:28', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `correo` varchar(120) DEFAULT NULL,
  `ruc` char(11) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `nombre`, `telefono`, `correo`, `ruc`, `direccion`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 'Tech Solutions Inc.', '555123456', 'info@techsolutions.com', '12345678912', '123 Main Street', '2024-03-11 09:05:28', NULL, NULL),
(2, 'Fresh Foods LLC', '444987654', 'contact@freshfoods.com', '98765432145', '456 Oak Avenue', '2024-03-11 09:05:28', NULL, NULL),
(3, 'Green Energy Corp.', '333555999', 'info@greenenergy.com', '55555555578', '789 Elm Street', '2024-03-11 09:05:28', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 'Administrador', '2024-03-11 09:05:28', NULL, NULL),
(2, 'Gerente', '2024-03-11 09:05:28', NULL, NULL),
(3, 'Vendedor', '2024-03-11 09:05:28', NULL, NULL),
(4, 'Técnico', '2024-03-11 09:05:28', NULL, NULL),
(5, 'Contador', '2024-03-11 09:05:28', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `empleado_id` int(11) NOT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `cliente_id`, `empleado_id`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 1, 1, '2024-03-11 09:05:58', NULL, NULL),
(2, 2, 1, '2024-03-11 09:05:58', NULL, NULL),
(3, NULL, 2, '2024-03-11 09:05:58', NULL, NULL),
(4, NULL, 3, '2024-03-11 09:05:58', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_cliente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_cliente` (
`id` int(11)
,`nombres` varchar(50)
,`apellidos` varchar(50)
,`dni` char(8)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_empleado`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_empleado` (
`id` int(11)
,`rol_id` int(11)
,`nombre_completo` varchar(102)
,`rol` varchar(20)
,`dni` char(8)
,`correo` varchar(120)
,`direccion` varchar(255)
,`salario` decimal(9,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_producto`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_producto` (
`id` int(11)
,`categoria_id` int(11)
,`marca_id` int(11)
,`producto` varchar(120)
,`categoria` varchar(50)
,`marca` varchar(50)
,`cantidad` int(6)
,`codigo` varchar(20)
,`descripcion` text
,`precio` decimal(7,2)
,`imagen` varchar(60)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_proveedor`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_proveedor` (
`id` int(11)
,`nombre` varchar(80)
,`telefono` varchar(9)
,`correo` varchar(120)
,`ruc` char(11)
,`direccion` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_cliente`
--
DROP TABLE IF EXISTS `vw_cliente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_cliente`  AS SELECT `clientes`.`id` AS `id`, `clientes`.`nombres` AS `nombres`, `clientes`.`apellidos` AS `apellidos`, `clientes`.`dni` AS `dni` FROM `clientes` WHERE `clientes`.`inactive_at` is null ORDER BY `clientes`.`nombres` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_empleado`
--
DROP TABLE IF EXISTS `vw_empleado`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_empleado`  AS SELECT `emp`.`id` AS `id`, `emp`.`rol_id` AS `rol_id`, concat(`emp`.`apellidos`,', ',`emp`.`nombres`) AS `nombre_completo`, `rol`.`nombre` AS `rol`, `emp`.`dni` AS `dni`, `emp`.`correo` AS `correo`, `emp`.`direccion` AS `direccion`, `emp`.`salario` AS `salario` FROM (`empleados` `emp` join `roles` `rol` on(`rol`.`id` = `emp`.`rol_id`)) WHERE `emp`.`inactive_at` is null ORDER BY concat(`emp`.`apellidos`,', ',`emp`.`nombres`) ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_producto`
--
DROP TABLE IF EXISTS `vw_producto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_producto`  AS SELECT `pro`.`id` AS `id`, `pro`.`categoria_id` AS `categoria_id`, `pro`.`marca_id` AS `marca_id`, `pro`.`nombre` AS `producto`, `cat`.`nombre` AS `categoria`, `mar`.`nombre` AS `marca`, coalesce((select `movimientos`.`saldo` from `movimientos` where `movimientos`.`kardex_id` = `kar`.`id` order by `movimientos`.`id` desc limit 1),0) AS `cantidad`, `pro`.`codigo` AS `codigo`, `pro`.`descripcion` AS `descripcion`, `pro`.`precio` AS `precio`, `pro`.`imagen` AS `imagen` FROM (((`kardex` `kar` join `productos` `pro` on(`pro`.`id` = `kar`.`id`)) join `categorias` `cat` on(`cat`.`id` = `pro`.`categoria_id`)) join `marcas` `mar` on(`mar`.`id` = `pro`.`marca_id`)) WHERE `pro`.`inactive_at` is null AND `cat`.`inactive_at` is null AND `mar`.`inactive_at` is null ORDER BY `pro`.`nombre` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_proveedor`
--
DROP TABLE IF EXISTS `vw_proveedor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_proveedor`  AS SELECT `proveedores`.`id` AS `id`, `proveedores`.`nombre` AS `nombre`, `proveedores`.`telefono` AS `telefono`, `proveedores`.`correo` AS `correo`, `proveedores`.`ruc` AS `ruc`, `proveedores`.`direccion` AS `direccion` FROM `proveedores` WHERE `proveedores`.`inactive_at` is null ORDER BY `proveedores`.`nombre` ASC  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_proveedor_com` (`proveedor_id`);

--
-- Indices de la tabla `detalles_compras`
--
ALTER TABLE `detalles_compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_compra_d_c` (`compra_id`),
  ADD KEY `fk_producto_d_c` (`producto_id`);

--
-- Indices de la tabla `detalles_ventas`
--
ALTER TABLE `detalles_ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_venta_d_v` (`venta_id`),
  ADD KEY `fk_producto_d_v` (`producto_id`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rol_emp` (`rol_id`);

--
-- Indices de la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producto_kar` (`producto_id`),
  ADD KEY `fk_almacen_kar` (`almacen_id`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_kardex_mov` (`kardex_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_categoria_prod` (`categoria_id`),
  ADD KEY `fk_marca_prod` (`marca_id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cliente_ven` (`cliente_id`),
  ADD KEY `fk_empleado_ven` (`empleado_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacen`
--
ALTER TABLE `almacen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalles_compras`
--
ALTER TABLE `detalles_compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `detalles_ventas`
--
ALTER TABLE `detalles_ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `kardex`
--
ALTER TABLE `kardex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
