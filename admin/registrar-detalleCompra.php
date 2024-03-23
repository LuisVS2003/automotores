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
		<?php require_once './layouts/sidebar.php'; ?>

		<div class="content sidebar-toggle">
			<main class="content-main">
				<section class="invoice">
					<form id="form-detalle-compra" action="" method="post">
						<div class="invoice-header">
							<div class="label-input">
								<label for="input-empleado" class="form-label">Señor(es):</label>
								<select id="input-empleado" required class="form-select">
									<option value="">Seleccione</option>
								</select>
							</div>
							<div class="label-input">
								<label for="input-proveedor" class="form-label">Proveedor:</label>
								<select id="input-proveedor" required class="form-select">
									<option value="">Seleccione</option>
								</select>
							</div>
							<div class="label-input">
								<label for="input-almacen" class="form-label">Almacen:</label>
								<select id="input-almacen" required class="form-select">
									<option value="">Seleccione</option>
								</select>
							</div>
						</div>

						<div class="invoice-body">
							<table class="table">
								<colgroup>
									<col width="100px">
									<col width="120px">
									<col width="">
									<col width="120px">
									<col width="120px">
								</colgroup>
								<thead class="table-head">
									<tr>
										<th>Quitar</th>
										<th>Cantidad</th>
										<th>Descripción</th>
										<th>Precio</th>
										<th>Importe</th>
									</tr>
								</thead>
								<tbody class="table-body">
									<tr class="table-row">
										<td class="table-cell-action">
											<button class="button delete" type="button" aria-label="Eliminar">
												<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
													<path stroke="none" d="M0 0h24v24H0z" fill="none" />
													<path d="M4 7l16 0" />
													<path d="M10 11l0 6" />
													<path d="M14 11l0 6" />
													<path d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
													<path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" />
												</svg>
											</button>
										</td>

										<td>
											<input required type="number" class="input-cantidad form-input text-center" placeholder="0" step="1" />
										</td>

										<td style="position: relative;">
											<input required data-producto-id="" type="text" class="input-producto form-input" placeholder="Ingrese 3 letras..." />
											<ul class="options-list hidden"></ul>
										</td>

										<td class="text-end">
											111.00
										</td>

										<td class="text-end">
											222.00
										</td>
									</tr>
								</tbody>
								<tfoot class="table-foot">
									<tr class="table-row">
										<td rowspan="2">
											<button id="input-add" type="button" class="button" aria-label="Agregar detalle compra">
												<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
													<path stroke="none" d="M0 0h24v24H0z" fill="none" />
													<path d="M12 5l0 14" />
													<path d="M5 12l14 0" />
												</svg>
											</button>
										</td>
										<td colspan="2"></td>
										<td class="text-end">SubTotal:</td>
										<td class="text-end">222.00</td>
									</tr>
									<tr class="table-row">
										<td colspan="2"></td>
										<td class="text-end">Total:</td>
										<td class="text-end">222.00</td>
									</tr>
								</tfoot>
							</table>
							<button type="submit" class="button">Registrar</button>
						</div>
					</form>
				</section>
			</main>
		</div>
	</div>

	<?php require_once './layouts/script-js.html'; ?>
	<script src="./js/ajax/detalle_compra.js"></script>
	<script>
		document.addEventListener('DOMContentLoaded', () => {
			const formProducto = $('#form-producto');

			$('#form-detalle-compra').addEventListener('submit', async e => {
				e.preventDefault();

				const tableProducto = $('#form-detalle-compra .table-body').children;
				const compraId = await addCompra();
				const almacenId = $('#input-almacen').value;

				for (let i = 0; i < tableProducto.length; i++) {
					let inputCantidadValue = tableProducto[i].querySelector('.input-cantidad').value;
					let inputProductoValue = tableProducto[i].querySelector('.input-producto').getAttribute('data-producto-id');

					addDetalleCompra(compraId, inputProductoValue, inputCantidadValue, almacenId);
				}
			});

			$('#form-detalle-compra').addEventListener('click', async event => {
				const objetivo = event.target;

				if (objetivo.classList.contains('input-producto')) await optionsProductoVisible(event);

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
					<td class="table-cell-action">${botonEliminar}</td>

					<td>
						<input type="number" class="input-cantidad form-input text-center" placeholder="0" step="1" />
					</td>

					<td style="position: relative;">
						<input data-producto-id="" type="text" class="input-producto form-input"
							placeholder="Ingrese 3 letras..." />
						<ul class="options-list hidden"></ul>
					</td>

					<td class="text-end">111.00</td>

					<td class="text-end">222.00</td>
				`;

				$('#form-detalle-compra .table-body').appendChild(rowCompra);
			});

			getProveedor();
			getEmpleado();
			getAlmacen();
		})
	</script>
</body>

</html>