// console.log("itemClientes");
document.addEventListener('DOMContentLoaded', e => {
  const tablaClientes = $('#table-clientes tbody');

  const URL_CLIENTES = '../controllers/ClienteController.php';

  const dataClientes = async () => {
    const dataForm = new FormData();
    dataForm.append('operacion', 'listarClientes');

    const data = await dataFetch(URL_CLIENTES, dataForm);
    console.log(data);
    tablaClientes.innerHTML = '';
    let clientes = '';
    data.forEach(itemClientes => {
      const {nombres, apellidos, dni, correo} = itemEmpleados;

			
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
