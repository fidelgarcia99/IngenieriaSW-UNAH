<?php
	class Bono{//se crea la clase persona
		public static function bonos($conexion, $idEmpleado, $idPlanilla){

			$sql = $conexion->ejecutarInstruccion("
				SELECT  
						monto,
						fecha_bono,
						descripcion

				FROM persona as A
				INNER JOIN empleado as B
				ON(A.idPersona=B.Persona_idPersona)
				INNER JOIN empleado_x_planilla as C
				ON(C.Empleado_idEmpleado=B.idEmpleado)
				INNER JOIN planilla as D
				ON(D.idPlanilla=C.Planilla_idPlanilla)
				INNER JOIN empleado_x_bono as E
				ON(E.Empleado_idEmpleado=B.idEmpleado)
				INNER JOIN bono as F
				ON(F.idBono=E.Bono_idBono)
				WHERE idEmpleado = '$idEmpleado' AND E.Planilla_idPlanilla = '$idPlanilla' AND idPlanilla = '$idPlanilla'  

			");

			$registros = $conexion->cantidadRegistros($sql);

			if ($registros > 0) {
				while ($fila_personas = $conexion->obtenerFila($sql)) {
					?>
						<tr>
							<td><?php echo $fila_personas["descripcion"];?></td>
							<td><?php echo $fila_personas["fecha_bono"];?></td>
							<td><?php echo $fila_personas["monto"];?></td>
							
						</tr>

					<?php	
				}
			}else{
				?>
					<tr>
						<td><?php echo "No tiene bonos!";?></td>
					</tr>
				<?php	
			}
			
			 $conexion->liberarResultado($sql);

		}	

		public static function guardarBono($conexion, $idEmpleado, $desc, $fecha, $monto){
			$guardar = $conexion->ejecutarInstruccion("
				INSERT INTO bono(descripcion, fecha_bono, monto)
				VALUES('$desc','$fecha','$monto');
			");

			if($guardar){
				echo '{"res":"OK","mensaje":"Guardado Exitoso."}';
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
				SELECT idBono 
				FROM bono
				ORDER BY idBono DESC
				LIMIT 1;
			");
			$res2 = $conexion->obtenerFila($sql2);
			$idBono = $res2["idBono"];

			$sql3 = $conexion->ejecutarInstruccion("
				SELECT Persona_idPersona 
				FROM empleado
				WHERE idEmpleado = '$idEmpleado';
			");
			$res3 = $conexion->obtenerFila($sql3);
			$idPersona = $res3["Persona_idPersona"];

			$estado = null;
			$conexion->ejecutarInstruccion("
			INSERT INTO empleado_x_bono(Empleado_idEmpleado, Empleado_Persona_idPersona, Bono_idBono, estado_bono, Planilla_idPlanilla) 
			VALUES ('$idEmpleado','$idPersona','$idBono','$estado','$idPlanilla')
			");

			$conexion->ejecutarInstruccion("CALL SPsueldo_total($idEmpleado, $idPlanilla)");
		}

		public static function selectEmpleados($conexion){

			$personas = $conexion->ejecutarInstruccion("
				SELECT  pnombre, 
						papellido, 	
						num_identidad,
						idEmpleado
				FROM persona as A
				INNER JOIN empleado as B
				ON(A.idPersona=B.Persona_idPersona)
			");

			while ($fila_personas = $conexion->obtenerFila($personas)) {
				?>
				<option value="<?php echo $fila_personas["idEmpleado"];?>">
					<?php echo $fila_personas["pnombre"]." ".$fila_personas["papellido"];?>
					-
					<?php echo $fila_personas["num_identidad"];?>
				</option>
				<?php	
			}
			
			$conexion->liberarResultado($personas);

		}
	}
?>