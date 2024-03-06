<?php

require_once '../models/Categoria.php';

if (isset($_POST['operacion'])) {
	$categoria = new Categoria();
	switch ($_POST['operacion']) {
		case 'listarCategoria':
			echo json_encode($categoria->listarCategoria());
			break;

		case 'registrarCategoria':
			$data = [];
			echo json_encode($categoria->registrarCategoria($data));
			break;

		case 'actualizarCategoria':
			$data = [];
			echo json_encode($categoria->actualizarCategoria($data));
			break;

		case 'eliminarCategoria':
			$id = $_POST['id'];
			echo json_encode($categoria->eliminarCategoria($id));
			break;

		default:
			$operacion = $_POST['operacion'];
			echo "La operacion $operacion no existe";
	}
}
