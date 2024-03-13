<!DOCTYPE html>
<html lang="es" class="dark">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Registrar Detalle Compra</title>
	<?php require_once './layouts/link-css.html'; ?>
</head>

<body>
	<?php require_once './layouts/navbar.html'; ?>
	<!-- <div id="backdrop-modal" class="backdrop hidden" style="z-index:100;"></div> -->

	<div class="container">
		<?php require_once './layouts/sidebar.html'; ?>

		<div class="content sidebar-toggle">
			<main class="content-main">
				<?php require_once './layouts/registrar-detalleCompra.html'; ?>
			</main>
		</div>
	</div>

	<?php require_once './layouts/script-js.html'; ?>
	<script src="./js/ajax/detalle_compra.js"></script>
	<script>
		document.addEventListener('DOMContentLoaded', () => {
			const formProducto = $('#form-producto');

			$('#form-detalle-compra').addEventListener('submit', e => {
				e.preventDefault();
				addDetalleCompra();
			});

			/* Con este evento evitamos que la función getProductos se ejecute cada vez que se escriba */
			let time;
			let inputContent;

			$('#form-detalle-compra').addEventListener('click', async event => {
				const objetivo = event.target;

				if (objetivo.classList.contains('input-producto')) {
					const inputProducto = event.target;
					const optionsList = inputProducto.nextElementSibling;
					let optionsListValues;

					inputProducto.addEventListener('input', e => {
						clearTimeout(time);
						time = setTimeout(async () => {
							if (inputContent !== e.target.value && e.target.value.length >= 3) {
								inputContent = e.target.value;

								const dataForm = new FormData();
								dataForm.append('operacion', 'buscarProducto');
								dataForm.append('nombre', inputContent);

								const data = await dataFetch(URL_PRODUCTO, dataForm);

								optionsList.innerHTML = '';
								let productos = '';


								data.forEach(itemProducto => {
									productos += `
										<li>
											<button data-producto-id="${itemProducto.id}" type="button">${itemProducto.producto}</button>
										</li>
									`;
								});

								if (data.length === 0) productos = '<li disabled>No se encontraron resultados</li>';

								optionsList.innerHTML = productos;
							}
						}, 500);
					});


					optionsList.classList.remove('hidden');

					document.addEventListener('click', e => {
						if (e.target !== inputProducto) optionsList.classList.add('hidden');
					});

					optionsList.addEventListener('click', e => {
						const optionButton = e.target;
						if (optionButton.tagName === 'BUTTON') {
							const productoId = optionButton.getAttribute('data-producto-id');
							inputProducto.setAttribute('data-producto-id', productoId)
							inputProducto.value = optionButton.textContent;
						}
					});
				}

				if (objetivo.parentElement.classList.contains('delete') || objetivo.classList.contains('delete')) {
					const rowProducto = objetivo.closest('.table-row');
					const tableProducto = $('#form-detalle-compra .table-body');

					if (tableProducto.childElementCount > 1) $('#form-detalle-compra .table-body').removeChild(rowProducto);
				}
			});

			$('#input-add').addEventListener('click', e => {
				const rowCompra = document.createElement('tr');
				rowCompra.classList.add('table-row');
				rowCompra.innerHTML = `
					<td class="table-cell-action">
						${botonEliminar}
					</td>

					<td>
						<input id="input-cantidad" type="number" class="form-input text-center" placeholder="1" step="1" />
					</td>

					<td style="position: relative;">
						<input id="input-producto" data-producto-id="" type="text" class="form-input input-producto"
							placeholder="Producto A" />
						<ul class="options-list hidden">
							<li>
								Escriba al menos 3 letras para buscar...
							</li>
						</ul>
					</td>

					<td class="text-end">
						111.00
					</td>

					<td class="text-end">
						222.00
					</td>
				`;

				$('#form-detalle-compra .table-body').appendChild(rowCompra);
			});

		})
	</script>
</body>

</html>