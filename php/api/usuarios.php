<?php
    header("Content-Type: application/json");

    require_once('../config.php');
    require_once("../clases/class_conexion.php");
    require_once("../clases/class_jwt.php");
    require_once("../verificaToken.php");
    $conexion = new Conexion();

    session_start();

    //Servicios web
    switch($_SERVER['REQUEST_METHOD'])
    {
        case 'POST':    //Crear usuario
            echo '{"res":"post"}';
        break;


        case 'GET':     //Obtener usuario/s
            verificaToken($_GET['token']);

            if(isset($_GET['id'])){

            }else{
                $resultado = $conexion->ejecutarInstruccion('SELECT *  FROM usuario');

                $res = array(); //creamos un array

                while($row = mysqli_fetch_assoc($resultado))
                {
                    $res[] = $row;
                }
                echo json_encode($res);
            }
        break;


        case 'PUT':     //Actualizar usuario
            echo '{"res":"put"}';
        break;
        case 'DELETE':  //Eliminar usuario
            echo '{"res":"delete"}';
        break;
    }
?>
