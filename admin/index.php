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
					<div>
						<table class="table" id="table-productos">
							<colgroup>
								<col width="5%">
								<col width="15%">
								<col width="40%">
								<col width="10%">
								<col width="10%">
								<col width="20%">
							</colgroup>
							<thead class="table-head">
								<tr>
									<th>#</th>
									<th>Código</th>
									<th>Nombre</th>
									<th>Cantidad</th>
									<th>Precio</th>
									<th>Acciones</th>
								</tr>
							</thead>
							<tbody class="table-body">
								<tr class="table-row">
									<td class="text-center">1</td>
									<td class="text-center">123</td>
									<td>
										<div class="table-cell-info">
											<div class="user-profile">
												<img class="user-avatar" src="./img/user.png" alt="Usuario">
												<div class="user-details">
													<h3 class="user-name" title="nombre de usuario">Luis Alberto Villegas Salazar</h3>
													<p class="user-email" title="correo">admin@gmail.com</p>
												</div>
											</div>
										</div>
									</td>
									<td class="text-center">373</td>
									<td class="text-center">123</td>
									<td>
										<div class="table-cell-action">
											<button class="button edit" type="button" aria-label="Editar">
												<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-edit" width="24" height="24" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
													<path stroke="none" d="M0 0h24v24H0z" fill="none" />
													<path d="M7 7h-1a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-1" />
													<path d="M20.385 6.585a2.1 2.1 0 0 0 -2.97 -2.97l-8.415 8.385v3h3l8.385 -8.415z" />
													<path d="M16 5l3 3" />
												</svg>
											</button>
											<button class="button delete" type="button" aria-label="Eliminar">
												<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-trash" width="24" height="24" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
													<path stroke="none" d="M0 0h24v24H0z" fill="none" />
													<path d="M4 7l16 0" />
													<path d="M10 11l0 6" />
													<path d="M14 11l0 6" />
													<path d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
													<path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" />
												</svg>
											</button>
										</div>
									</td>
								</tr>
								<tr class="table-row">
									<td class="text-center">1</td>
									<td class="text-center">123</td>
									<td>
										<div class="table-cell-info">
											<h5>Auto Lorem ipsum dolor sit amet. </h5>
											<p>Lorem ipsum dolor sit amet.</p>
										</div>
									</td>
									<td class="text-center">373</td>
									<td class="text-center">123</td>
									<td>
										<div class="table-cell-action">
											<button class="button edit" type="button" aria-label="Editar">
												<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-edit" width="24" height="24" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
													<path stroke="none" d="M0 0h24v24H0z" fill="none" />
													<path d="M7 7h-1a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-1" />
													<path d="M20.385 6.585a2.1 2.1 0 0 0 -2.97 -2.97l-8.415 8.385v3h3l8.385 -8.415z" />
													<path d="M16 5l3 3" />
												</svg>
											</button>
											<button class="button delete" type="button" aria-label="Eliminar">
												<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-trash" width="24" height="24" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
													<path stroke="none" d="M0 0h24v24H0z" fill="none" />
													<path d="M4 7l16 0" />
													<path d="M10 11l0 6" />
													<path d="M14 11l0 6" />
													<path d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
													<path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" />
												</svg>
											</button>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</section>
				<?php require_once './layouts/card.html'; ?>
			</main>
			</div>
	</div>

	<script src="./js/app.js"></script>
</body>

</html>