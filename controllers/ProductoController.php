<?php

require_once '../models/Producto.php';

if (isset($_POST['operacion'])) {
	$producto = new Producto();
	switch ($_POST['operacion']) {
		case 'listarProducto':
			echo json_encode($producto->listarProducto());
			break;

		case 'registrarProducto':
			$data = [];
			echo json_encode($producto->registrarProducto($data));
			break;

		case 'actualizarProducto':
			$data = [];
			echo json_encode($producto->actualizarProducto($data));
			break;

		case 'eliminarProducto':
			$id = $_POST['id'];
			echo json_encode($producto->eliminarProducto($id));
			break;

		default:
			$operacion = $_POST['operacion'];
			echo "La operacion $operacion no existe";
	}
}
