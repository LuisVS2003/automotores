<!DOCTYPE html>
<html lang="es" class="dark">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Registrar Empleado</title>
	<?php require_once './layouts/link-css.html'; ?>
</head>

<body>
	<?php require_once './layouts/navbar.html'; ?>
	<!-- <div id="backdrop-modal" class="backdrop hidden" style="z-index:100;"></div> -->

	<div class="container">
		<?php require_once './layouts/sidebar.html'; ?>

		<div class="content sidebar-toggle">
			<main class="content-main">
				<form id="form-empleado" action="" method="post" autocomplete="off">
					<div class="label-input">
						<label for="select-rol" class="form-label">Rol:</label>
						<select id="select-rol" class="form-select">
							<option value="">Seleccione</option>
						</select>
					</div>
					<div class="label-input">
						<label for="input-nombres" class="form-label">Nombres:</label>
						<input id="input-nombres" type="text" class="form-input">
					</div>
					<div class="label-input">
						<label for="input-apellidos" class="form-label">Apellidos:</label>
						<input id="input-apellidos" type="text" class="form-input">
					</div>
					<div class="label-input">
						<label for="input-dni" class="form-label">DNI:</label>
						<input id="input-dni" type="text" class="form-input">
					</div>
					<div class="label-input">
						<label for="input-correo" class="form-label">Correo:</label>
						<input id="input-correo" type="mail" class="form-input">
					</div>
					<div class="label-input">
						<label for="input-clave" class="form-label">Contraseña:</label>
						<input id="input-clave" type="mail" class="form-input">
					</div>
					<div class="label-input">
						<label for="input-direccion" class="form-label">Dirrección:</label>
						<input id="input-direccion" type="text" class="form-input">
					</div>
					<div class="label-input">
						<label for="input-salario" class="form-label">Salario</label>
						<input id="input-salario" type="number" class="form-input">
					</div>
					<button type="submit" class="button">Registrar</button>
				</form>
			</main>
		</div>
	</div>

	<?php require_once './layouts/script-js.html'; ?>
	<script src="./js/ajax/empleado.js"></script>
	<script>
		document.addEventListener('DOMContentLoaded', () => {
			getRol();

			const addEmpleado = async () => {
				const dataForm = new FormData();
				dataForm.append('operacion', 'registrarEmpleado');
				dataForm.append('rol_id', $('#select-rol').value);
				dataForm.append('nombres', $('#input-nombres').value);
				dataForm.append('apellidos', $('#input-apellidos').value);
				dataForm.append('dni', $('#input-dni').value);
				dataForm.append('correo', $('#input-correo').value);
				dataForm.append('clave', $('#input-clave').value);
				dataForm.append('direccion', $('#input-direccion').value);
				dataForm.append('salario', $('#input-salario').value);

				const data = await dataFetch(URL_EMPLEADO, dataForm)
				console.log(data);
			}

			$('#form-empleado').addEventListener('submit', e => {
				e.preventDefault();
				addEmpleado();
			});
		})
	</script>
</body>

</html>