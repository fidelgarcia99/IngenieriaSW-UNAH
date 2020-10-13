<?php
    header("Content-Type: application/json");

    require_once('../config.php');
    require_once("../clases/class_conexion.php");
    require_once("../clases/class_jwt.php");
    $conexion = new Conexion();    

    session_start();
      
    switch($_SERVER['REQUEST_METHOD']){
        case 'POST':
            $user = mysqli_real_escape_string($conexion->getLink(),$_POST['usuario']);
            $passwd = sha1(mysqli_real_escape_string($conexion->getLink(),$_POST['password'])); 
            
            $sql = "SELECT * FROM usuario WHERE nombre_usuario = '$user' and password = '$passwd'";
            $result = $conexion->ejecutarInstruccion($sql);
            
            $count = $conexion->cantidadRegistros($result);
              
            if($count == 1) {               
               $token = JWTokens::generaToken([
                'email' => "email@test.com",
                'nombre_usuario' => $user
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