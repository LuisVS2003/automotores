<?php

require_once '../models/Marca.php';

if (isset($_POST['operacion'])) {
	$marca = new Marca();
	switch ($_POST['operacion']) {
		case 'listarMarca':
			echo json_encode($marca->listarMarca());
			break;

		case 'registrarMarca':
			$data = [
				'nombre' => $_POST['nombre']
			];
			echo json_encode($marca->registrarMarca($data));
			break;

		case 'actualizarMarca':
			$data = [];
			echo json_encode($marca->actualizarMarca($data));
			break;

		case 'eliminarMarca':
			$id = $_POST['id'];
			echo json_encode($marca->eliminarMarca($id));
			break;

		default:
			$operacion = $_POST['operacion'];
			echo "La operacion $operacion no existe";
	}
}
