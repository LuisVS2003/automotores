const URL_COMPRA = '../controllers/CompraController.php';
const URL_PROVEEDOR = '../controllers/ProveedorController.php';
const URL_EMPLEADO = '../controllers/EmpleadoController.php';
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

const getProveedor = async () => {
  const dataForm = new FormData();
  dataForm.append('operacion', 'listarProveedor');

  const data = await dataFetch(URL_PROVEEDOR, dataForm);
  /* console.log(data); */

  data.forEach(itemProveedor => {
    const tagOption = document.createElement('option');
    tagOption.value = itemProveedor.id;
    tagOption.textContent = itemProveedor.nombre;

    $('#input-proveedor').appendChild(tagOption);
  });
};

const getEmpleado = async () => {
  const dataForm = new FormData();
  dataForm.append('operacion', 'listarEmpleado');

  const data = await dataFetch(URL_EMPLEADO, dataForm);
  /* console.log(data); */

  data.forEach(itemEmpleado => {
    const tagOption = document.createElement('option');
    tagOption.value = itemEmpleado.id;
    tagOption.textContent = itemEmpleado.nombre_completo;

    $('#input-comprador').appendChild(tagOption);
  });
};
