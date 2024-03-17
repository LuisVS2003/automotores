USE automotores;

DROP PROCEDURE IF EXISTS buscarProducto;

-- ###################################################################
DELIMITER $$
CREATE PROCEDURE buscarProducto(
	IN _producto VARCHAR(50)
)
BEGIN
	SELECT id, producto FROM vw_producto
	WHERE producto LIKE CONCAT('%', _producto, '%')
    LIMIT 5;
END $$

