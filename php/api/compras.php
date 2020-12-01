<?php
    header("Content-Type: application/json");
    require_once('../../vendor/autoload.php');
    require_once('../config.php');
    require_once("../clases/class_conexion.php");
    require_once("../clases/class_jwt.php");
    require_once("../verificaToken.php");
    $conexion = new Conexion();

    session_start();

    verificaToken();

    $_POST = json_decode(file_get_contents('php://input'),true);

    //Servicios web
    switch($_SERVER['REQUEST_METHOD']){

        case 'POST':    //Crear cliente

        break;

        case 'GET':     //Obtener cliente/s

            $resultado = $conexion->ejecutarInstruccion("call Compras();");

            $res = array(); //creamos un array
            while($row = mysqli_fetch_assoc($resultado))
            {
                $res[] = $row;
            }
            echo json_encode($res);
        break;

        case 'PUT':     //Actualizar cliente

        break;

        case 'DELETE':  //Eliminar cliente

    }
?>
