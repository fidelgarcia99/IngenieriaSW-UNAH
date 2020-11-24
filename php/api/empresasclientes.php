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
        if(isset($_POST['nombre']) && $_POST['nombre']!='' &&
           isset($_POST['RTN']) && $_POST['RTN']!=''){

             $nombre = $_POST['nombre'];
             $rtn = $_POST['RTN'];

           if($conexion->ejecutarInstruccion("call SPnuevo_empresa_cliente('$nombre','$rtn');")){
             echo '{"res":"OK","mensaje":"Cliente Guardado."}';
           }else{
             if(mysqli_errno($conexion->getLink()) == 1062)
             echo '{"res":"fail","mensaje":"RTN ya registrado"}';
             else{
                $res = array("res"=>"fail","mensaje"=>mysqli_error($conexion->getLink()));
                echo json_encode($res);
             }
           }

        }else{
          echo '{"res":"fail","mensaje":"Debe ingresar todos los campos."}';
        }
        break;

        case 'GET':     //Obtener cliente/s
          $resultado = $conexion->ejecutarInstruccion("call SPempresas_clientes();");
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

        break;
    }
?>
