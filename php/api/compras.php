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

    if (!(JWTokens::GetData($_COOKIE['token'])['tipo']=="supervisor" || JWTokens::GetData($_COOKIE['token'])['tipo']=="admin")) {
      echo '{"res":"fail","mensaje":"401: Acceso no autorizado"}';
      exit;
    }

    $_POST = json_decode(file_get_contents('php://input'),true);

    //Servicios web
    switch($_SERVER['REQUEST_METHOD']){

        case 'POST':    //Crear cliente

        break;

        case 'GET':     //Obtener cliente/s
          if (isset($_GET['param']) && $_GET['param']!='') {
            if ($_GET['param']=='id') {
              $id = $_GET['value'];
              $resultado = $conexion->ejecutarInstruccion("call DetalleProducto($id)");
            }
          }else{
            $resultado = $conexion->ejecutarInstruccion("call Compras();");
          }
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
