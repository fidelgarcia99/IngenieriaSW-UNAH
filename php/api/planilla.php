<?php
  //incluimos la clase conexion para poder crear el objeto Conexion que enviaremos como parametro
  include_once("../clases/class_conexion.php");
  //se incluye la clase personas parapoder llamar sus funciones desde el index
  include_once("../clases/class_planilla.php");
  //objeto Conexion 
  $conexion = new Conexion();

switch ($_GET["accion"]) {
		case '1'://agregar elemento  al JSON
			$idEmpleado = $_POST["codigo"];
			
			echo Personas::deducciones($conexion, $idEmpleado);

		break;
		case '2'://agregar elemento  al JSON
			$idEmpleado = $_POST["codigo"];
			
			echo Personas::bonos($conexion, $idEmpleado);

		break;
		
	}
?>


