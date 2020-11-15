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

    //Servicios web
    switch($_SERVER['REQUEST_METHOD'])
    {
        case 'POST':    //Crear producto
            echo '{"res":"post"}';
        break;


        case 'GET':     //Obtener producto/s
        $resultado=null;
            if(isset($_GET['id'])){
              $resultado = $conexion->ejecutarInstruccion('call Producto();');
            }else if(isset($_GET['param'])){
              switch ($_GET['param']) {
                case 'contenedores':
                  $resultado = $conexion->ejecutarInstruccion('call Contenedores();');
                  break;
                case 'marcas':
                $resultado = $conexion->ejecutarInstruccion('call Marcas();');
                  break;
                case 'categorias':
                $resultado = $conexion->ejecutarInstruccion('call Categorias();');
                  break;
                case 'proveedores':
                $resultado = $conexion->ejecutarInstruccion('call Proveedores();');
                  break;
              }
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
            echo '{"res":"delete"}';
        break;
    }
?>
