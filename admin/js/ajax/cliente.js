// console.log("itemClientes");
document.addEventListener('DOMContentLoaded', e => {
  const tablaClientes = $('#table-clientes tbody');

  const URL_CLIENTE = '../controllers/ClienteController.php';

  const dataClientes = async () => {
    const dataForm = new FormData();
    dataForm.append('operacion', 'listarCliente');

    const data = await dataFetch(URL_CLIENTE, dataForm);
    tablaClientes.innerHTML = '';
    let clientes = '';

    data.forEach(itemCliente => {
      const { nombres, apellidos, dni, correo } = itemCliente;

      clientes += `
				<tr class="table-row">

					<td class="table-description">
						${nombres}
					</td>
          
          <td class="table-description">
						${apellidos}
					</td>

          <td class="table-description">
						${dni}
					</td>

          <td class="table-description">
						${correo}
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

    tablaClientes.innerHTML = clientes;
  };

  dataClientes();
});
