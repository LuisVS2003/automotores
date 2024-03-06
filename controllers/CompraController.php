<?php

require_once '../models/Compra.php';

if (isset($_POST['operacion'])) {
	$compra = new Compra();
	switch ($_POST['operacion']) {
		case 'listarCompra':
			echo json_encode($compra->listarCompra());
			break;

		case 'registrarCompra':
			$data = [];
			echo json_encode($compra->registrarCompra($data));
			break;

		case 'actualizarCompra':
			$data = [];
			echo json_encode($compra->actualizarCompra($data));
			break;

		case 'eliminarCompra':
			$id = $_POST['id'];
			echo json_encode($compra->eliminarCompra($id));
			break;

		default:
			$operacion = $_POST['operacion'];
			echo "La operacion $operacion no existe";
	}
}
