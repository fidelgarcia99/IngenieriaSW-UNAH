<?php
    header("Content-Type: application/json");
    require_once('../../vendor/autoload.php');
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
                per.num_identidad as Id,
                CONCAT(per.pnombre," ",per.snombre," ",per.papellido," ",per.sapellido) as Nombre,
                tel.num_telefono as Telefono,
                per.direccion as Direccion,
                car.nombre_cargo as Funcion,
                car.sueldo_base as Sueldo,
                cxe.fecha_nombramiento as Contratado
            FROM
                empleado AS emp
                INNER JOIN
                persona as per ON emp.Persona_idPersona = per.IdPersona
                left JOIN
                telefono as tel ON tel.Persona_idPersona = per.IdPersona
                inner JOIN
                cargo_x_empleado as cxe on cxe.Empleado_idEmpleado = emp.idEmpleado
                INNER JOIN
                cargo as car on car.idCargo = cxe.Cargo_idCargo

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
