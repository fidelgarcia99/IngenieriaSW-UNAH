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
        case 'POST':    //Crear cliente
            echo '{"res":"post"}';
        break;


        case 'GET':     //Obtener cliente/s
            verificaToken($_GET['token']);

            if(isset($_GET['id'])){

            }else{
                $resultado = $conexion->ejecutarInstruccion('SELECT
                p.num_identidad as "Id/RTN",
                CONCAT(p.pnombre," ",p.snombre," ",p.papellido," ",p.sapellido) as "Nombre Completo",
                tel.num_telefono as Telefono,
                co.dir_correo as Email
            FROM
                persona AS p
                INNER JOIN cliente  AS c ON p.idPersona = c.Persona_idPersona
                LEFT JOIN correo as co ON co.Persona_idPersona = p.idPersona
                LEFT JOIN telefono as tel on tel.idTelefono = p.idPersona
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
