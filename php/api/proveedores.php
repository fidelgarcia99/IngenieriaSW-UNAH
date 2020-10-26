<?php
    header("Content-Type: application/json");
    require_once('../../vendor/autoload.php');
    require_once('../config.php');
    require_once("../clases/class_conexion.php");
    require_once("../clases/class_jwt.php");
    require_once("../verificaToken.php");
    require_once("../clases/class_proveedor.php");
    $conexion = new Conexion();

    session_start();

    //Servicios web
    switch($_SERVER['REQUEST_METHOD'])
    {
        case 'POST':

            verificaToken();

            if(isset($_POST['nombreP']) && $_POST['nombreP']!='' &&
               isset($_POST['direccionP']) && $_POST['direccionP']!='' &&
               isset($_POST['telefonoP']) && $_POST['telefonoP']!='' &&
               isset($_POST['correoP']) && $_POST['correoP']!=''){

               $proveedor = new Proveedor(
                             $_POST['nombreP'] ,
                             $_POST['direccionP'],
                             $_POST['telefonoP'],
                             $_POST['correoP']
                           );

               if($proveedor->registroProveedor($conexion)){
                 echo '{"res":"OK","mensaje":"Proveedor Agregado."}';
               }else{
                 if(mysqli_errno($conexion->getLink()) == 1062)
                 echo '{"res":"fail","mensaje":"El proveedor ya existe."}';
                 else{
                    $res = array("res"=>"fail","mensaje"=>mysqli_error($conexion->getLink()));
                    echo json_encode($res);
                 }
               }

            }else{
              echo '{"res":"fail","mensaje":"Debe ingresar todos los campos."}';
            }

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
<<<<<<< Updated upstream
                    LEFT JOIN
                persona  AS pe
                 ON p.Persona_idPersona = pe.idPersona
                    LEFT JOIN
=======
                     LEFT JOIN
                persona AS pe
                  ON p.Persona_idPersona = pe.idPersona
                     LEFT JOIN
>>>>>>> Stashed changes
                telefono AS t
                  ON pe.idPersona = t.Persona_idPersona
                ORDER BY Id
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
