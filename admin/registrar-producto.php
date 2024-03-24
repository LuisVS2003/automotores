<!DOCTYPE html>
<html lang="es" class="dark">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Registrar producto</title>
	<?php require_once './layouts/link-css.html'; ?>
</head>

<body>
	<?php require_once './layouts/navbar.html'; ?>
	<!-- <div id="backdrop-modal" class="backdrop hidden" style="z-index:100;"></div> -->

	<div class="container">
		<?php require_once './layouts/sidebar.php'; ?>

		<div class="content sidebar-toggle">
			<main class="content-main">
				<form id="form-producto" action="" method="post" autocomplete="off">

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
						<input id="form-producto-nombre" type="text" placeholder="Nombre del producto" class="form-input">
						<input id="form-producto-codigo" type="text" placeholder="Código" class="form-input">
						<input id="form-producto-precio" type="number" placeholder="Precio" class="form-input">
						<select id="form-producto-categoria" name="" class="form-select">
							<option value="">Categoría</option>
						</select>
						<select id="form-producto-marca" name="" class="form-select">
							<option value="">Marca</option>
						</select>
						<textarea id="form-producto-descripcion" placeholder="Descripción" rows="5" class="form-textarea"></textarea>
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
	<script src="./js/ajax/producto.js"></script>
	<script>
		document.addEventListener('DOMContentLoaded', () => {
			getCategorias();
			getMarcas();

			const formProducto = $('#form-producto');
			const image = $('.form-image img');
			const imgInput = $('#form-producto-imagen');
			const imgLoad = $('.form-image .load');
			const imgDelete = $('.form-image .delete');
			console.log(imgDelete);

			imgLoad.addEventListener('click', () => imgInput.click());

			imgInput.addEventListener('change', () => {
				const reader = new FileReader();

				reader.addEventListener('load', () => {
					image.src = reader.result;
				});
				reader.readAsDataURL(imgInput.files[0]);
			});

			imgDelete.addEventListener('click', () => {
				console.log(imgInput.files[0]);
				imgInput.value = '';
				image.src = './img/no-disponible.jpg';
				console.log(imgInput.files[0]);
			});

			$('#form-producto').addEventListener('submit', e => {
				e.preventDefault();
				addProductos();
			});
		})
	</script>
</body>

</html>