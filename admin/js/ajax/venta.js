const tablaDetalleVenta = $('#table-detalle_venta tbody');

const dataVenta = async () => {
  const dataForm = new FormData();
  dataForm.append('operacion', 'listarVenta');

  const data = await dataFetch(URL_VENTA, dataForm);
  let ventas = '';

  data.forEach(itemVenta => {
    const { id, cliente, empleado, total } = itemVenta;
    const clienteNull = cliente.startsWith(', ') ? cliente.slice(2) : cliente;

    ventas += `
      <tr class="table-row">
        <td>${clienteNull}</td>
        <td>${empleado}</td>
        <td class="text-end">${total}</td>
        <td>
          <div data-venta-id="${id}" class="table-cell-action">
            ${botonView}
            ${botonEditar}
            ${botonEliminar}
          </div>
        </td>
      </tr>
    `;
  });

  if (data.length === 0) {
    ventas = `
      <tr class="table-row">
        <td colspan="4">No hay datos disponibles</td>
      </tr>
    `;
  }

  tablaDetalleVenta.innerHTML = ventas;
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
    console.log(item);
    let tagOption = document.createElement('option');
    tagOption.value = item.id;
    tagOption.textContent = item.producto;
    categoria.appendChild(tagOption);
  });
};

const addDetalleVenta = async (compraId, inputProductoValue, inputCantidadValue, almacenId) => {
  const dataForm = new FormData();
  dataForm.append('operacion', 'registrarDetalleVenta');
  dataForm.append('venta_id', $('#form-detalle-venta-venta').value);
  dataForm.append('producto_id', $('#form-detalle-venta-producto').value);
  dataForm.append('cantidad', $('#form-detalle-venta-cantidad').value);

  const data = await dataFetch(URL_DETALLE_VENTA, dataForm);
  console.log(data);
};
