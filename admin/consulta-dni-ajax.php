<?php



// Verificar si se ha enviado un número de DNI mediante POST
if (isset($_POST["dni"])) {
    // Obtener el número de DNI desde el formulario
    $dni = $_POST["dni"];

    // Datos
    // $token = 'apis-token-1.aTSI1U7KEuT-6bbbCguH-4Y8TI6KS73N';
    // NOTA: tener el la extencion de curl activado en su servidor 

    // Token de la API
    $token = 'apis-token-7710.1K55fbC8OZDPA2vFUiqRb-OQwRIN7At7';

    // Iniciar llamada a la API
    $curl = curl_init();

    // Configurar la llamada a la API con el número de DNI proporcionado
    curl_setopt_array($curl, array(
        CURLOPT_URL => 'https://api.apis.net.pe/v2/reniec/dni?numero=' . $dni,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_SSL_VERIFYPEER => 0,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 2,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_CUSTOMREQUEST => 'GET',
        CURLOPT_HTTPHEADER => array(
            'Referer: https://apis.net.pe/consulta-dni-api',
            'Authorization: Bearer ' . $token
        ),
    ));

    // Ejecutar la llamada a la API y obtener la respuesta
    $response = curl_exec($curl);

    // Cerrar la conexión cURL
    curl_close($curl);

    // Decodificar la respuesta JSON
    $persona = json_decode($response, true);

    // Devolver la información en formato JSON
    header('Content-Type: application/json');
    echo json_encode($persona);
} else {
    // Si no se proporcionó un número de DNI, devolver un mensaje de error
    echo json_encode(array("error" => "Número de DNI no proporcionado."));
}
