<?php

session_start();

require_once '../models/Empleado.php';

if (isset($_POST['operacion'])) {
	$empleado = new Empleado();
	switch ($_POST['operacion']) {
		case 'listarEmpleado':
			echo json_encode($empleado->listarEmpleado());
			break;

		case 'login':
			$dataSend = [
				'correo'	=> $_POST['correo']
			];

			$registro = $empleado->loginEmpleado($dataSend);

			$statusLogin = [
				"acesso"	=> false,
				"mensaje"	=> ""
			];

			if ($registro == false) {
				# code...
				$_SESSION["status"] = false;
				$statusLogin["mensaje"] = "El correo no existe";
			} else {
				// $_SESSION["apellidos"] = $registro["apellidos"];
				// $_SESSION["clave"] = $registro["clave"];

				$_SESSION["status"] = true;
				$statusLogin["acesso"] = true;
				$statusLogin["mensaje"] = "La clave y el acceso son correctos";
			}

			echo json_encode($statusLogin);

			break;

		case 'registrarEmpleado':
			$data = [
				'rol_id' 		=> $_POST['rol_id'],
				'nombres' 	=> $_POST['nombres'],
				'apellidos' => $_POST['apellidos'],
				'dni' 			=> $_POST['dni'],
				'correo' 		=> $_POST['correo'],
				'clave' 		=> $_POST['clave'],
				'direccion' => $_POST['direccion'],
				'salario' 	=> $_POST['salario']
			];

			echo json_encode($empleado->registrarEmpleado($data));
			break;

		case 'actualizarEmpleado':
			$data = [];
			echo json_encode($empleado->actualizarEmpleado($data));
			break;

		case 'eliminarEmpleado':
			$id = $_POST['id'];
			echo json_encode($empleado->eliminarEmpleado($id));
			break;

		default:
			$operacion = $_POST['operacion'];
			echo "La operacion $operacion no existe";
	}
}

if (isset($_GET['operacion'])) {
	if ($_GET['operacion'] == 'destroy') {
		session_destroy();
		session_unset();

		header("Location: ../index.php");
	}
}
