// console.log("itemDetalleCompras");
document.addEventListener('DOMContentLoaded', e => {
  const tablaDetalleCompras = $('#table-detalle_compras tbody');

  const URL_DETALLE_COMPRA = '../controllers/DetalleCompraController.php';

  const dataDetalleCompra = async () => {
    const dataForm = new FormData();
    dataForm.append('operacion', 'listarDetalleCompra');

    const data = await dataFetch(URL_DETALLE_COMPRA, dataForm);
    console.log(data);
    tablaDetalleCompras.innerHTML = '';
    let detalleCompras = '';
		let num = 1;
    data.forEach(itemDetalleCompras => {
      const { compra_id, producto_id, cantidad } = itemDetalleCompras;

      detalleCompras += `
				<tr class="table-row">
					<td class="table-details">
						<h3>${num}</h3>
					</td>
					<td class="table-details">
						<h3>${compra_id}</h3>
					</td>
					<td class="table-details">
						<h3>${producto_id}</h3>
					</td>
					<td class="table-details">
						<h3>${cantidad}</h3>
					</td>
					
					<td>
						<div class="table-cell-action">
							${botonEditar}
							${botonEliminar}
						</div>
					</td>
				</tr>
			`;
    });

		num++;
    tablaDetalleCompras.innerHTML = detalleCompras;
  };

  dataDetalleCompra();
});
