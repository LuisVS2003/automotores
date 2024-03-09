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
    data.forEach(itemDetalleCompras => {
      const { producto, categoria, marca, descripcion, precio } = itemDetalleCompras;

			
      detalleCompras += `
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

    tablaDetalleCompras.innerHTML = detalleCompras;
  };

  dataDetalleCompra();
});
