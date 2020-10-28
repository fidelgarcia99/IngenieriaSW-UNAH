<?php
    header("Content-Type: application/json");
    require_once('../../vendor/autoload.php');
    require_once('../config.php');
    require_once("../clases/class_conexion.php");
    require_once("../clases/class_jwt.php");
    require_once("../verificaToken.php");
    require_once("../clases/class_cliente.php");
    $conexion = new Conexion();

    session_start();

    verificaToken();

    //Servicios web
    switch($_SERVER['REQUEST_METHOD'])
    {
        case 'POST':    //Crear cliente
        $_POST = json_decode(file_get_contents('php://input'),true);

        if(isset($_POST['ciudad']) && $_POST['ciudad']!='' &&
           isset($_POST['departamento']) && $_POST['departamento']!='' &&
           isset($_POST['pnombre']) && $_POST['pnombre']!='' &&
           isset($_POST['snombre']) && isset($_POST['sapellido']) &&
           isset($_POST['papellido']) && $_POST['papellido']!='' &&
           isset($_POST['id']) && $_POST['id']!='' &&
           isset($_POST['direccion']) && $_POST['direccion']!='' &&
           isset($_POST['telefono']) && $_POST['telefono']!='' &&
           isset($_POST['email']) && $_POST['email']!=''){

           $cliente = new Cliente(
                         $_POST['pnombre'] ,
                         $_POST['snombre'] ,
                         $_POST['papellido'] ,
                         $_POST['sapellido'] ,
                         $_POST['ciudad'] ,
                         $_POST['direccion'] ,
                         $_POST['telefono'] ,
                         $_POST['email'] ,
                         date('Y-m-d'),
                         $_POST['id'] ,
                         $_POST['departamento']
                       );

           if($cliente->registraCliente($conexion)){
             echo '{"res":"OK","mensaje":"Cliente creado."}';
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

        case 'GET':     //Obtener cliente/s
            if(isset($_GET['id'])){

            }else{
                $resultado = $conexion->ejecutarInstruccion('call Clientes()');

                $res = array(); //creamos un array

                while($row = mysqli_fetch_assoc($resultado))
                {
                    $res[] = $row;
                }
                echo json_encode($res);
            }
        break;


        case 'PUT':     //Actualizar cliente
            echo '{"res":"put"}';
        break;
        case 'DELETE':  //Eliminar cliente
            echo '{"res":"delete"}';
        break;
    }
?>
