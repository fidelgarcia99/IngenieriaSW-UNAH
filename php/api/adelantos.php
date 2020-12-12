<?php
	include_once("../config.php");
      include_once("../clases/class_conexion.php");
      include_once("../clases/class_deducciones.php");
  	$conexion = new Conexion();

switch ($_SERVER["REQUEST_METHOD"]) {
        case 'GET'://obtener deducciones
            $idEmpleado = $_GET["idEmpleado"];
            $idPlanilla = $_GET["idPlanilla"];
            
            echo Deduccion::adelantos($conexion, $idEmpleado, $idPlanilla);
        break;
		
	}
?>
