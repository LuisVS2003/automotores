<?php

require_once '../models/DetalleVenta.php';

if (isset($_POST['operacion'])) {
	$detalleVenta = new DetalleVenta();
	switch ($_POST['operacion']) {
		case 'listarDetalleVenta':
			echo json_encode($detalleVenta->listarDetalleVenta());
			break;

		case 'registrarDetalleVenta':
			$data = [
				'venta_id'		=> 	$_POST['venta_id'],
				'producto_id'	=> 	$_POST['producto_id'],
				'cantidad'		=> 	$_POST['cantidad']
			];
			echo json_encode($detalleVenta->registrarDetalleVenta($data));
			break;

		case 'actualizarDetalleVenta':
			$data = [];
			echo json_encode($detalleVenta->actualizarDetalleVenta($data));
			break;

		case 'eliminarDetalleVenta':
			$id = $_POST['id'];
			echo json_encode($detalleVenta->eliminarDetalleVenta($id));
			break;

		default:
			$operacion = $_POST['operacion'];
			echo "La operacion $operacion no existe";
	}
}
