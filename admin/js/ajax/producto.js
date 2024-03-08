document.addEventListener('DOMContentLoaded', e => {
  const tablaProducto = $('#table-productos tbody');

  const URL_PRODUCTOS = '../controllers/ProductoController.php';

  const botonEliminar = `
		<button class="button delete" type="button" aria-label="Eliminar">
			<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-trash" width="24" height="24"
				viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" fill="none" stroke-linecap="round"
				stroke-linejoin="round">
				<path stroke="none" d="M0 0h24v24H0z" fill="none" />
				<path d="M4 7l16 0" />
				<path d="M10 11l0 6" />
				<path d="M14 11l0 6" />
				<path d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
				<path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" />
			</svg>
		</button>
	`;

  const botonEditar = `
		<button class="button edit" type="button" aria-label="Editar">
			<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-edit" width="24" height="24"
				viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" fill="none" stroke-linecap="round"
				stroke-linejoin="round">
				<path stroke="none" d="M0 0h24v24H0z" fill="none" />
				<path d="M7 7h-1a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-1" />
				<path d="M20.385 6.585a2.1 2.1 0 0 0 -2.97 -2.97l-8.415 8.385v3h3l8.385 -8.415z" />
				<path d="M16 5l3 3" />
			</svg>
		</button>
	`;

  const dataProductos = async () => {
    const dataForm = new FormData();
    dataForm.append('operacion', 'listarProducto');

    const data = await dataFetch(URL_PRODUCTOS, dataForm);
    console.log(data);

    tablaProducto.innerHTML = '';
    let productos = '';
    data.forEach(itemProducto => {
      const { id, producto, categoria, marca, descripcion, codigo, precio } = itemProducto;

      productos += `
				<tr class="table-row">
					<td class="table-details">
						<h3>${producto}</h3>
						<div>
							<span>${categoria}</span> |
							<span>${marca}</span>
						</div>
					</td>

					<td class="table-description">
						${descripcion}
					</td>

					<td class="text-center">
						${Math.floor(Math.random() * 100)}
					</td>

					<td class="text-end">${precio}</td>

					<td>
						<div class="table-cell-action">
							${botonEditar}
							${botonEliminar}
						</div>
					</td>
				</tr>
			`;
    });

    tablaProducto.innerHTML = productos;
  };

  dataProductos();
});
