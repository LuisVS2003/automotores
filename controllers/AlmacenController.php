<?php

require_once '../models/Almacen.php';

if (isset($_POST['operacion'])) {
	$almacen = new Almacen();
	switch ($_POST['operacion']) {
		case 'listarAlmacen':
			echo json_encode($almacen->listarAlmacen());
			break;

		case 'registrarAlmacen':
			$data = [];
			echo json_encode($almacen->registrarAlmacen($data));
			break;

		case 'actualizarAlmacen':
			$data = [];
			echo json_encode($almacen->actualizarAlmacen($data));
			break;

		case 'eliminarAlmacen':
			$id = $_POST['id'];
			echo json_encode($almacen->eliminarAlmacen($id));
			break;

		default:
			$operacion = $_POST['operacion'];
			echo "La operacion $operacion no existe";
	}
}
