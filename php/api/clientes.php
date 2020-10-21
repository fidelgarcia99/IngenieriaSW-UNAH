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
        case 'POST':    //Crear cliente
            echo '{"res":"post"}';
        break;


        case 'GET':     //Obtener cliente/s
            verificaToken($_GET['token']);

            if(isset($_GET['id'])){

            }else{
                $resultado = $conexion->ejecutarInstruccion('SELECT
                p.num_identidad as Id,
                CONCAT(p.pnombre," ",p.snombre," ",p.papellido," ",p.sapellido) as "Nombre Completo",
                c.idCliente as RTN
            FROM
                persona AS p
                    INNER JOIN
                cliente  AS c
                 ON p.idPersona = c.Persona_idPersona
            ');

                $res = array(); //creamos un array

                while($row = mysqli_fetch_assoc($resultado))
                {
                    $res[] = $row;
                }
                echo json_encode($res);
            }
        break;


        case 'PUT':     //Actualizar cliente
            echo '{"res":"put"}';
        break;
        case 'DELETE':  //Eliminar cliente
            echo '{"res":"delete"}';
        break;
    }
?>
