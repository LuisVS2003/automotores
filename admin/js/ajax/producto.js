document.addEventListener('DOMContentLoaded', e => {
  const tablaProducto = $('#table-productos tbody');

  const URL_PRODUCTOS = '../controllers/ProductoController.php';

  const dataProductos = async () => {
    const dataForm = new FormData();
    dataForm.append('operacion', 'listarProducto');

    const data = await dataFetch(URL_PRODUCTOS, dataForm);
    console.log(data);
    tablaProducto.innerHTML = '';
    let productos = '';
    data.forEach(itemProducto => {
      const { producto, categoria, marca, descripcion, precio } = itemProducto;

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
