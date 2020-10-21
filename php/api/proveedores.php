<?php
    header("Content-Type: application/json");

    require_once('../config.php');
    require_once("../clases/class_conexion.php");
    require_once("../clases/class_jwt.php");
    require_once("../verificaToken.php");
    require_once("../clases/class_usuario.php");
    $conexion = new Conexion();

    session_start();

    //Servicios web
    switch($_SERVER['REQUEST_METHOD'])
    {
        case 'POST':
            echo '{"res":"post"}';
        break;

        case 'GET':
            verificaToken($_GET['token']);

            if(isset($_GET['id'])){

            }else{
                $resultado = $conexion->ejecutarInstruccion('SELECT
                p.idProveedor as Id,
                p.nombre_proveedor as Nombre,
                p.direccion_proveedor as Direccion,
                p.telefono_proveedor as Telefono,
                p.correo_proveedor as Email,
                CONCAT(pe.pnombre," ", pe.papellido) as Representante,
                t.num_telefono as Contacto
            FROM
                proveedor AS p
                    INNER JOIN
                persona  AS pe
                 ON p.Persona_idPersona = pe.idPersona
                    INNER JOIN
                telefono AS t
                 ON pe.idPersona = t.Persona_idPersona
            ');

                $res = array(); //creamos un array

                while($row = mysqli_fetch_assoc($resultado))
                {
                    $res[] = $row;
                }
                echo json_encode($res);
            }
        break;

        case 'PUT':     //Actualizar usuario
            echo '{"res":"put"}';
        break;

        case 'DELETE':  //Eliminar usuario
            echo '{"res":"delete"}';
        break;
    }
?>
