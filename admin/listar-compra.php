<!DOCTYPE html>
<html lang="es" class="dark">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Detalle Compra</title>
	<?php require_once './layouts/link-css.html'; ?>
</head>

<body>
	<?php require_once './layouts/navbar.html'; ?>
	<!-- <div id="backdrop-modal" class="backdrop hidden" style="z-index:100;"></div> -->

	<div class="container">
		<?php require_once './layouts/sidebar.php'; ?>

		<div class="content sidebar-toggle">
			<main class="content-main">
				<div class="search-table">
					<form action="" method="get" autocomplete="off" class="search-form">
						<input type="text" name="search" placeholder="Buscar..." class="search-input" />
					</form>
					<a href="./registrar-detalle-compra.php" aria-label="Añadir producto" class="button">
						<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-plus" width="24" height="24" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
							<path stroke="none" d="M0 0h24v24H0z" fill="none" />
							<path d="M12 5l0 14" />
							<path d="M5 12l14 0" />
						</svg>
					</a>
				</div>

				<table id="table-detalle_compras" class="table">
					<thead class="table-head">
						<tr>
							<th>Proveedor</th>
							<th>Empleado</th>
							<th>Total</th>
							<th>Acciones</th>
						</tr>
					</thead>
					<tbody class="table-body">
					</tbody>
				</table>
			</main>
		</div>
	</div>

	<?php require_once './layouts/script-js.html'; ?>

	<script src="./js/ajax/compra.js"></script>
	<script>
		document.addEventListener('DOMContentLoaded', () => {
			dataCompra();
		})
	</script>
</body>

</html>