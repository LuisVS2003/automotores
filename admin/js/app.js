const $ = selector => document.querySelector(selector);
const $$ = selector => document.querySelectorAll(selector);


/* Link dinámico - background */
$$('#sidebar .sidebar-link').forEach(link => {
  const hrefLink = link.querySelector('a').getAttribute('href').replace('.', '');
  const pathNav = window.location.pathname.replace(/^\/+/g, '');
  if (pathNav.includes(hrefLink)) link.classList.add('active');

  link.addEventListener('click', () => {
    link.classList.add('active');
  });
});


/* Start - Controllers ############################################################### */
const URL_COMPRA = '../controllers/CompraController.php';
const URL_PROVEEDOR = '../controllers/ProveedorController.php';
const URL_EMPLEADO = '../controllers/EmpleadoController.php';
const URL_PRODUCTO = '../controllers/ProductoController.php';
const URL_DETALLE_COMPRA = '../controllers/DetalleCompraController.php';
const URL_ALMACEN = '../controllers/AlmacenController.php';
const URL_CATEGORIA = '../controllers/CategoriaController.php';
const URL_MARCA = '../controllers/MarcaController.php';
const URL_DETALLE_VENTA = '../controllers/DetalleVentaController.php';
const URL_VENTA = '../controllers/VentaController.php';
const URL_CLIENTE = '../controllers/ClienteController.php';
const URL_ROL = '../controllers/RolController.php';
/* End - Controllers ################################################################# */
/* Start - Funciones ################################################ */
const dataFetch = async (url, dataForm) => {
  try {
    const opciones = {
      method: 'POST',
      body: dataForm,
    };
    const res = await fetch(url, opciones);
    const data = await res.json();
    return data;
  } catch (error) {
    console.error(error);
  }
};

const addTagOptions = (indentification, data, textOption) => {
  data.forEach(item => {
    const tagOption = document.createElement('option');
    tagOption.value = item.id;
    tagOption.textContent = item[textOption];

    indentification.appendChild(tagOption);
  });
};

/* Start - Modal ################################################################### */
const modalVisible = (modal, buttonOpen) => {
  $(buttonOpen).addEventListener('click', () => {
    const modalContent = $(`${modal}`);
    const modalClose = $(`${modal} .modal-close`);
    const modalBackdrop = $(`#backdrop-modal`);

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
  });
};
/* End - Modal ########33########################################################### */

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
/* End - Funciones ################################################## */

document.addEventListener('DOMContentLoaded', () => {
  /* Start - SideBar ################################################################# */
  function sidebarToggle() {
    const sidebar = $('#sidebar').classList;
    const contentMain = $('.content').classList;
    const btnOpen = $('.btn-sidebar-open').classList;
    const btnClose = $('.btn-sidebar-close').classList;
    const backdrop = $('.backdrop').classList;

    if (sidebar.contains('sidebar-toggle')) {
      sidebar.remove('sidebar-toggle');
      contentMain.remove('sidebar-toggle');
      btnOpen.add('hidden');
      btnClose.remove('hidden');
      backdrop.remove('sidebar-toggle');
    } else {
      sidebar.add('sidebar-toggle');
      contentMain.add('sidebar-toggle');
      btnOpen.remove('hidden');
      btnClose.add('hidden');
      backdrop.add('sidebar-toggle');
    }
  }

  $('#sidebar-toggle').addEventListener('click', sidebarToggle);
  $('#backdrop').addEventListener('click', sidebarToggle);
  /* End - SideBar ################################################################### */
  /* Start - DarkMode ################################################################ */
  const dark = $('.icon-moon').classList;
  const light = $('.icon-sun').classList;

  $('#dark-mode').addEventListener('click', () => {
    $('html').classList.toggle('dark');
    dark.toggle('hidden');
    light.toggle('hidden');

    localStorage.setItem('theme', $('html').classList.contains('dark') ? 'dark' : 'light');
  });

  // Al cargar la pÃ¡gina los iconos se aplican automaticamente
  if (localStorage.getItem('theme') === 'dark' || $('html').classList.contains('dark')) {
    dark.remove('hidden');
    light.add('hidden');
  } else {
    dark.add('hidden');
    light.remove('hidden');
  }
  /* End - DarkMode ################################################################## */
  /* Start - User Options ############################################################ */
  $('#sidebar .sidebar-footer').addEventListener('click', () => {
    const userOptions = $('#sidebar .sidebar-footer .user-options');
    userOptions.classList.toggle('hidden');
  });

  document.addEventListener('click', e => {
    const sidebarFooter = e.target.closest('.sidebar-footer');
    if (sidebarFooter === null) {
      const userOptions = $('#sidebar .sidebar-footer .user-options');
      userOptions.classList.add('hidden');
    }
  });
  /* End - User Options ############################################################## */
  
});
