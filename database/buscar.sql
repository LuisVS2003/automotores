USE automotores;

DROP PROCEDURE IF EXISTS buscarProducto;

--  ###################################################################
DELIMITER $$
CREATE PROCEDURE buscarProducto(
	IN _producto VARCHAR(50)
)
BEGIN
	SELECT id, producto FROM vw_producto
	WHERE producto LIKE CONCAT('%', _producto, '%')
    LIMIT 5;
END $$

--  ##########

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
        WHERE 	EMP.correo = _correo COLLATE utf8mb4_general_ci AND
		inactive_at IS NULL;
END $$

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

SELECT * FROM clientes;
SELECT * FROM empleados;

update empleados set clave = "$2y$10$BpiD/1e639OYnxPu6iaVNuG/E2Fa2JQvXxfK.fmRHmP270Pi1Y9U6";


CALL spu_empleados_login("maria@example.com");


