<?php
	include_once("../config.php");
  	include_once("../clases/class_conexion.php");
  	include_once("../clases/class_deducciones.php");
  	$conexion = new Conexion();

switch ($_SERVER["REQUEST_METHOD"]) {
        case 'POST'://guardar Deduccion
				//$_POST = json_decode(file_get_contents('php://input'),true);
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
				case 'PUT':
				$_POST = json_decode(file_get_contents('php://input'),true);

				if (isset($_POST['idEmpleado']) && $_POST['idEmpleado']!='' &&
						isset($_POST['idProducto']) && $_POST['idProducto']!='' &&
						isset($_POST['monto']) && $_POST['monto']!='' &&
					isset($_POST['cantidad']) && $_POST['cantidad']!='') {

						$idEmpleado = $_POST["idEmpleado"];
						$idProducto = $_POST["idProducto"];
						$monto = $_POST["monto"];
						$cantidad = $_POST["cantidad"];
						$fecha = date('Y-m-d');

						$resultado = $conexion->ejecutarInstruccion("call SPnuevo_adelantoempleado(
							$idEmpleado,
							$idProducto,
							$cantidad,
							$monto,
							'$fecha');");

					if($resultado){
						echo '{"res":"OK","mensaje":"Adelanto registrado."}';
					}else{
							 $res = array("res"=>"fail","mensaje"=>mysqli_error($conexion->getLink()));
							 echo json_encode($res);
					}
			}else{
				echo '{"res":"fail","mensaje":"Debe ingresar todos los campos."}';
			}
			$conexion = new Conexion();
			$conexion->ejecutarInstruccion("CALL SPsueldo_total($idEmpleado)");
				break;

	}
?>
