<?php

require_once '../models/Producto.php';

if (isset($_POST['operacion'])) {
	$producto = new Producto();
	switch ($_POST['operacion']) {
		case 'listarProducto':
			echo json_encode($producto->listarProducto());
			break;

		case 'registrarProducto':
			$data = [
				'categoria_id'	=> $_POST['categoria_id'],
				'marca_id'			=> $_POST['marca_id'],
				'nombre'				=> $_POST['nombre'],
				'codigo'				=> $_POST['codigo'],
				'descripcion'		=> $_POST['descripcion'],
				'precio'				=> $_POST['precio'],
				'imagen'				=> $_POST['imagen'],
			];
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

		case 'buscarProducto':
			$nombre = $_POST['nombre'];
			echo json_encode($producto->buscarProducto($nombre));
			break;

		default:
			$operacion = $_POST['operacion'];
			echo "La operacion $operacion no existe";
	}
}
