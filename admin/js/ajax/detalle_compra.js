const URL_COMPRA = '../controllers/CompraController.php';
const URL_PRODUCTO = '../controllers/ProductoController.php';
const URL_DETALLE_COMPRA = '../controllers/DetalleCompraController.php';
// console.log("itemDetalleCompras");

const tablaDetalleCompras = $('#table-detalle_compras tbody');

const dataDetalleCompra = async () => {
  const dataForm = new FormData();
  dataForm.append('operacion', 'listarDetalleCompra');

  const data = await dataFetch(URL_DETALLE_COMPRA, dataForm);
  // console.log(data);
  if (tablaDetalleCompras.length) {
    tablaDetalleCompras.innerHTML = '';
  } else {
    console.error('La tabla no fue encontrada.');
  }

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

const getCompra = async () => {
  const marcas = $('#form-detalle-compra-compra');

  const dataForm = new FormData();
  dataForm.append('operacion', 'listarCompra');

  const data = await dataFetch(URL_COMPRA, dataForm);

  let num = 1;
  let compra = 'compra' + num;
  data.forEach(item => {
    // console.log(item);
    let tagOption = document.createElement('option');
    tagOption.value = item.id;
    tagOption.textContent = compra;
    marcas.appendChild(tagOption);
    num++;
  });
};
const getProducto = async () => {
  const categoria = $('#form-detalle-compra-producto');

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

const addDetalleCompra = async () => {
  const dataForm = new FormData();
  dataForm.append('operacion', 'registrarDetalleCompra');
  dataForm.append('compra_id', $('#form-detalle-compra-compra').value);
  dataForm.append('producto_id', $('#form-detalle-compra-producto').value);
  dataForm.append('cantidad', $('#form-detalle-compra-cantidad').value);

  const data = await dataFetch(URL_DETALLE_COMPRA, dataForm);
  console.log(data);
};
