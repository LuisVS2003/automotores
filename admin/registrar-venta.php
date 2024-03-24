<!DOCTYPE html>
<html lang="es" class="dark">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registrar Detalle Venta</title>
  <?php require_once './layouts/link-css.html'; ?>
</head>

<body>
  <?php require_once './layouts/navbar.html'; ?>

  <div class="container">
    <?php require_once './layouts/sidebar.php'; ?>

    <div class="content sidebar-toggle">
      <main class="content-main">
        <section class="invoice">
          <form id="form-detalle-venta" action="" method="post">
            <div class="invoice-header">
              <div class="label-input">
                <label for="input-empleado" class="form-label">Empleado:</label>
                <select id="input-empleado" required class="form-select">
                  <option value="">Seleccione</option>
                </select>
              </div>
              <div class="label-input">
                <label for="input-cliente" class="form-label">Cliente:</label>
                <select id="input-cliente" required class="form-select">
                  <option value="">Seleccione</option>
                </select>
              </div>
              <div class="label-input">
                <label for="input-almacen" class="form-label">Almacen:</label>
                <select id="input-almacen" required class="form-select">
                  <option value="">Seleccione</option>
                </select>
              </div>
            </div>

            <div class="invoice-body">
              <table class="table">
                <colgroup>
                  <col width="100px">
                  <col width="120px">
                  <col width="">
                  <col width="120px">
                  <col width="120px">
                </colgroup>
                <thead class="table-head">
                  <tr>
                    <th>Acción</th>
                    <th>Cantidad</th>
                    <th>Descripción</th>
                    <th>Precio</th>
                    <th>Importe</th>
                  </tr>
                </thead>
                <tbody class="table-body">
                  <tr class="table-row">
                    <td class="table-cell-action">
                      <button class="button delete" type="button" aria-label="Eliminar">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                          <path d="M4 7l16 0" />
                          <path d="M10 11l0 6" />
                          <path d="M14 11l0 6" />
                          <path d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
                          <path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" />
                        </svg>
                      </button>
                    </td>

                    <td>
                      <input required min="1" max="" placeholder="0" step="1" type="number" class="input-cantidad form-input text-center" />
                    </td>

                    <td style="position: relative;">
                      <input required data-producto-id="" type="text" class="input-producto form-input" placeholder="Ingrese 3 letras..." />
                      <ul class="options-list hidden"></ul>
                    </td>

                    <td class="precio text-end">0.00</td>

                    <td class="importe text-end">0.00</td>
                  </tr>
                </tbody>
                <tfoot class="table-foot">
                  <tr class="table-row">
                    <td rowspan="2">
                      <button id="input-add" type="button" class="button add" aria-label="Agregar detalle venta">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                          <path d="M12 5l0 14" />
                          <path d="M5 12l14 0" />
                        </svg>
                      </button>
                    </td>
                    <td colspan="2"></td>
                    <td class="text-end">SubTotal:</td>
                    <td id="venta-subtotal" class="text-end">0.00</td>
                  </tr>
                  <tr class="table-row">
                    <td colspan="2"></td>
                    <td class="text-end">Total:</td>
                    <td id="venta-total" class="text-end">0.00</td>
                  </tr>
                </tfoot>
              </table>
              <button type="submit" class="button">Registrar</button>
            </div>
          </form>
        </section>
      </main>
    </div>
  </div>

  <?php require_once './layouts/script-js.html'; ?>
  <script src="./js/ajax/venta.js"></script>
  <script>
    document.addEventListener('DOMContentLoaded', () => {
      let time;
      let inputContent;

      getEmpleado();
      getCliente();
      getAlmacen();

      const addRowDetail = () => {
        const rowDetail = document.createElement('tr');
        rowDetail.classList.add('table-row');
        rowDetail.innerHTML = `
					<td class="table-cell-action">${botonEliminar}</td>
					<td>
						<input type="number" class="input-cantidad form-input text-center" placeholder="0" step="1" />
					</td>
					<td style="position: relative;">
						<input data-producto-id="" type="text" class="input-producto form-input"
							placeholder="Ingrese 3 letras..." />
						<ul class="options-list hidden"></ul>
					</td>
					<td class="precio text-end">0.00</td>
					<td class="importe text-end">0.00</td>
				`;

        $('#form-detalle-venta .table-body').appendChild(rowDetail);
      }

      const deleteRowDetail = event => {
        const table = $('#form-detalle-venta .table-body');
        const row = event.target.closest('.table-row');

        if (table.children.length > 1) row.remove();
        // calcularTotalProducto(rowProducto);
      }

      const dataProductoByName = async nombre => {
        const dataForm = new FormData();
        dataForm.append('operacion', 'buscarProducto');
        dataForm.append('nombre', inputContent);

        const data = await dataFetch(URL_PRODUCTO, dataForm);
        let productos = '';

        data.forEach(itemProducto => {
          const {
            id,
            producto,
            precio
          } = itemProducto;
          productos += `
            <li>
              <button data-producto-id="${id}" data-producto-precio="${precio}" type="button">${producto}</button>
            </li>
          `;
        });

        if (data.length === 0) productos = '<li disabled>No se encontraron resultados</li>';

        return productos;
      }

      const optionsProducto = async event => {
        const inputProducto = event.target;
        const optionsList = inputProducto.nextElementSibling;

        inputProducto.addEventListener('input', () => {
          /* Con este evento evitamos que la función optionsProducto se ejecute cada vez que se escriba */
          clearTimeout(time);
          time = setTimeout(async () => {
            if (inputContent !== inputProducto.value && inputProducto.value.length >= 3) {
              inputContent = inputProducto.value;

              optionsList.innerHTML = '';
              optionsList.innerHTML = await dataProductoByName(inputProducto.value);
              optionsList.classList.remove('hidden');
            }
          }, 500);
        })

      }


      $('#form-detalle-venta').addEventListener('click', e => {
        const objetivo = e.target.closest('button') || e.target;

        if (objetivo === null || objetivo === undefined) return;

        else if (objetivo.classList.contains('delete')) deleteRowDetail(e);

        else if (objetivo.classList.contains('add')) addRowDetail();

        else if (objetivo.classList.contains('input-cantidad')) console.log('Cantidad input');

        else if (objetivo.classList.contains('input-producto')) optionsProducto(e);

      })
    });
  </script>

</body>

</html>