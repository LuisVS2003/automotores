document.addEventListener('DOMContentLoaded', e => {
	const tablaDetalleVenta = $('#table-detalle_venta tbody');
  const URL_DETALLE_VENTA = '../controllers/DetalleVentaController.php';
	
  const dataDetalleVenta = async () => {
		const dataForm = new FormData();
    dataForm.append('operacion', 'listarDetalleVenta');
		
    const data = await dataFetch(URL_DETALLE_VENTA, dataForm);
    console.log(data);
		// console.log('hiool');
    tablaDetalleVenta.innerHTML = '';
    let detalleVenta = '';
    data.forEach(itemDetalleVenta => {
      const { producto, categoria, marca, descripcion, precio } = itemDetalleVenta;

      detalleVenta += `
				<tr class="table-row">
					<td class="table-details">
						<h3>${producto}</h3>
						<div>
							<span>${categoria}</span> |
							<span>${marca}</span>
						</div>
					</td>

					<td class="table-description">
						${descripcion}
					</td>

					<td class="text-center">
						${Math.floor(Math.random() * 100)}
					</td>

					<td class="text-end">${precio}</td>

					<td>
						<div class="table-cell-action">
							${botonEditar}
							${botonEliminar}
						</div>
					</td>
				</tr>
			`;
    });

    tablaDetalleVenta.innerHTML = detalleVenta;
  };

  dataDetalleVenta();
});
