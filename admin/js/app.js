const $ = selector => document.querySelector(selector);
const $$ = selector => document.querySelectorAll(selector);

/* Start - Fetch ################################################################### */
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
/* Start - Fetch ################################################################### */

document.addEventListener('DOMContentLoaded', () => {
  /* Start - SideBar ################################################################# */
  function sidebarToggle() {
    const sidebar = $('.sidebar').classList;
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

  // $('.sidebar .sidebar-footer').addEventListener('click', () => $('.user-options').classList.toggle('hidden'));

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

  /* Start - Modal ################################################################### */

  /* End - Modal ##################################################################### */
});
