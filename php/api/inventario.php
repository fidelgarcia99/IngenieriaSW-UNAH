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
        case 'POST':    //Crear producto
            echo '{"res":"post"}';
        break;


        case 'GET':     //Obtener producto/s            
            verificaToken($_GET['token']);

            if(isset($_GET['id'])){

            }else{
                $resultado = $conexion->ejecutarInstruccion('select * from producto');
                $res = array(); //creamos un array
            
                 $i=0;
                while($row = mysqli_fetch_array($resultado))
                {
                    $res[$i] = $row;
                    $i++;
                }
                echo json_encode($res);
            }
        break;


        case 'PUT':     //Actualizar producto
            echo '{"res":"put"}';
        break;
        case 'DELETE':  //Eliminar producto
            echo '{"res":"delete"}';
        break;
    }
?>