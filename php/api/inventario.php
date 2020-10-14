<?php
    header("Content-Type: application/json");

    require_once('../config.php');
    require_once("../clases/class_conexion.php");
    require_once("../clases/class_jwt.php");
    require_once("../verificaToken.php");
    $conexion = new Conexion();    

    session_start();

    //Servicios web
    switch($_SERVER['REQUEST_METHOD'])
    {
        case 'POST':    //Crear producto
            echo '{"res":"post"}';
        break;


        case 'GET':     //Obtener producto/s            
            verificaToken($_GET['token']);

            if(isset($_GET['id'])){

            }else{
                $resultado = $conexion->ejecutarInstruccion('SELECT 
                p.idProducto,
                p.nombre_producto,
                p.fechaElaboracion,
                p.fechaVencimiento,
                p.precioCosto,
                p.precioVenta,
                p.precioOferta,
                p.cantidad,
                p.Contenedor_idContenedor,
                prov.nombre_proveedor,
                prov.telefono_proveedor,
                cont.descripcion_cont,
                pas.descripcion_pasillo,
                a.nombre_area
            FROM
                producto AS p
                    INNER JOIN
                producto_x_proveedor pxp ON p.idProducto = pxp.Producto_idProducto
                    INNER JOIN
                proveedor prov ON pxp.Proveedor_idProveedor = prov.idProveedor
                    INNER JOIN
                contenedor cont ON p.Contenedor_idContenedor = cont.idContenedor
                    INNER JOIN
                pasillo_x_contenedor pxc ON cont.idContenedor = pxc.Contenedor_idContenedor
                    INNER JOIN
                pasillo pas ON pxc.Pasillo_idPasillo = pas.idPasillo
                    INNER JOIN
                area a ON pas.Area_idArea = a.idArea
            GROUP BY p.idProducto HAVING COUNT(*) > 1');
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