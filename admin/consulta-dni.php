<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consulta DNI</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        #resultado {
            margin-top: 20px;
            font-weight: bold;
        }
    </style>
</head>

<body>

    <form id="consultaForm">
        <label for="dni">Número de DNI (8 dígitos): </label>
        <input type="text" id="dni" name="dni" pattern="[0-9]{8}" title="Debe contener exactamente 8 dígitos numéricos" required>
        <button type="button" id="buscarBtn">Buscar</button>
    </form>

    <div id="resultado"></div>

    <script>
        document.getElementById('buscarBtn').addEventListener('click', function() {
            var dniInput = document.getElementById('dni');
            var dniValue = dniInput.value;

            // Validar que el DNI tenga 8 dígitos
            if (/^\d{8}$/.test(dniValue)) {
                // Realizar la llamada a la API o cualquier acción que necesites
                buscarDNIEnAPI(dniValue);
            } else {
                alert('El número de DNI debe tener exactamente 8 dígitos.');
            }
        });

        async function buscarDNIEnAPI(dni) {
            const URL_API = './consulta-dni-ajax.php';

            const dataForm = new FormData();
            dataForm.append('dni', dni);

            try {
                const response = await fetch(URL_API, {
                    method: 'POST',
                    body: dataForm
                });

                if (response.ok) {
                    const data = await response.json();
                    // Mostrar la información en la pantalla
                    mostrarResultado(data);
                } else {
                    console.error('Error en la llamada a la API');
                }
            } catch (error) {
                console.error('Error al realizar la llamada a la API:', error);
            }
        }

        function mostrarResultado(data) {
            var resultadoDiv = document.getElementById('resultado');
            resultadoDiv.innerHTML = '';

            if (data.error) {
                resultadoDiv.innerText = 'Error: ' + data.error;
            } else {
                // console.log(data);
                resultadoDiv.innerHTML += 'Nombre: ' + data.nombres + '<br>';
                resultadoDiv.innerHTML += 'Apellido Paterno: ' + data.apellidoPaterno + '<br>';
                resultadoDiv.innerHTML += 'Apellido Materno: ' + data.apellidoMaterno + '<br>';
                // Puedes agregar más información según lo que devuelva la API
            }
        }
    </script>

</body>

</html>