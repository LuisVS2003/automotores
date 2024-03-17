// console.log("itemClientes");
document.addEventListener('DOMContentLoaded', e => {
  const tablaClientes = $('#table-clientes .table-body');

  const dataClientes = async () => {
    const dataForm = new FormData();
    dataForm.append('operacion', 'listarCliente');

    const data = await dataFetch(URL_CLIENTE, dataForm);

    data.forEach(itemCliente => {
      const { id, nombres, apellidos, dni } = itemCliente;

      // Clonar el template para cada fila
      const trTemplate = $('#table-row-cliente').content.cloneNode(true);

      // Seleccionar elementos dentro del template clonado
      const tr = trTemplate.querySelector('.table-row');
      const tdNombre = tr.querySelector('.cliente-nombres');
      const tdApellidos = tr.querySelector('.cliente-apellidos');
      const tdDni = tr.querySelector('.cliente-dni');
      const tdAcciones = tr.querySelector('.table-cell-action');

      // Asignar valores a los elementos
      tr.setAttribute('data-cliente-id', id);
      tdNombre.textContent = nombres;
      tdApellidos.textContent = apellidos;
      tdDni.textContent = dni;
      tdAcciones.innerHTML = `
        ${botonEditar}
        ${botonEliminar}
      `;

      // Agregar el template clonado al DOM
      tablaClientes.appendChild(trTemplate);
    });
  };

  dataClientes();
});
