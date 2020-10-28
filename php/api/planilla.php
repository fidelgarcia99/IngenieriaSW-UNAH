<?php
include_once("../config.php");
  //incluimos la clase conexion para poder crear el objeto Conexion que enviaremos como parametro
  include_once("../clases/class_conexion.php");
  //se incluye la clase personas parapoder llamar sus funciones desde el index
  include_once("../clases/class_planilla.php");
  //objeto Conexion 
  $conexion = new Conexion();

switch ($_GET["accion"]) {
		case '1':
			$idEmpleado = $_POST["idEmpleado"];
			$idPlanilla = $_POST["idPlanilla"];
			
			echo Personas::deducciones($conexion, $idEmpleado, $idPlanilla);

		break;
		case '2':
			$idEmpleado = $_POST["idEmpleado"];
			$idPlanilla = $_POST["idPlanilla"];
			
			echo Personas::bonos($conexion, $idEmpleado, $idPlanilla);

		break;
		case '3':
			$idPlanilla = $_POST["codigo"];
			
			echo Personas::empleados($conexion, $idPlanilla);

		break;
	}
?>


