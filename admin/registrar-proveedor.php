<!DOCTYPE html>
<html lang="es" class="dark">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Registrar Proveedor</title>
	<?php require_once './layouts/link-css.html'; ?>
</head>

<body>
	<?php require_once './layouts/navbar.html'; ?>
	<!-- <div id="backdrop-modal" class="backdrop hidden" style="z-index:100;"></div> -->

	<div class="container">
		<?php require_once './layouts/sidebar.php'; ?>

		<div class="content sidebar-toggle">
			<main class="content-main">
				<form id="form-proveedor" action="" method="post" autocomplete="off">
					<div class="form-inputs">
						<input id="form-proveedor-nombre" type="text" placeholder="Nombre del proveedor" class="form-input">
						<input id="form-proveedor-telefono" type="number" placeholder="Número" class="form-input">
						<input id="form-proveedor-correo" type="mail" placeholder="Correo" class="form-input">
						<input id="form-proveedor-ruc" type="number" placeholder="Ruc del proveedor" class="form-input">
						<input id="form-proveedor-direccion" type="text" placeholder="Dirección" class="form-input">
					</div>

					<button id="form-producto-submit" type="submit" class="button">
						<span>Registrar</span>
						<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-clipboard-plus" width="24" height="24" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
							<path stroke="none" d="M0 0h24v24H0z" fill="none" />
							<path d="M9 5h-2a2 2 0 0 0 -2 2v12a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-12a2 2 0 0 0 -2 -2h-2" />
							<path d="M9 3m0 2a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v0a2 2 0 0 1 -2 2h-2a2 2 0 0 1 -2 -2z" />
							<path d="M10 14h4" />
							<path d="M12 12v4" />
						</svg>
					</button>
				</form>
			</main>
		</div>
	</div>

	<?php require_once './layouts/script-js.html'; ?>
	<script src="./js/ajax/proveedor.js"></script>
	<script>
		document.addEventListener('DOMContentLoaded', () => {
			getNombre();
			getTelefono();
			getCorreo();
			getRuc();
			getDireccion();

			const formProducto = $('#form-producto');

			$('#form-proveedor').addEventListener('submit', e => {
				e.preventDefault();
				addProveedor();
			});
		})
	</script>
</body>

</html>