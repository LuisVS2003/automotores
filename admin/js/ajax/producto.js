const tablaProducto = $('#table-productos tbody');

const dataProductos = async () => {
  const dataForm = new FormData();
  dataForm.append('operacion', 'listarProducto');

  const data = await dataFetch(URL_PRODUCTO, dataForm);

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

const getCategorias = async () => {
  const categoria = $('#form-producto-categoria');

  const dataForm = new FormData();
  dataForm.append('operacion', 'listarCategoria');

  const data = await dataFetch(URL_CATEGORIA, dataForm);

  data.forEach(item => {
    let tagOption = document.createElement('option');
    tagOption.value = item.id;
    tagOption.textContent = item.nombre;
    categoria.appendChild(tagOption);
  });
};

const getMarcas = async () => {
  const marcas = $('#form-producto-marca');

  const dataForm = new FormData();
  dataForm.append('operacion', 'listarMarca');

  const data = await dataFetch(URL_MARCA, dataForm);

  data.forEach(item => {
    let tagOption = document.createElement('option');
    tagOption.value = item.id;
    tagOption.textContent = item.nombre;
    marcas.appendChild(tagOption);
  });
};

const addProductos = async () => {
  const dataForm = new FormData();
  dataForm.append('operacion', 'registrarProducto');
  dataForm.append('categoria_id', $('#form-producto-categoria').value);
  dataForm.append('marca_id', $('#form-producto-marca').value);
  dataForm.append('nombre', $('#form-producto-nombre').value);
  dataForm.append('codigo', $('#form-producto-codigo').value);
  dataForm.append('descripcion', $('#form-producto-descripcion').value);
  dataForm.append('precio', $('#form-producto-precio').value);
  dataForm.append('imagen', $('#form-producto-imagen').files[0]);

  const data = await dataFetch(URL_PRODUCTO, dataForm);
  console.log(data);
};


