<?php
	include_once("../config.php");
  	include_once("../clases/class_conexion.php");
  	include_once("../clases/class_bonos.php");
  	$conexion = new Conexion();

switch ($_SERVER["REQUEST_METHOD"]) {
		case 'POST'://guardar Bono
			$idEmpleado = $_POST["idEmpleado"];
			$desc = $_POST["desc"];
			$fecha = $_POST["fecha"];
			$monto = $_POST["monto"];
			
			echo Bono::guardarBono($conexion, $idEmpleado, $desc, $fecha, $monto);

        break;
        case 'GET'://obtener bonos
			$idEmpleado = $_GET["idEmpleado"];
			$idPlanilla = $_GET["idPlanilla"];
			
			echo Bono::bonos($conexion, $idEmpleado, $idPlanilla);

		break;
	}
?>


