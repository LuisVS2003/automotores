<?php


// Datos
// $token = 'apis-token-1.aTSI1U7KEuT-6bbbCguH-4Y8TI6KS73N';
$token = 'apis-token-7710.1K55fbC8OZDPA2vFUiqRb-OQwRIN7At7';
$dni = '46027897';

// Iniciar llamada a API
$curl = curl_init();

// Buscar dni
curl_setopt_array($curl, array(
    // para user api versión 2
    CURLOPT_URL => 'https://api.apis.net.pe/v2/reniec/dni?numero=' . $dni,
    // para user api versión 1
    // CURLOPT_URL => 'https://api.apis.net.pe/v1/dni?numero=' . $dni,
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

$response = curl_exec($curl);

curl_close($curl);
// Datos listos para usar
$persona = json_decode($response);
var_dump($persona);



// $dni = $_POST["dni"];


// if (strlen($dni) < 8 || strlen($dni) > 8) {
//     $prueba = 1;
// } else {




//     $prueba = file_get_contents('https://api.apis.net.pe/v1/dni?numero=' . $dni . '');
// }








// echo $prueba;

















/*



$dni=$_POST["dni"];


if(strlen($dni)<8 || strlen($dni)>8)
{
    $prueba=1;
}
else{
    
    

   
        $prueba=file_get_contents('https://api.apis.net.pe/v1/dni?numero='.$dni.'');
   
  
}








echo $prueba;





*/
