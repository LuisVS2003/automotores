// console.log("itemEmpleados");
document.addEventListener('DOMContentLoaded', e => {
  const tablaEmpleados = $('#table-empleados tbody');

  const URL_EMPLEADO = '../controllers/EmpleadoController.php';

  const dataEmpleados = async () => {
    const dataForm = new FormData();
    dataForm.append('operacion', 'listarEmpleado');

    const data = await dataFetch(URL_EMPLEADO, dataForm);
    tablaEmpleados.innerHTML = '';
    let empleados = '';

    data.forEach(itemEmpleado => {
      const { rol, nombres, apellidos, dni, correo, direccion, salario } = itemEmpleado;

      empleados += `
				<tr class="table-row">

					<td class="table-description">
						${rol}
					</td>
          
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

          <td class="table-description">
						${direccion}
					</td>

          <td class="table-description">
						${salario}
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

    tablaEmpleados.innerHTML = empleados;
  };

  dataEmpleados();
});
