<?php
require_once 'dompdf/autoload.inc.php';

use Dompdf\Dompdf;

// Crear una instancia de Dompdf
$dompdf = new Dompdf();

// Cargar el contenido HTML de la boleta
$html = file_get_contents('boleta.html');

// Cargar el HTML en Dompdf
$dompdf->loadHtml($html);

// Renderizar el HTML como PDF
$dompdf->render();

// Generar el PDF
$dompdf->stream('boleta.pdf');
?>
