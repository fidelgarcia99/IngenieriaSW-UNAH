<?php
    header("Content-Type: application/json");

   include("../clases/class_conexion.php");
   $conexion = new Conexion();    

   session_start();
      
   switch($_SERVER['REQUEST_METHOD']){
        case 'POST':
            $user = mysqli_real_escape_string($conexion->getLink(),$_POST['usuario']);
            $passwd = sha1(mysqli_real_escape_string($conexion->getLink(),$_POST['password'])); 
            
            $sql = "SELECT * FROM usuarios WHERE usuario = '$user' and password = '$passwd'";
            $result = $conexion->ejecutarInstruccion($sql);
            
            $count = $conexion->cantidadRegistros($result);
              
            if($count == 1) {
               //session_register("username");
               $_SESSION['login_user'] = $user;
               echo '{"login":1,"token":"re1"}';
            }else {
               echo '{"login":0}';
            }
        break;
   }
     
?>