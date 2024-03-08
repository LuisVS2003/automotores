<?php

require_once '../models/Rol.php';

if (isset($_POST['operacion'])) {
	$rol = new Rol();
	switch ($_POST['operacion']) {
		case 'listarRol':
			echo json_encode($rol->listarRol());
			break;

		case 'registrarRol':
			$data = [
				'nombre' => $_POST['nombre']
			];
			echo json_encode($rol->registrarRol($data));
			break;

		case 'actualizarRol':
			$data = [];
			echo json_encode($rol->actualizarRol($data));
			break;

		case 'eliminarRol':
			$id = $_POST['id'];
			echo json_encode($rol->eliminarRol($id));
			break;

		default:
			$operacion = $_POST['operacion'];
			echo "La operacion $operacion no existe";
	}
}
