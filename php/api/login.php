<?php
    header("Content-Type: application/json");

    require_once('../config.php');
    require_once('../../vendor/autoload.php');
    require_once("../clases/class_conexion.php");
    require_once("../clases/class_jwt.php");
    $conexion = new Conexion();

    session_start();

    switch($_SERVER['REQUEST_METHOD']){
        case 'POST':
            $user = mysqli_real_escape_string($conexion->getLink(),$_POST['usuario']);
            $passwd = sha1(mysqli_real_escape_string($conexion->getLink(),$_POST['password']));

            $sql = '
            SELECT CONCAT(p.pnombre," ",p.papellido) as nombre, u.nombre_usuario as username, tu.tipo as tipo
            FROM usuario as u
            inner join empleado as e on e.idEmpleado = u.Empleado_idEmpleado
            inner join persona as p on p.idPersona = e.Persona_idPersona
            inner join tipousuario as tu on tu.idtipousuario = u.idtipousuario
            WHERE nombre_usuario = "'.$user.'" AND password = "'.$passwd.'"';

            $result = $conexion->ejecutarInstruccion($sql);

            $count = $conexion->cantidadRegistros($result);

            $filas = mysqli_fetch_assoc($result);

            if($count == 1) {
               $token = JWTokens::generaToken([
                'nombre' => $filas['nombre'],
                'username' => $filas['username'],
                'tipo' => $filas['tipo']
                ]);

                $_SESSION['token'] = $token;
                setcookie("token",$token,time()+TIEMPOTOKEN,'/');
                echo '{"res":"OK"}';
            }else {
                setcookie("token",'',time()-1,'/');
                echo '{"res":"fail","mensaje":"Credenciales Incorrectas"}';
            }
        break;
    }

?>
