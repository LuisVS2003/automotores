<!DOCTYPE html>
<html lang="es" class="dark">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Proveedores</title>
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
					<a href="#" aria-label="Añadir proveedor" class="button">
						<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-plus" width="24" height="24" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
							<path stroke="none" d="M0 0h24v24H0z" fill="none" />
							<path d="M12 5l0 14" />
							<path d="M5 12l14 0" />
						</svg>
					</a>
				</div>

				<table id="table-proveedores" class="table">
					<thead class="table-head">
						<tr>
							<th>ID</th>
							<th>Nombre</th>
							<th>Telefono</th>
							<th>Correo</th>
							<th>RUC</th>
							<th>Direccion</th>
						</tr>
					</thead>
					<tbody class="table-body">
					</tbody>
				</table>
			</main>
		</div>
	</div>

	<?php require_once './layouts/script-js.html'; ?>

	<script src="./js/ajax/proveedor.js"></script>
</body>

</html>