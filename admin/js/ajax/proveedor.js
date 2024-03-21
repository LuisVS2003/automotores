// console.log("itemProveedores");
document.addEventListener('DOMContentLoaded', e => {
  const tablaProveedores = $('#table-proveedores tbody');

  const dataProveedores = async () => {
    const dataForm = new FormData();
    dataForm.append('operacion', 'listarProveedor');

    const data = await dataFetch(URL_PROVEEDOR, dataForm);
    console.log(data);
    tablaProveedores.innerHTML = '';
    let proveedores = '';
    data.forEach(itemProveedor => {
      const { nombre, telefono, correo, ruc, direccion } = itemProveedor;

			
      proveedores += `
				<tr class="table-row">
					
					<td class="table-text">
						${nombre}
					</td>
          
					<td class="table-text">
						${telefono}
					</td>

					<td class="table-text">
						${correo}
					</td>

					<td class="table-text">
						${ruc}
					</td>

					<td class="table-text">
						${direccion}
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

    tablaProveedores.innerHTML = proveedores;
  };

  dataProveedores();
});
