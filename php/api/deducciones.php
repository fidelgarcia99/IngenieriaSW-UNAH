<?php
	include_once("../config.php");
  	include_once("../clases/class_conexion.php");
  	include_once("../clases/class_deducciones.php");
  	$conexion = new Conexion();

switch ($_SERVER["REQUEST_METHOD"]) {
        case 'POST'://guardar Deduccion
            $idEmpleado = $_POST["idEmpleado"];
            $inicio = $_POST["inicio"];
            $fin = $_POST["fin"];
            $monto = $_POST["monto"];
            $tipo = $_POST["tipo"];
            
            echo Deduccion::guardarDeduccion($conexion, $idEmpleado, $inicio, $fin, $monto, $tipo);

        break;
        case 'GET'://obtener deducciones
            $idEmpleado = $_GET["idEmpleado"];
            $idPlanilla = $_GET["idPlanilla"];
            
            echo Deduccion::deducciones($conexion, $idEmpleado, $idPlanilla);

        break;
		
	}
?>


