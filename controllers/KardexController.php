<?php

require_once '../models/Kardex.php';

if (isset($_POST['operacion'])) {
	$kardex = new Kardex();
	switch ($_POST['operacion']) {
		case 'listarKardex':
			echo json_encode($kardex->listarKardex());
			break;

		case 'registrarKardex':
			$data = [];
			echo json_encode($kardex->registrarKardex($data));
			break;

		case 'actualizarKardex':
			$data = [];
			echo json_encode($kardex->actualizarKardex($data));
			break;

		case 'eliminarKardex':
			$id = $_POST['id'];
			echo json_encode($kardex->eliminarKardex($id));
			break;

		default:
			$operacion = $_POST['operacion'];
			echo "La operacion $operacion no existe";
	}
}
