// console.log("itemProveedores");
document.addEventListener('DOMContentLoaded', e => {
  const tablaProveedores = $('#table-proveedores tbody');

  const URL_PROVEEDOR = '../controllers/ProveedorController.php';

  const dataProveedores = async () => {
    const dataForm = new FormData();
    dataForm.append('operacion', 'listarProveedores');

    const data = await dataFetch(URL_PROVEEDORES, dataForm);
    console.log(data);
    tablaProveedores.innerHTML = '';
    let proveedores = '';
    data.forEach(itemProveedores => {
      const { nombre, telefono, correo, ruc, direccion } = itemProveedores;

			
      proveedores += `
				<tr class="table-row">
					
					<td class="table-description">
						${nombre}
					</td>
          
					<td class="table-description">
						${telefono}
					</td>

					<td class="table-description">
						${correo}
					</td>

					<td class="table-description">
						${ruc}
					</td>

					<td class="table-description">
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
