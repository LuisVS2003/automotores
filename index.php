<?php

session_start();

if (isset($_SESSION["status"])  && $_SESSION["status"] == true) {
    # code...
    header("Location: ./admin/index.php");
    exit();
}

?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar sesión</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
    <form action="" id="form-login" autocomplete="off">
        <h2>Iniciar sesión</h2>
        <label for="username">Usuario:</label>
        <input type="text" id="correo" name="correo" required>
        <label for="password">Contraseña:</label>
        <input type="password" id="clave" name="clave" required>
        <input type="submit" value="Iniciar sesión">
    </form>

    <script>
        function $(id) {
            return document.querySelector(id);
        }

        $("#form-login").addEventListener("submit", (event) => {
            event.preventDefault();

            parametros = new FormData();
            parametros.append("operacion", "login");
            parametros.append("correo", $("#correo").value);
            parametros.append("clave", $("#clave").value);

            fetch(`../automotores/controllers/EmpleadoController.php`, {
                    method: "POST",
                    body: parametros
                })
                .then(respuesta => respuesta.json())
                .then(datos => {
                    if (datos.acesso) {
                        // alert("Clave correcta");
                        window.location.href = './admin/index.php';
                    } else {
                        alert(datos.mensaje);
                    }
                })
                .catch(e => {
                    console.error(e)
                });

        });
    </script>
</body>

</html>