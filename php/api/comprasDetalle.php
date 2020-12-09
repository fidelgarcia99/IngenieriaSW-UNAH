<?php
    header("Content-Type: application/json");
    require_once('../../vendor/autoload.php');
    require_once('../config.php');
    require_once("../clases/class_conexion.php");
    include_once("../clases/class_compra.php");
    require_once("../clases/class_jwt.php");
    require_once("../verificaToken.php");
    $conexion = new Conexion();

    session_start();

    verificaToken();

    if (!(JWTokens::GetData($_COOKIE['token'])['tipo']=="supervisor" || JWTokens::GetData($_COOKIE['token'])['tipo']=="admin")) {
      echo '{"res":"fail","mensaje":"401: Acceso no autorizado"}';
      exit;
    }

    $_POST = json_decode(file_get_contents('php://input'),true);

    //Servicios web
    switch($_SERVER['REQUEST_METHOD']){

        case 'POST':    //Crear compraDetalle
          if(isset($_POST['numFactura']) && $_POST['numFactura']!='' &&
           isset($_POST['producto']) && $_POST['producto']!='' &&
           isset($_POST['cantidad']) && $_POST['cantidad']!='' &&
           isset($_POST['precio']) && $_POST['precio']!='' &&
           isset($_POST['ISV']) && $_POST['ISV']!='' &&
           isset($_POST['descuento']) && $_POST['descuento']!='' &&
           isset($_POST['total']) && $_POST['total']!='' ){

           $compraDetalle = new Compra(

                        $_POST['numFactura'] ,
                        $_POST['producto'] ,
                        $_POST['cantidad'] ,
                        $_POST['precio'] ,
                        $_POST['ISV'] ,
                        $_POST['descuento'] ,
                        $_POST['total']
                        );

                      if($compraDetalle->registrarCompraDetalle($conexion)){
                        echo '{"res":"OK","mensaje":"Detalle de compra registrado."}';
                      }else{
                        if(mysqli_errno($conexion->getLink()) == 1062)
                            echo '{"res":"fail","mensaje":"El Registro ya existe."}';
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
          
        break;

        case 'PUT':     //Actualizar cliente

        break;

        case 'DELETE':  //Eliminar cliente

    }
