// console.log('hiool');
document.addEventListener('DOMContentLoaded', e => {
	const tablaDetalleVenta = $('#table-detalle_venta tbody');
  const URL_DETALLE_VENTA = '../controllers/DetalleVentaController.php';
	
  const dataDetalleVenta = async () => {
		const dataForm = new FormData();
    dataForm.append('operacion', 'listarDetalleVenta');
		
    const data = await dataFetch(URL_DETALLE_VENTA, dataForm);
    console.log(data);
    tablaDetalleVenta.innerHTML = '';
    let detalleVenta = '';
		let num = 1;
    data.forEach(itemDetalleVenta => {
      const { venta_id, producto_id, cantidad } = itemDetalleVenta;

      detalleVenta += `
				<tr class="table-row">
					<td class="table-details">
						<h3>${num}</h3>
					</td>
					<td class="table-details">
						<h3>${venta_id}</h3>
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
    tablaDetalleVenta.innerHTML = detalleVenta;
  };

  dataDetalleVenta();
});
