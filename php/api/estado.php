<?php
	include_once("../config.php");
  	include_once("../clases/class_conexion.php");
  	include_once("../clases/class_planilla.php");
  	$conexion = new Conexion();

switch ($_SERVER['REQUEST_METHOD']) {
		case 'GET':
			
			echo Planilla::estado($conexion);

		break;
	}
?>