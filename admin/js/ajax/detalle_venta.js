const tablaDetalleVenta = $('#table-detalle_venta tbody');

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
                  <button type="button" class="button"><a href="/admin/layouts/imprimir.html">Imprimir</a></button>
              </div>
          </td>

				</tr>
			`;
  });

  num++;
  tablaDetalleVenta.innerHTML = detalleVenta;
};

const getVenta = async () => {
  const marcas = $('#form-detalle-venta-venta');

  const dataForm = new FormData();
  dataForm.append('operacion', 'listarVenta');

  const data = await dataFetch(URL_VENTA, dataForm);

  let num = 1;
  let venta = 'venta' + num;
  data.forEach(item => {
    // console.log(item);
    let tagOption = document.createElement('option');
    tagOption.value = item.id;
    tagOption.textContent = venta;
    marcas.appendChild(tagOption);
    num++;
  });
};
const getProducto = async () => {
  const categoria = $('#form-detalle-venta-producto');

  const dataForm = new FormData();
  dataForm.append('operacion', 'listarProducto');

  const data = await dataFetch(URL_PRODUCTO, dataForm);

  data.forEach(item => {
    // console.log(item);
    let tagOption = document.createElement('option');
    tagOption.value = item.id;
    tagOption.textContent = item.producto;
    categoria.appendChild(tagOption);
  });
};

const addDetalleVenta = async () => {
  const dataForm = new FormData();
  dataForm.append('operacion', 'registrarDetalleVenta');
  dataForm.append('venta_id', $('#form-detalle-venta-venta').value);
  dataForm.append('producto_id', $('#form-detalle-venta-producto').value);
  dataForm.append('cantidad', $('#form-detalle-venta-cantidad').value);

  const data = await dataFetch(URL_DETALLE_VENTA, dataForm);
  console.log(data);
};
