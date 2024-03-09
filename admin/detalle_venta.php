<!DOCTYPE html>
<html lang="es" class="dark">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Dashboard - Automotores</title>
	<link rel="stylesheet" href="./css/app.css">
	<link rel="stylesheet" href="./css/appdark.css">

	<script>
		const darkMode = document.querySelector('html')
		if (localStorage.getItem('theme') === 'dark' || localStorage.length === 0) darkMode.classList.add('dark')
		else darkMode.classList.remove('dark');
	</script>
</head>

<body>
	<?php require_once './layouts/navbar.html'; ?>
	<!-- <div id="backdrop-modal" class="backdrop hidden" style="z-index:100;"></div> -->

	<div class="container">
		<?php require_once './layouts/sidebar.html'; ?>

		<div class="content sidebar-toggle">
			<main class="content-main">
				<?php require_once './layouts/detalle_venta.html'; ?>
			</main>
		</div>
	</div>

	<script src="./js/app.js"></script>
	<script src='./js/ajax/detalle_venta.js'>
	</script>
	<script>
		console.log("hola");
	</script>
	<!-- <script src="./js/ajax/detalle_venta.js"></script> -->
</body>

</html>