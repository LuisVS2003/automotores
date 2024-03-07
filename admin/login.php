<!DOCTYPE html>
<html lang="es" class="dark">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Dashboard - Automotores</title>
	<link rel="stylesheet" href="./css/app.css">

	<script>
		/* Al entrar a la página, se activa el modo oscuro */
		const darkMode = document.querySelector('html')
		if (localStorage.getItem('theme') === 'dark' || localStorage.length === 0) darkMode.classList.add('dark')
		else darkMode.classList.remove('dark');
	</script>
</head>

<body>
	<?php require_once './layouts/navbar.html'; ?>

	<div class="container">
		<?php require_once './layouts/sidebar.html'; ?>

		<div class="content sidebar-toggle">
			<main class="content-main">
				<?php require_once './layouts/login.html'; ?>
			</main>
			</div>
	</div>

	<script src="./js/app.js"></script>
</body>

</html>