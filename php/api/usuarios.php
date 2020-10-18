<?php
    header("Content-Type: application/json");

    require_once('../config.php');
    require_once("../clases/class_conexion.php");
    require_once("../clases/class_jwt.php");
    require_once("../verificaToken.php");
    require_once("../clases/class_usuario.php");
    $conexion = new Conexion();

    session_start();

    //Servicios web
    switch($_SERVER['REQUEST_METHOD'])
    {
        case 'POST':    //Crear usuario
            if(isset($_POST['username']) && $_POST['username']!='' &&
               isset($_POST['idEmpleado']) && $_POST['idEmpleado']!='' &&
               isset($_POST['passwd']) && $_POST['passwd']!=''){
                $usuario = new Usuario(
                              $_POST['username'] ,
                              sha1($_POST['passwd']),
                              $_POST['idEmpleado']);

                if($usuario->registraUsuario($conexion)){
                  echo '{"res":"OK","mensaje":"Usuario creado exitosamente."}';
                }else{
                  echo '{"res":"fail","mensaje":"No se pudo crear el usuario."}';
                }
            }else{
              echo '{"res":"fail","mensaje":"Debe ingresar todos los campos."}';
            }

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
