<?php
    header("Content-Type: application/json");
    require_once('../../vendor/autoload.php');
    require_once('../config.php');
    require_once("../clases/class_conexion.php");
    require_once("../clases/class_jwt.php");
    require_once("../verificaToken.php");
    require_once("../clases/class_proveedor.php");
    $conexion = new Conexion();

    session_start();

    verificaToken();

    $_POST = json_decode(file_get_contents('php://input'),true);

    //Servicios web
    switch($_SERVER['REQUEST_METHOD'])
    {
        case 'POST':          
            if(isset($_POST['nombreP']) && $_POST['nombreP']!='' &&
               isset($_POST['direccionP']) && $_POST['direccionP']!='' &&
               isset($_POST['telefonoP']) && $_POST['telefonoP']!='' &&
               isset($_POST['correoP']) && $_POST['correoP']!=''){

               $proveedor = new Proveedor(
                             $_POST['nombreP'] ,
                             $_POST['direccionP'],
                             $_POST['telefonoP'],
                             $_POST['correoP']
                           );

               if($proveedor->registroProveedor($conexion)){
                 echo '{"res":"OK","mensaje":"Proveedor Agregado."}';
               }else{
                 if(mysqli_errno($conexion->getLink()) == 1062)
                 echo '{"res":"fail","mensaje":"El proveedor ya existe."}';
                 else{
                    $res = array("res"=>"fail","mensaje"=>mysqli_error($conexion->getLink()));
                    echo json_encode($res);
                 }
               }

            }else{
              echo '{"res":"fail","mensaje":"Debe ingresar todos los campos."}';
            }

        break;

        case 'GET':
            if(isset($_GET['id'])){

            }else{
                $resultado = $conexion->ejecutarInstruccion('call Proveedores();');

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
        if (isset($_POST['id']) && $_POST['id']!='') {
          if (Proveedor::eliminarProveedor($conexion,$_POST['id'])) {
              echo '{"res":"OK","mensaje":"Proveedor Eliminado"}';
          }else{
            $res = array("res"=>"fail","mensaje"=>mysqli_error);
          }
        }else{
          echo '{"res":"fail","mensaje":"Debe especificar un id"}';
        }
        break;
    }
?>
