<!DOCTYPE html>
<html lang="es" class="dark">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Dashboard - Automotores</title>
	<?php require_once './layouts/link-css.html'; ?>
</head>

<body>
	<?php require_once './layouts/navbar.html'; ?>

	<div class="container">
		<?php require_once './layouts/sidebar.html'; ?>

		<div class="content sidebar-toggle">
			<main class="content-main">
				<section>
					<div class="search">
						<h3>Productos</h3>
						<form action="" method="post" class="search-form">
							<input type="text" placeholder="Buscar..." class="search-input">
							<svg xmlns="http://www.w3.org/2000/svg" class="search-icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
								<path stroke="none" d="M0 0h24v24H0z" fill="none" />
								<path d="M10 10m-7 0a7 7 0 1 0 14 0a7 7 0 1 0 -14 0" />
								<path d="M21 21l-6 -6" />
							</svg>
						</form>
					</div>

				</section>
				<?php require_once './layouts/card.html'; ?>
			</main>
		</div>
	</div>
	
	<?php require_once './layouts/script-js.html'; ?>

</body>

</html>