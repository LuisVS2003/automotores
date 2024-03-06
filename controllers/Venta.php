<?php

require_once '../models/Venta.php';

if (isset($_POST['operacion'])) {
	$venta = new Venta();
	switch ($_POST['operacion']) {
		case 'listarVenta':
			echo json_encode($venta->listarVenta());
			break;

		case 'registrarVenta':
			$data = [];
			echo json_encode($venta->registrarVenta($data));
			break;

		case 'actualizarVenta':
			$data = [];
			echo json_encode($venta->actualizarVenta($data));
			break;

		case 'eliminarVenta':
			$id = $_POST['id'];
			echo json_encode($venta->eliminarVenta($id));
			break;

		default:
			$operacion = $_POST['operacion'];
			echo "La operacion $operacion no existe";
	}
}
