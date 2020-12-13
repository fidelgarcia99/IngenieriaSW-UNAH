<?php
    header("Content-Type: application/json");
    require_once('../../vendor/autoload.php');
    require_once('../config.php');
    require_once("../clases/class_conexion.php");
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
        case 'POST':    //Crear compra
          if(isset($_POST['numFactura']) && $_POST['numFactura']!='' &&
           isset($_POST['cliente']) && $_POST['cliente']!='' &&
           isset($_POST['subtotal']) && $_POST['subtotal']!='' &&
           isset($_POST['isv']) && $_POST['isv']!='' &&
           isset($_POST['descuento']) && isset($_POST['rtn']) &&
           isset($_POST['total']) && $_POST['total']!='' &&
           isset($_POST['carrito']) && $_POST['carrito']!='' ){

          $result = mysqli_autocommit($conexion->getLink(), FALSE);
           if (!$result) {
             $res = array("res"=>"fail","mensaje"=>"Tuvimos un problema: (". mysqli_errno($conexion->getLink()) . ") " . mysqli_error($conexion->getLink()));
             echo json_encode($res);exit;
           }

           $result = mysqli_begin_transaction($conexion->getLink());
           if (!$result) {
             $res = array("res"=>"fail","mensaje"=>"Tuvimos un problema: (". mysqli_errno($conexion->getLink()) . ") " . mysqli_error($conexion->getLink()));
             echo json_encode($res);exit;
           }

            $sql = 'call SPnueva_venta('.$_POST['nom_proveedor'].','.$_POST['total'].',
            '.$_POST['isv'].','.$_POST['descuento'].',"'.$_POST['numFactura'].'","'.$_POST['fechaFactura'].'");';

            foreach ($_POST['carrito'] as $key) {
              $sql.= 'call SPnueva_detalle_venta("'.$key['barcode'].'" , "'.$_POST['numFactura'].'" , '.$key['cantidad'].',
               '.$key['precio'].' , '.$key['costo'].' , '.$key['isv'].' , '.$key['descuento'].' , '.$key['total'].');';
            }

            mysqli_multi_query($conexion->getLink(), $sql);

            do {
              if (mysqli_errno($conexion->getLink())!=0) {
                if (mysqli_rollback($conexion->getLink())) {
                  $res = array("res"=>"fail","mensaje"=>"Fallo el registro pero se hizo rollback: (". mysqli_errno($conexion->getLink()) . ") " . mysqli_error($conexion->getLink()));
                }else{
                  $res = array("res"=>"fail","mensaje"=>"Fallo el registro y no se hizo rollback: (". mysqli_errno($conexion->getLink()) . ") " . mysqli_error($conexion->getLink()));
                }
                mysqli_autocommit($conexion->getLink(), TRUE);
                echo json_encode($res);exit;
              }
            } while (mysqli_next_result($conexion->getLink()));

              if (mysqli_commit($conexion->getLink())) {
                echo '{"res":"OK","mensaje":"Compra creada."}';
              }else{
                $res = array("res"=>"fail","mensaje"=>"Fallo el commit: (". mysqli_errno($conexion->getLink()) . ") " . mysqli_error($conexion->getLink()));
                echo json_encode($res);
              }
      }else{
        echo '{"res":"fail","mensaje":"Debe ingresar todos los campos."}';
      }
      mysqli_autocommit($conexion->getLink(), TRUE);
        break;

        case 'GET':     //Obtener cliente/s
          if (isset($_GET['param']) && $_GET['param']!='') {
            if ($_GET['param']=='id') {
              $id = $_GET['value'];
              $resultado = $conexion->ejecutarInstruccion("call DetalleVenta($id)");
            }
          }else{
            $resultado = $conexion->ejecutarInstruccion("call Ventas();");
          }
            $res = array(); //creamos un array
            while($row = mysqli_fetch_assoc($resultado))
            {
                $res[] = $row;
            }
            echo json_encode($res);
        break;

        case 'PUT':     //Actualizar cliente

        break;

        case 'DELETE':  //Eliminar cliente

    }
