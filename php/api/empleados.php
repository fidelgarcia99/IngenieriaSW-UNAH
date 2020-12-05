<?php
    header("Content-Type: application/json");
    require_once('../../vendor/autoload.php');
    require_once('../config.php');
    require_once("../clases/class_conexion.php");
    require_once("../clases/class_jwt.php");
    require_once("../clases/class_empleado.php");
    require_once("../verificaToken.php");
    $conexion = new Conexion();

    session_start();

    verificaToken();

    if (!(JWTokens::GetData($_COOKIE['token'])['tipo']=="supervisor" || JWTokens::GetData($_COOKIE['token'])['tipo']=="admin")) {
      echo '{"res":"fail","mensaje":"401: Acceso no autorizado"}';
      exit;
    }

    //Servicios web
    switch($_SERVER['REQUEST_METHOD'])
    {
        case 'POST':    //Crear producto
        $_POST = json_decode(file_get_contents('php://input'),true);

        if(isset($_POST['ciudad']) && $_POST['ciudad']!='' &&
           isset($_POST['pnombre']) && $_POST['pnombre']!='' &&
           isset($_POST['snombre']) && isset($_POST['sapellido']) && isset($_POST['email']) &&
           isset($_POST['papellido']) && $_POST['papellido']!='' &&
           isset($_POST['identidad']) && $_POST['identidad']!='' &&
           isset($_POST['direccion']) && $_POST['direccion']!='' &&
           isset($_POST['telefono']) && $_POST['telefono']!='' &&
           isset($_POST['cargo']) && $_POST['cargo']!=''){

           $empleado = new Empleado(
                         $_POST['pnombre'] ,
                         $_POST['snombre'] ,
                         $_POST['papellido'] ,
                         $_POST['sapellido'] ,
                         $_POST['identidad'] ,
                         $_POST['direccion'] ,
                         $_POST['telefono'] ,
                         $_POST['ciudad'] ,
                         $_POST['email'] ,
                         $_POST['cargo'],
                         date('Y-m-d')
                       );

           if($empleado->registraEmpleado($conexion)){
             echo '{"res":"OK","mensaje":"Empleado creado."}';
           }else{
             if(mysqli_errno($conexion->getLink()) == 1062)
             echo '{"res":"fail","mensaje":"Id/RTN ya registrado"}';
             else{
                $res = array("res"=>"fail","mensaje"=>mysqli_error($conexion->getLink()));
                echo json_encode($res);
             }
           }

        }else{
          echo '{"res":"fail","mensaje":"Debe ingresar todos los campos."}';
        }
        break;

        case 'GET':     //Obtener producto/s
         
          if(isset($_GET['param']) && isset($_GET['value'])){
            if ($_GET['param'] == "id") {
              $value = $_GET['value'];
              $resultado = $conexion->ejecutarInstruccion("call Empleado($value);");
            }

              $res = array(); //creamos un array

              while($row = mysqli_fetch_assoc($resultado))
              {
                  $res[] = $row;
              }
              echo json_encode($res);

          }else{
              $resultado = $conexion->ejecutarInstruccion("call Empleados();");

              $res = array(); //creamos un array

              while($row = mysqli_fetch_assoc($resultado))
              {
                  $res[] = $row;
              }
              echo json_encode($res);
          }

        break;

        case 'PUT':     //Actualizar producto
          $_POST = json_decode(file_get_contents('php://input'),true);

          if(isset($_POST['ciudad']) && $_POST['ciudad']!='' &&
             isset($_POST['pnombre']) && $_POST['pnombre']!='' &&
             isset($_POST['snombre']) && isset($_POST['sapellido']) && isset($_POST['email']) &&
             isset($_POST['papellido']) && $_POST['papellido']!='' &&
             isset($_POST['identidad']) && $_POST['identidad']!='' &&
             isset($_POST['direccion']) && $_POST['direccion']!='' &&
             isset($_POST['telefono']) && $_POST['telefono']!='' &&
             isset($_POST['cargo']) && $_POST['cargo']!=''){
  
             $empleado = new Empleado(
                           $_POST['pnombre'] ,
                           $_POST['snombre'] ,
                           $_POST['papellido'] ,
                           $_POST['sapellido'] ,
                           $_POST['identidad'] ,
                           $_POST['direccion'] ,
                           $_POST['telefono'] ,
                           $_POST['ciudad'] ,
                           $_POST['email'],
                           $_POST['cargo'],
                           date('Y-m-d')
                         );
  
             if($empleado->actualizarEmpleado($conexion, $_POST['id'])){
               echo '{"res":"OK","mensaje":"Empleado actualizado."}';
             }else{
               if(mysqli_errno($conexion->getLink()) == 1062)
               echo '{"res":"fail","mensaje":"Ha ocurrido un problema."}';
               else{
                  $res = array("res"=>"fail","mensaje"=>mysqli_error($conexion->getLink()));
                  echo json_encode($res);
               }
             }
  
          }else{
            echo '{"res":"fail","mensaje":"Debe ingresar todos los campos."}';
          }
        break;

        case 'DELETE':  //Eliminar producto
            echo '{"res":"delete"}';
        break;
    }
?>
