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
				<?php require_once './layouts/registrar-producto.html'; ?>
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