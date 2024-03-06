<?php

require_once '../models/Movimiento.php';

if (isset($_POST['operacion'])) {
	$movimiento = new Movimiento();
	switch ($_POST['operacion']) {
		case 'listarMovimiento':
			echo json_encode($movimiento->listarMovimiento());
			break;

		case 'registrarMovimiento':
			$data = [];
			echo json_encode($movimiento->registrarMovimiento($data));
			break;

		case 'actualizarMovimiento':
			$data = [];
			echo json_encode($movimiento->actualizarMovimiento($data));
			break;

		case 'eliminarMovimiento':
			$id = $_POST['id'];
			echo json_encode($movimiento->eliminarMovimiento($id));
			break;

		default:
			$operacion = $_POST['operacion'];
			echo "La operacion $operacion no existe";
	}
}
