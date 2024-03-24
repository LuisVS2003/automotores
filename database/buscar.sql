USE automotores;

DROP PROCEDURE IF EXISTS buscarProducto;
DROP PROCEDURE IF EXISTS spu_empleados_login;
DROP PROCEDURE IF EXISTS spu_empleados_buscar_correo;

--  ###################################################################
DELIMITER $$
CREATE PROCEDURE buscarProducto(
	IN _producto VARCHAR(50)
)
BEGIN
	SELECT id, producto, precio FROM vw_producto
	WHERE producto LIKE CONCAT('%', _producto, '%')
		OR descripcion LIKE CONCAT('%', _producto, '%')
        OR categoria LIKE CONCAT('%', _producto, '%')
        OR marca LIKE CONCAT('%', _producto, '%')
    LIMIT 5;
END $$

--  ###################################################################

DELIMITER $$
CREATE PROCEDURE spu_empleados_login(IN _correo VARCHAR(50))
BEGIN
	SELECT
		EMP.id,
        EMP.apellidos,
        EMP.nombres,
        EMP.correo,
        EMP.clave
        FROM empleados EMP
        WHERE 	EMP.correo = _correo AND
		inactive_at IS NULL;
END $$

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE spu_empleados_buscar_correo(IN _correo VARCHAR(50))
BEGIN
    SELECT 
		id,
		apellidos, 
		nombres,
		correo,
		clave
    FROM empleados
    WHERE correo = _correo ;
END $$

-- update empleados set clave = "$2y$10$BpiD/1e639OYnxPu6iaVNuG/E2Fa2JQvXxfK.fmRHmP270Pi1Y9U6";
-- CALL spu_empleados_login('maria@example.com');
