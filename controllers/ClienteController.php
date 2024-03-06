<?php

require_once '../models/Cliente.php';

if (isset($_POST['operacion'])) {
	$cliente = new Cliente();
	switch ($_POST['operacion']) {
		case 'listarCliente':
			echo json_encode($cliente->listarCliente());
			break;

		case 'registrarCliente':
			$data = [];
			echo json_encode($cliente->registrarCliente($data));
			break;

		case 'actualizarCliente':
			$data = [];
			echo json_encode($cliente->actualizarCliente($data));
			break;

		case 'eliminarCliente':
			$id = $_POST['id'];
			echo json_encode($cliente->eliminarCliente($id));
			break;

		default:
			$operacion = $_POST['operacion'];
			echo "La operacion $operacion no existe";
	}
}
