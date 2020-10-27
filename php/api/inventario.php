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
            if(isset($_GET['id'])){

            }else{
                $resultado = $conexion->ejecutarInstruccion('SELECT
                p.idProducto as Id,
                p.nombre_producto as Nombre,
                p.precioCosto as Costo,
                p.precioVenta as Precio,
                p.cantidad as Cantidad,
                prov.nombre_proveedor as Proveedor
            FROM
                producto AS p
                    INNER JOIN
                producto_x_proveedor  AS pxp
                 ON p.idProducto = pxp.Producto_idProducto
                    INNER JOIN
                proveedor AS prov
                 ON pxp.Proveedor_idProveedor = prov.idProveedor
            ');

                $res = array(); //creamos un array

                while($row = mysqli_fetch_assoc($resultado))
                {
                    $res[] = $row;
                }
                echo json_encode($res);
            }
        break;


        case 'PUT':     //Actualizar producto
            echo '{"res":"put"}';
        break;
        case 'DELETE':  //Eliminar producto
            echo '{"res":"delete"}';
        break;
    }
?>
