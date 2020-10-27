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

    //Servicios web
    switch($_SERVER['REQUEST_METHOD'])
    {
        case 'POST':    //Crear usuario
            $_POST = json_decode(file_get_contents('php://input'),true);

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
            $resultado=null;
            if(isset($_GET['param'])){

              switch ($_GET['param']) {
                case 'id':
                  // code...
                  break;
                case 'tipo':
                $resultado = $conexion->ejecutarInstruccion('
                  SELECT tipo
                  FROM tipousuario
                  ');
                break;
              }

            }else{
                $resultado = $conexion->ejecutarInstruccion('
                  SELECT CONCAT(p.pnombre," ",p.papellido) as Empleado, u.nombre_usuario as "Nombre de Usuario", tu.tipo as "Tipo de Cuenta"
                  FROM usuario as u
                  inner join empleado as e on e.idEmpleado = u.Empleado_idEmpleado
                  inner join persona as p on p.idPersona = e.Persona_idPersona
                  inner join tipousuario as tu on tu.idtipousuario = u.idtipousuario');
            }

            if($resultado!=null and $resultado){
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
