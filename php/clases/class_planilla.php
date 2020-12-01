<?php
	class Planilla{
		public static function empleados($conexion, $idPlanilla){

			$personas = $conexion->ejecutarInstruccion("
				SELECT  pnombre, 
						papellido, 	
						num_identidad,
						direccion,
						nombre_cargo,
						fecha_nombramiento,
						idEmpleado,
						sueldo_emp,
						fechainicio,
						fechafin,
						idPlanilla,
						estado_planilla
				FROM persona as A
				INNER JOIN empleado as B
				ON(A.idPersona=B.Persona_idPersona)
				INNER JOIN empleado_x_planilla as C
				ON(C.Empleado_idEmpleado=B.idEmpleado)
				INNER JOIN planilla as D
				ON(D.idPlanilla=C.Planilla_idPlanilla)
				INNER JOIN cargo_x_empleado as E
				ON(E.Empleado_idEmpleado = B.idEmpleado)
				INNER JOIN cargo as F
				ON(F.idCargo=E.Cargo_idCargo)
				WHERE idPlanilla = '$idPlanilla'

			");

			$res = array(); //creamos un array

			while($row = mysqli_fetch_assoc($personas))
			{
				$res['data'][] = $row;
			}
			echo json_encode($res);
			
			$conexion->liberarResultado($personas);
		}	

		public static function llenarFechas($conexion){

			$personas = $conexion->ejecutarInstruccion("
				SELECT  idPlanilla, fechainicio, fechafin FROM planilla
				ORDER BY idPlanilla DESC 
			");

			$c = 0;
			while ($fila_personas = $conexion->obtenerFila($personas)) {
				if ($c==0) {
					?>
					<option selected value="<?php echo $fila_personas["idPlanilla"];?>">
						<?php echo $fila_personas["fechainicio"];?>
						-
						<?php echo $fila_personas["fechafin"];?>
					</option>
					<?php
					$c=1;
				}else{
					?>
					<option value="<?php echo $fila_personas["idPlanilla"];?>">
						<?php echo $fila_personas["fechainicio"];?>
						-
						<?php echo $fila_personas["fechafin"];?>
					</option>
					<?php
				}
			}
			
			 $conexion->liberarResultado($personas);

		}

		public static function estado($conexion){
			$sql = $conexion->ejecutarInstruccion("
				SELECT estado_planilla from planilla WHERE estado_planilla = 'N';
			");
			$res = $conexion->cantidadRegistros($sql);

			echo '{"existe":'.$res.'}';

			$conexion->liberarResultado($sql);
		}

		public static function guardarPlanilla($conexion, $efectiva, $inicio, $fin){
			$guardar = $sql = $conexion->ejecutarInstruccion("
				INSERT INTO planilla(fechaefectiva, fechainicio, fechafin, estado_planilla) VALUES('$efectiva','$inicio','$fin', 'N'); 
			");

			if($guardar){
				echo '{"res":"OK","mensaje":"Planilla Creada Exitosamente."}';
			  }else{
				if(mysqli_errno($conexion->getLink()) == 1062)
				echo '{"res":"fail","mensaje":"No se pudo guardar."}';
				else{
				   $res = array("res"=>"fail","mensaje"=>mysqli_error($conexion->getLink()));
				   echo json_encode($res);
				}
			  }

			$sql = $conexion->ejecutarInstruccion("
				SELECT idPlanilla 
				FROM planilla
				WHERE estado_planilla = 'N';
			");
			$res = $conexion->obtenerFila($sql);
			$idPlanilla = $res["idPlanilla"];
			
			$sql2 = $conexion->ejecutarInstruccion("
				SELECT idEmpleado,
			  		   Persona_idPersona
				FROM empleado
			");

			while($emp = $conexion->obtenerFila($sql2)){
				$idEmpleado = $emp["idEmpleado"];
				$idPersona = $emp["Persona_idPersona"];
				$conexion->ejecutarInstruccion("
					INSERT INTO empleado_x_planilla(Empleado_idEmpleado, Empleado_Persona_idPersona, Planilla_idPlanilla)
					VALUES('$idEmpleado','$idPersona','$idPlanilla');
				");
			}
		}

		public static function actualizarEstado($conexion, $estado){
			$sql = $conexion->ejecutarInstruccion("
				SELECT idPlanilla 
				FROM planilla
				WHERE estado_planilla = 'N';
			");
			$res = $conexion->obtenerFila($sql);
			$idPlanilla = $res["idPlanilla"];

			$conexion->ejecutarInstruccion("
				UPDATE planilla SET estado_planilla = '$estado' WHERE idPlanilla = '$idPlanilla';
			");
		}
	}
?>