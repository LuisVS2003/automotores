const dataVenta = async () => {
  const tablaDetalleVenta = $('#table-detalle_venta tbody');
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

const getEmpleado = async () => {
  const dataForm = new FormData();
  dataForm.append('operacion', 'listarEmpleado');

  const data = await dataFetch(URL_EMPLEADO, dataForm);
  addTagOptions($('#input-empleado'), data, 'nombre_completo');
};

const getCliente = async () => {
  const dataForm = new FormData();
  dataForm.append('operacion', 'listarCliente');

  const data = await dataFetch(URL_CLIENTE, dataForm);
  addTagOptions($('#input-cliente'), data, 'nombre_completo');
};

const getAlmacen = async () => {
  const dataForm = new FormData();
  dataForm.append('operacion', 'listarAlmacen');

  const data = await dataFetch(URL_ALMACEN, dataForm);
  addTagOptions($('#input-almacen'), data, 'direccion');
};

const addDetalleVenta = async (ventaId, producto, cantidad, almacenId) => {
  const dataForm = new FormData();
  dataForm.append('operacion', 'registrarDetalleVenta');
  dataForm.append('venta_id', ventaId);
  dataForm.append('producto_id', producto);
  dataForm.append('cantidad', cantidad);

  const data = await dataFetch(URL_DETALLE_VENTA, dataForm);
  console.log(data);
};
