const tablaEmpleados = $('#table-empleados tbody');

const dataEmpleados = async () => {
  const dataForm = new FormData();
  dataForm.append('operacion', 'listarEmpleado');

  const data = await dataFetch(URL_EMPLEADO, dataForm);

  tablaEmpleados.innerHTML = '';
  let empleados = '';

  data.forEach(itemEmpleado => {
    const { nombre_completo, rol, dni, correo, direccion, salario } = itemEmpleado;

    empleados += `
      <tr class="table-row">
        
        <td class="table-text">${nombre_completo}</td>

        <td class="table-text">${rol}</td>

        <td class="table-text">${dni}</td>

        <td class="table-text">${correo}</td>

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

const getRol = async () => {
  const dataForm = new FormData();
  dataForm.append('operacion', 'listarRol');

  const data = await dataFetch(URL_ROL, dataForm);
  addTagOptions($('#select-rol'), data, 'nombre');
};
