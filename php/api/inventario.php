<?php
    header("Content-Type: application/json");
    require_once('../../vendor/autoload.php');
    require_once('../config.php');
    require_once("../clases/class_conexion.php");
    require_once("../clases/class_producto.php");
    require_once("../clases/class_jwt.php");
    require_once("../verificaToken.php");
    $conexion = new Conexion();

    session_start();

    verificaToken();

    $_POST = json_decode(file_get_contents('php://input'),true);
    //Servicios web
    switch($_SERVER['REQUEST_METHOD'])
    {
        case 'POST':    //Crear producto
        if(isset($_POST['descripcion']) && $_POST['descripcion']!='' &&
           isset($_POST['barcode']) && isset($_POST['marca']) &&
           isset($_POST['contenedor']) && $_POST['contenedor']!='' &&
           isset($_POST['categoria']) && $_POST['categoria']!=''){

           $producto = new Producto(
                         $_POST['descripcion'] ,
                         $_POST['barcode'] ,
                         0 , 0 , 0 , 0 ,
                         $_POST['contenedor'] ,
                         $_POST['categoria'] ,
                         $_POST['marca']
                       );

           if($producto->registrarProducto($conexion)){
             echo '{"res":"OK","mensaje":"Producto creado."}';
           }else{
             if(mysqli_errno($conexion->getLink()) == 1062)
             echo '{"res":"fail","mensaje":"Codigo de barra en uso."}';
             else{
                $res = array("res"=>"fail","mensaje"=>mysqli_error($conexion->getLink()));
                echo json_encode($res);
             }
           }

        }else{
          echo '{"res":"fail","mensaje":"Debe ingresar todos los campos."}';
        }
        break;

        case 'GET':     //Obtener producto/s
        $resultado=null;
            if(isset($_GET['id'])){
              $id=$_GET['id'];
              $resultado = $conexion->ejecutarInstruccion("call Producto($id);");
            }else if(isset($_GET['param'])){
              $barcode=$_GET['param'];
              $resultado = $conexion->ejecutarInstruccion("call Producto('$barcode');");
            }else{
              $resultado = $conexion->ejecutarInstruccion('call Inventario();');
            }
            $res = array(); //creamos un array
            while($row = mysqli_fetch_assoc($resultado))            {
                $res[] = $row;
            }
            echo json_encode($res);
        break;

        case 'PUT':     //Actualizar producto
            echo '{"res":"put"}';
        break;

        case 'DELETE':  //Eliminar producto
        if (isset($_POST['id']) && $_POST['id']!='') {
          if (Producto::eliminarProducto($conexion,$_POST['id'])) {
              echo '{"res":"OK","mensaje":"Producto Eliminado"}';
          }else{
            $res = array("res"=>"fail","mensaje"=>mysqli_error);
          }
        }else{
          echo '{"res":"fail","mensaje":"Debe especificar un id"}';
        }
        break;
    }
?>
