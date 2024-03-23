<?php
// $clave = "SENATI123";
// $claveEncript = password_hash($clave, PASSWORD_BCRYPT);

// echo $claveEncript;

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

			// var_dump($registro);

			if (isset($_POST["clave"])) {
				// Process form data
				if ($registro == false) {
					# code...
					$_SESSION["status"] = false;
					$statusLogin["mensaje"] = "El correo no existe";
				} else {
					$claveEnc = $registro[0]['clave'];
					$_SESSION["nombres"] = $registro[0]['nombres'];
					// $_SESSION["apellidos"] = $registro[0]["apellidos"];
					$_SESSION["correo"] = $registro[0]["correo"];

					if (password_verify($_POST["clave"], $claveEnc)) {
						# code...
						$_SESSION["status"] = true;
						$statusLogin["acesso"] = true;
						$statusLogin["mensaje"] = "La clave y el acceso son correctos";
					} else {
						$_SESSION["status"] = true;
						$statusLogin["mensaje"] = "Error en la clave";
					}
				}
			} else {
				// Handle case where "clave" key is missing
				echo "Error: 'clave' key is missing in the form data.";
			}



			echo json_encode($statusLogin);
			// echo $registro;

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
