<!DOCTYPE html>
<html lang="es" class="dark">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Registrar CLiente</title>
	<?php require_once './layouts/link-css.html'; ?>
</head>

<body>
	<?php require_once './layouts/navbar.html'; ?>
	<!-- <div id="backdrop-modal" class="backdrop hidden" style="z-index:100;"></div> -->

	<div class="container">
		<?php require_once './layouts/sidebar.php'; ?>

		<div class="content sidebar-toggle">
			<main class="content-main">
				<section>
					<h3 class="title">Registrar Cliente</h3>
					<form id="form-cliente" action="" method="post" class="form-md">
						<div class="label-input">
							<label for="input-nombres" class="form-label">Nombres:</label>
							<input id="input-nombres" type="text" class="form-input" />
						</div>
						<div class="label-input">
							<label for="input-apellidos" class="form-label">Apellidos:</label>
							<input id="input-apellidos" type="text" class="form-input" />
						</div>
						<div class="label-input">
							<label for="input-dni" class="form-label">DNI:</label>
							<input id="input-dni" type="text" class="form-input" />
						</div>
						<button type="submit" class="button">Registrar</button>
					</form>
				</section>
			</main>
		</div>
	</div>

	<?php require_once './layouts/script-js.html'; ?>
	<script src="./js/ajax/cliente.js"></script>
	<script>
		document.addEventListener('DOMContentLoaded', () => {
			$('#form-cliente').addEventListener('submit', e => {
				e.preventDefault();
				addCliente();
			});
		})
	</script>
</body>

</html>