<?php
    header("Content-Type: application/json");
    require_once('../../vendor/autoload.php');
    require_once('../config.php');
    require_once("../clases/class_conexion.php");
    require_once("../clases/class_jwt.php");
    require_once("../clases/class_usuario.php");
    require_once("../verificaToken.php");
    $conexion = new Conexion();

    session_start();

    verificaToken();

    if (!(JWTokens::GetData($_COOKIE['token'])['tipo']=="admin")) {
      echo '{"res":"fail","mensaje":"401: Acceso no autorizado"}';
      exit;
    }

    $_POST = json_decode(file_get_contents('php://input'),true);

    //Servicios web
    switch($_SERVER['REQUEST_METHOD'])
    {
        case 'POST':    //Crear usuario
            if(isset($_POST['username']) && $_POST['username']!='' &&
               isset($_POST['idEmpleado']) && $_POST['idEmpleado']!='' &&
               isset($_POST['tipo']) && $_POST['tipo']!='' &&
               isset($_POST['passwd']) && $_POST['passwd']!=''){

               $usuario = new Usuario(
                             $_POST['username'] ,
                             sha1($_POST['passwd']),
                             $_POST['idEmpleado'],
                             $_POST['tipo']
                           );

               if($usuario->registraUsuario($conexion)){
                 echo '{"res":"OK","mensaje":"Usuario creado."}';
               }else{
                 if(mysqli_errno($conexion->getLink()) == 1062)
                 echo '{"res":"fail","mensaje":"Nombre de usuario en uso."}';
                 else{
                    $res = array("res"=>"fail","mensaje"=>mysqli_error($conexion->getLink()));
                    echo json_encode($res);
                 }
               }

            }else{
              echo '{"res":"fail","mensaje":"Debe ingresar todos los campos."}';
            }
        break;

        case 'GET':     //Obtener usuario/s
        if (isset($_GET['param']) && isset($_GET['value'])) {

             // Pasan un ID?
             if ($_GET['param'] == "id") {
               $value = $_GET['value'];
               $resultado = $conexion->ejecutarInstruccion("call Usuario($value);");
             }elseif ($_GET['param'] == "retorno" && $_GET['value']=="tipo") {
               $resultado = $conexion->ejecutarInstruccion("call TipoUsuario();");
             }
           }else{
             $resultado = $conexion->ejecutarInstruccion('call Usuarios();');
           }

          // Preparamos el json a retornar
            $res = array(); //creamos un array
            while($row = mysqli_fetch_assoc($resultado))
            {
                $res[] = $row;
            }
            echo json_encode($res);
        break;

        case 'PUT':     //Actualizar usuario
        if(isset($_POST['username']) && $_POST['username']!='' &&
           isset($_POST['idEmpleado']) && $_POST['idEmpleado']!='' &&
           isset($_POST['tipo']) && $_POST['tipo']!='' &&
           isset($_POST['passwd'])){

           if ($_POST['passwd']!='') {
             $_POST['passwd'] = sha1($_POST['passwd']);
           }

           $usuario = new Usuario(
                         $_POST['username'] ,
                         $_POST['passwd'],
                         $_POST['idEmpleado'],
                         $_POST['tipo']
                       );

           if($usuario->actualizarUsuario($conexion,$_POST['id'])){
             echo '{"res":"OK","mensaje":"Usuario Actualizado."}';
           }else{
                $res = array("res"=>"fail","mensaje"=>mysqli_error($conexion->getLink()));
                echo json_encode($res);
             }

        }else{
          echo '{"res":"fail","mensaje":"Debe ingresar todos los campos."}';
        }
        break;

        case 'DELETE':  //Eliminar usuario
        if (isset($_POST['id']) && $_POST['id']!='') {
          if (Usuario::eliminarUsuario($conexion,$_POST['id'])) {
              echo '{"res":"OK","mensaje":"Usuario Eliminado"}';
          }else{
            $res = array("res"=>"fail","mensaje"=>mysqli_error);
          }
        }else{
          echo '{"res":"fail","mensaje":"Debe especificar un id"}';
        }
        break;
    }
?>
