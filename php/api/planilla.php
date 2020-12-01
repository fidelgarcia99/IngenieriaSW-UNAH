<?php
	include_once("../config.php");
  	include_once("../clases/class_conexion.php");
  	include_once("../clases/class_planilla.php");
  	$conexion = new Conexion();

switch ($_SERVER['REQUEST_METHOD']) {
		case 'POST'://guardar Planilla
			$efectiva = $_POST["efectiva"];
			$inicio = $_POST["inicio"];
			$fin = $_POST["fin"];
			
			echo Planilla::guardarPlanilla($conexion, $efectiva, $inicio, $fin);

		break;
		case 'GET'://obtener empleados
			$idPlanilla = $_GET['codigo'];
			
			echo Planilla::empleados($conexion, $idPlanilla);

		break;
		case 'PUT'://actualizar estado
			$_PUT = json_decode(file_get_contents('php://input'), true);
			$estado = $_PUT['estado'];
			
			echo Planilla::actualizarEstado($conexion, $estado);

		break;
		case 'SEL'://select fechas planilla
			
			echo Planilla::llenarFechas($conexion);

		break;
	}
?>


