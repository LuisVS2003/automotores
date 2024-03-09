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
		<?php require_once './layouts/sidebar.html'; ?>

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
			const imgInput = $('.form-image input');
			const imgButton = $('.form-image button');

			imgButton.addEventListener('click', () => imgInput.click());

			imgInput.addEventListener('change', () => {
				const reader = new FileReader();

				reader.addEventListener('load', () => {
					image.src = reader.result;
				});
				reader.readAsDataURL(imgInput.files[0]);
			});

			formProducto.addEventListener('submit', (e) => {
				e.preventDefault();
				console.log('Echo');
			})
		})
	</script>
</body>

</html>