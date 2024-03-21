<!DOCTYPE html>
<html lang="es" class="dark">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Productos</title>
	<?php require_once './layouts/link-css.html'; ?>
</head>

<body>
	<?php require_once './layouts/navbar.html'; ?>
	<!-- <div id="backdrop-modal" class="backdrop hidden" style="z-index:100;"></div> -->
	<div class="container">
		<?php require_once './layouts/sidebar.html'; ?>

		<div class="content sidebar-toggle">
			<main class="content-main">
				<section class="search-table">
					<form action="" method="get" autocomplete="off" class="search-form">
						<input type="text" name="search" placeholder="Buscar..." class="search-input" />
					</form>
					<div class="search-buttons">
						<button aria-label="Añadir producto" class="button success">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-file-type-csv">
								<path stroke="none" d="M0 0h24v24H0z" fill="none" />
								<path d="M14 3v4a1 1 0 0 0 1 1h4" />
								<path d="M5 12v-7a2 2 0 0 1 2 -2h7l5 5v4" />
								<path d="M7 16.5a1.5 1.5 0 0 0 -3 0v3a1.5 1.5 0 0 0 3 0" />
								<path d="M10 20.25c0 .414 .336 .75 .75 .75h1.25a1 1 0 0 0 1 -1v-1a1 1 0 0 0 -1 -1h-1a1 1 0 0 1 -1 -1v-1a1 1 0 0 1 1 -1h1.25a.75 .75 0 0 1 .75 .75" />
								<path d="M16 15l2 6l2 -6" />
							</svg>
						</button>
						<button id="button-add-producto" aria-label="Añadir producto" class="button">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
								<path stroke="none" d="M0 0h24v24H0z" fill="none" />
								<path d="M12 5l0 14" />
								<path d="M5 12l14 0" />
							</svg>
						</button>
					</div>
				</section>

				<table id="table-productos" class="table">
					<thead class="table-head">
						<tr>
							<th>Producto</th>
							<th>Descripción</th>
							<th>Cantidad</th>
							<th>Precio</th>
							<th>Acciones</th>
						</tr>
					</thead>
					<tbody class="table-body">
					</tbody>
				</table>

				<section id="modal-producto-add" class="modal-producto modal hidden">
					<div class="modal-header">
						<h3 class="modal-title">Registrar producto</h3>
						<button type="button" class="modal-close">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-x">
								<path stroke="none" d="M0 0h24v24H0z" fill="none" />
								<path d="M18 6l-12 12" />
								<path d="M6 6l12 12" />
							</svg>
						</button>
					</div>
					<div class="modal-body">
						<form id="form-producto-add" action="" method="post" autocomplete="off">
							<div class="form-image">
								<img src="./img/no-disponible.jpg" alt="Imagen de referencia">

								<div class="form-buttons">
									<input id="form-producto-imagen" type="file" name="" class="hidden">
									<button type="button" class="button load">
										<span>Subir imagen</span>
										<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-file-plus" width="24" height="24" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
											<path stroke="none" d="M0 0h24v24H0z" fill="none" />
											<path d="M14 3v4a1 1 0 0 0 1 1h4" />
											<path d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
											<path d="M12 11l0 6" />
											<path d="M9 14l6 0" />
										</svg>
									</button>
									<button type="button" class="button delete">
										<span>Quitar imagen</span>
										<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-file-x" width="24" height="24" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
											<path stroke="none" d="M0 0h24v24H0z" fill="none" />
											<path d="M14 3v4a1 1 0 0 0 1 1h4" />
											<path d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
											<path d="M10 12l4 4m0 -4l-4 4" />
										</svg>
								</div>
							</div>

							<div class="form-inputs">
								<input id="form-producto-nombre" required type="text" placeholder="Nombre del producto" class="form-input">
								<input id="form-producto-codigo" required type="text" placeholder="Código" class="form-input">
								<input id="form-producto-precio" required type="number" placeholder="Precio" class="form-input" step="0.01">
								<select id="form-producto-categoria" required class="form-select">
									<option value="">Categoría</option>
								</select>
								<select id="form-producto-marca" required class="form-select">
									<option value="">Marca</option>
								</select>
								<textarea id="form-producto-descripcion" placeholder="Descripción" rows="5" class="form-textarea"></textarea>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="submit" form="form-producto-add" class="button">
							<span>Registrar</span>
							<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-clipboard-plus" width="24" height="24" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
								<path stroke="none" d="M0 0h24v24H0z" fill="none" />
								<path d="M9 5h-2a2 2 0 0 0 -2 2v12a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-12a2 2 0 0 0 -2 -2h-2" />
								<path d="M9 3m0 2a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v0a2 2 0 0 1 -2 2h-2a2 2 0 0 1 -2 -2z" />
								<path d="M10 14h4" />
								<path d="M12 12v4" />
							</svg>
						</button>
					</div>
				</section>

				<section id="modal-producto-update" class="modal-producto modal hidden">
					<div class="modal-header">
						<h3 class="modal-title">Actualizar producto</h3>
						<button type="button" class="modal-close">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-x">
								<path stroke="none" d="M0 0h24v24H0z" fill="none" />
								<path d="M18 6l-12 12" />
								<path d="M6 6l12 12" />
							</svg>
						</button>
					</div>
					<div class="modal-body">
						<form id="form-producto-update" action="" method="post" autocomplete="off">
							<div class="form-inputs">
								<input id="update-input-nombre" required type="text" placeholder="Nombre del producto" class="form-input">
								<input id="update-input-codigo" required type="text" placeholder="Código" class="form-input">
								<input id="update-input-precio" required type="number" placeholder="Precio" class="form-input" step="0.01">
								<select id="update-input-categoria" required class="form-select">
									<option value="">Categoría</option>
								</select>
								<select id="update-input-marca" required class="form-select">
									<option value="">Marca</option>
								</select>
								<textarea id="update-input-descripcion" placeholder="Descripción" rows="5" class="form-textarea"></textarea>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="submit" form="form-producto-update" class="button">
							<span>Actualizar</span>
							<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-clipboard-plus" width="24" height="24" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
								<path stroke="none" d="M0 0h24v24H0z" fill="none" />
								<path d="M9 5h-2a2 2 0 0 0 -2 2v12a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-12a2 2 0 0 0 -2 -2h-2" />
								<path d="M9 3m0 2a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v0a2 2 0 0 1 -2 2h-2a2 2 0 0 1 -2 -2z" />
								<path d="M10 14h4" />
								<path d="M12 12v4" />
							</svg>
						</button>
					</div>
				</section>

				<div id="backdrop-modal" class="backdrop hidden" style="z-index: 99;"></div>
			</main>
		</div>
	</div>

	<?php require_once './layouts/script-js.html'; ?>
	<script src="./js/ajax/producto.js"></script>
	<script>
		document.addEventListener('DOMContentLoaded', () => {
			const formProducto = $('#form-producto');
			const image = $('.form-image img');
			const imgInput = $('#form-producto-imagen');
			const imgLoad = $('.form-image .load');
			const imgDelete = $('.form-image .delete');

			imgLoad.addEventListener('click', () => imgInput.click());

			imgInput.addEventListener('change', () => {
				const reader = new FileReader();

				reader.addEventListener('load', () => {
					image.src = reader.result;
				});
				reader.readAsDataURL(imgInput.files[0]);
			});

			imgDelete.addEventListener('click', () => {
				imgInput.value = '';
				image.src = './img/no-disponible.jpg';
			});

			$('#form-producto-add').addEventListener('submit', e => {
				e.preventDefault();
				addProductos();
			});

			modalVisible('#modal-producto-add', '#button-add-producto');
			dataProductos();
			getCategorias('#form-producto-categoria');
			getMarcas('#form-producto-marca');
			getCategorias('#update-input-categoria');
			getMarcas('#update-input-marca');
		})
	</script>
</body>

</html>