<?php
date_default_timezone_set('America/Lima');
require_once '../models/Producto.php';

if (isset($_POST['operacion'])) {
	$producto = new Producto();
	switch ($_POST['operacion']) {
		case 'listarProducto':
			echo json_encode($producto->listarProducto());
			break;

		case 'obtenerProducto':
			$data = ['id' => $_POST['id']];
			echo json_encode($producto->obtenerProducto($data));
			break;

		case 'registrarProducto':
			$date = date('Y-m-d H:i:s');
			$imgName = sha1($date);
			$extension = strtolower(pathinfo($_FILES['imagen']['name'], PATHINFO_EXTENSION));
			$path = "../images/$imgName.$extension";

			$data = [
				'categoria_id'	=> $_POST['categoria_id'],
				'marca_id'			=> $_POST['marca_id'],
				'nombre'				=> $_POST['nombre'],
				'codigo'				=> $_POST['codigo'],
				'descripcion'		=> $_POST['descripcion'],
				'precio'				=> $_POST['precio'],
				'imagen'				=> '',
			];

			if (move_uploaded_file($_FILES['imagen']['tmp_name'], $path)) {
				$data['imagen'] = "$imgName.$extension";
			}

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
