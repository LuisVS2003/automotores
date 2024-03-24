const dataCompra = async () => {
  const tablaDetalleCompras = $('#table-detalle_compras tbody');
  const dataForm = new FormData();
  dataForm.append('operacion', 'listarCompra');

  const data = await dataFetch(URL_COMPRA, dataForm);
  console.log(data);
  let compras = '';

  data.forEach(itemCompra => {
    const { id, proveedor, empleado, total } = itemCompra;

    compras += `
				<tr class="table-row">
					<td>${proveedor}</td>
					<td>${empleado}</td>
					<td class="text-end">${total}</td>
					<td>
						<div data-compra-id="${id}" class="table-cell-action">
              ${botonView}
							${botonEditar}
							${botonEliminar}
						</div>
					</td>
				</tr>
			`;
  });

  if (data.length === 0) {
    compras = `
      <tr class="table-row">
        <td colspan="4" class="text-center">No hay datos disponibles</td>
      </tr>
    `;
  }

  tablaDetalleCompras.innerHTML = compras;
};

const getProveedor = async () => {
  const dataForm = new FormData();
  dataForm.append('operacion', 'listarProveedor');

  const data = await dataFetch(URL_PROVEEDOR, dataForm);
  addTagOptions($('#input-proveedor'), data, 'nombre');
};

const getEmpleado = async () => {
  const dataForm = new FormData();
  dataForm.append('operacion', 'listarEmpleado');

  const data = await dataFetch(URL_EMPLEADO, dataForm);
  addTagOptions($('#input-empleado'), data, 'nombre_completo');
};

const getAlmacen = async () => {
  const dataForm = new FormData();
  dataForm.append('operacion', 'listarAlmacen');

  const data = await dataFetch(URL_ALMACEN, dataForm);
  addTagOptions($('#input-almacen'), data, 'direccion');
};

function calcularImporteProducto(cantidad, precio) {
  let importe = 0;
  if (cantidad > 0 && precio > 0) {
    importe = cantidad * precio;
  }
  return importe.toFixed(2);
}

function calcularTotalProducto() {
  const tableProducto = $('#form-detalle-compra .table-body').children;

  let importeProducto = 0;
  for (let i = 0; i < tableProducto.length; i++) {
    importeProducto += parseFloat(tableProducto[i].querySelector('.importe').textContent);

    $('#compra-subtotal').textContent = importeProducto.toFixed(2);
    $('#compra-total').textContent = importeProducto.toFixed(2);
  }
}

let time;
let inputContent;

async function optionsProducto(e) {
  const inputProducto = e.target;
  const optionsList = inputProducto.nextElementSibling;

  /* Con este evento evitamos que la función optionsProducto se ejecute cada vez que se escriba */
  clearTimeout(time);
  time = setTimeout(async () => {
    if (inputContent !== inputProducto.value && inputProducto.value.length >= 3) {
      inputContent = inputProducto.value;

      const dataForm = new FormData();
      dataForm.append('operacion', 'buscarProducto');
      dataForm.append('nombre', inputContent);

      const data = await dataFetch(URL_PRODUCTO, dataForm);
      console.log(data);
      optionsList.innerHTML = '';
      let productos = '';

      data.forEach(itemProducto => {
        const { id, producto, precio } = itemProducto;
        productos += `
          <li>
            <button data-producto-id="${id}" data-producto-precio="${precio}" type="button">${producto}</button>
          </li>
        `;
      });

      if (data.length === 0) productos = '<li disabled>No se encontraron resultados</li>';

      optionsList.innerHTML = productos;

      if (inputProducto.value.length >= 3) optionsList.classList.remove('hidden');
    }
  }, 500);
}

async function optionsProductoVisible(event) {
  inputContent = '';
  const inputProducto = event.target;
  const optionsList = inputProducto.nextElementSibling;
  const cantidadProducto = inputProducto.closest('.table-row').querySelector('.input-cantidad');
  const precioProducto = inputProducto.closest('.table-row').querySelector('.precio');
  const importeProducto = inputProducto.closest('.table-row').querySelector('.importe');

  if (inputProducto.value.length >= 3) optionsList.classList.remove('hidden');

  inputProducto.addEventListener('input', await optionsProducto);

  document.addEventListener('click', e => {
    if (e.target !== inputProducto) optionsList.classList.add('hidden');
  });

  optionsList.addEventListener('click', e => {
    const optionButton = e.target;
    if (optionButton.tagName === 'BUTTON') {
      const productoId = optionButton.getAttribute('data-producto-id');
      const productoPrecio = optionButton.getAttribute('data-producto-precio');

      inputProducto.setAttribute('data-producto-id', productoId);
      inputProducto.value = optionButton.textContent;
      precioProducto.textContent = productoPrecio;
      importeProducto.textContent = calcularImporteProducto(cantidadProducto.value, productoPrecio);
      calcularTotalProducto();
    }
  });
}

const addCompra = async () => {
  const dataForm = new FormData();
  dataForm.append('operacion', 'registrarCompra');
  dataForm.append('empleado_id', $('#input-empleado').value);
  dataForm.append('proveedor_id', $('#input-proveedor').value);

  const data = await dataFetch(URL_COMPRA, dataForm);
  console.log('Compra Registrada' + data.id);
  return data.id;
};

const addDetalleCompra = async (compraId, productoId, cantidad, almacenId) => {
  const dataForm = new FormData();
  dataForm.append('operacion', 'registrarDetalleCompra');
  dataForm.append('compra_id', compraId);
  dataForm.append('producto_id', productoId);
  dataForm.append('cantidad', cantidad);
  dataForm.append('almacen_id', almacenId);

  const data = await dataFetch(URL_DETALLE_COMPRA, dataForm);
  console.log('Detalle de Compra Registrada' + data.id);
};
