<?php

require_once '../models/Proveedor.php';

if (isset($_POST['operacion'])) {
	$proveedor = new Proveedor();
	switch ($_POST['operacion']) {
		case 'listarProveedor':
			echo json_encode($proveedor->listarProveedor());
			break;

		case 'registrarProveedor':
			$data = [
				'nombre'		=> $_POST['nombre'],
				'telefono'	=> $_POST['telefono'],
				'correo'		=> $_POST['correo'],
				'ruc'				=> $_POST['ruc'],
				'direccion' => $_POST['direccion'],
			];
			echo json_encode($proveedor->registrarProveedor($data));
			break;

		case 'actualizarProveedor':
			$data = [];
			echo json_encode($proveedor->actualizarProveedor($data));
			break;

		case 'eliminarProveedor':
			$id = $_POST['id'];
			echo json_encode($proveedor->eliminarProveedor($id));
			break;

		default:
			$operacion = $_POST['operacion'];
			echo "La operacion $operacion no existe";
	}
}
