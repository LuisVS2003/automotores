const tablaProducto = $('#table-productos tbody');

const dataProductos = async () => {
  const dataForm = new FormData();
  dataForm.append('operacion', 'listarProducto');

  const data = await dataFetch(URL_PRODUCTO, dataForm);

  tablaProducto.innerHTML = '';
  let productos = '';
  data.forEach(itemProducto => {
    const { id, producto, categoria, marca, descripcion, cantidad, precio } = itemProducto;

    productos += `
      <tr data-producto-id="${id}" class="table-row">
        <td class="table-details">
          <h3>${producto}</h3>
          <div>
            <span>${categoria}</span> |
            <span>${marca}</span>
          </div>
        </td>

        <td class="table-text">
          ${descripcion}
        </td>

        <td class="text-center">
          ${cantidad}
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

const getProductoById = async (id) => {
  const dataForm = new FormData();
  dataForm.append('operacion', 'obtenerProducto');
  dataForm.append('id', id);

  const data = await dataFetch(URL_PRODUCTO, dataForm);
  return data;
}

const getCategorias = async (id) => {
  const dataForm = new FormData();
  dataForm.append('operacion', 'listarCategoria');

  const data = await dataFetch(URL_CATEGORIA, dataForm);
  const categoria = $(id);
  addTagOptions(categoria, data, 'nombre');
};

const getMarcas = async (id) => {
  const dataForm = new FormData();
  dataForm.append('operacion', 'listarMarca');

  const data = await dataFetch(URL_MARCA, dataForm);
  const marcas = $(id);
  addTagOptions(marcas, data, 'nombre');
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

  if (data.id > 0) {
    const modalContent = $('#modal-producto-add');
    const backdropModal = $(`#backdrop-modal`);

    modalContent.classList.add('hidden');
    backdropModal.classList.add('hidden');
    dataProductos();
    $('#form-producto-add').reset();
  }
};

$('#table-productos tbody').addEventListener('click', async e => {
  const objetivo = e.target.closest('button') || '';

  if (objetivo !== '') {
    const productoId = e.target.closest('tr').getAttribute('data-producto-id');
    if (objetivo.classList.contains('edit')) {

      const itemProducto =  await getProductoById(productoId);
      console.log(itemProducto);
      const { categoria_id, marca_id, producto:nombre, codigo, precio, descripcion } = itemProducto;
      
      const modalContent = $('#modal-producto-update');
      const modalClose = $('#modal-producto-update .modal-close');
      const modalBackdrop = $('#backdrop-modal');
      
      modalContent.classList.remove('hidden');
      modalBackdrop.classList.remove('hidden');
      
      modalBackdrop.addEventListener('click', e => {
        modalContent.classList.add('hidden');
        modalBackdrop.classList.add('hidden');
      });

      modalClose.addEventListener('click', e => {
        modalContent.classList.add('hidden');
        modalBackdrop.classList.add('hidden');
      });

      $('#update-input-nombre').value = nombre;
      $('#update-input-codigo').value = codigo;
      $('#update-input-precio').value = precio;
      $('#update-input-marca').value = marca_id;
      $('#update-input-categoria').value = categoria_id;
      $('#update-input-descripcion').value = descripcion;



    } else if (objetivo.classList.contains('delete')) {
      console.log('borrar');
      console.log(productoId.getAttribute('data-producto-id'));
    }
  }
});
