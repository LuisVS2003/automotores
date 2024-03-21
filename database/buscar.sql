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
        WHERE 	EMP.correo = _correo AND
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


CALL spu_empleados_login('maria@example.com');


