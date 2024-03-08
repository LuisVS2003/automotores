<?php

require_once '../models/DetalleCompra.php';

if (isset($_POST['operacion'])) {
	$detalleCompra = new DetalleCompra();
	switch ($_POST['operacion']) {
		case 'listarDetalleCompra':
			echo json_encode($detalleCompra->listarDetalleCompra());
			break;

		case 'registrarDetalleCompra':
			$data = [
				'compra_id'		=> 	$_POST['compra_id'],
				'producto_id'	=> 	$_POST['producto_id'],
				'cantidad'		=> 	$_POST['cantidad']
			];
			echo json_encode($detalleCompra->registrarDetalleCompra($data));
			break;

		case 'actualizarDetalleCompra':
			$data = [];
			echo json_encode($detalleCompra->actualizarDetalleCompra($data));
			break;

		case 'eliminarDetalleCompra':
			$id = $_POST['id'];
			echo json_encode($detalleCompra->eliminarDetalleCompra($id));
			break;

		default:
			$operacion = $_POST['operacion'];
			echo "La operacion $operacion no existe";
	}
}
