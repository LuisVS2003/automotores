const dataClientes = async () => {
  const tablaClientes = $('#table-clientes .table-body');
  const dataForm = new FormData();
  dataForm.append('operacion', 'listarCliente');

  const data = await dataFetch(URL_CLIENTE, dataForm);
  let clientes = '';

  data.forEach(itemCliente => {
    const { id, nombre_completo, dni } = itemCliente;

    clientes += `
      <tr class="table-row">
        <td>${nombre_completo}</td>
        <td>${dni === null ? '' : dni}</td>
        <td>
          <div data-cliente-id="${id}" class="table-cell-action">
            ${botonEditar}
            ${botonEliminar}
          </div>
        </td>
      </tr>
    `;
  });

  tablaClientes.innerHTML = clientes;
};

const addCliente = async () => {
  const dataForm = new FormData();
  dataForm.append('operacion', 'registrarCliente');
  dataForm.append('nombres', $('#input-nombres').value);
  dataForm.append('apellidos', $('#input-apellidos').value);
  dataForm.append('dni', $('#input-dni').value);

  const data = await dataFetch(URL_CLIENTE, dataForm);
  console.log(data);
};
