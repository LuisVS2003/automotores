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
				<?php require_once './layouts/registrar-empleado.html'; ?>
			</main>
		</div>
	</div>

	<?php require_once './layouts/script-js.html'; ?>
	<script src="./js/ajax/empleado.js"></script>
	<script>
		document.addEventListener('DOMContentLoaded', () => {
			getRol();
			getNombres();
			getApellidos();
			getDni();
			getcorreo();
			getDireccion();

			const formProducto = $('#form-empleado');

			$('#form-empleado').addEventListener('submit', e => {
				e.preventDefault();
				addEmpleado();
			});
		})
	</script>
</body>

</html>