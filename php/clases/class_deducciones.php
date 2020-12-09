<?php
	class Deduccion{	
		public static function deducciones($conexion, $idEmpleado, $idPlanilla){

			$sql = $conexion->ejecutarInstruccion("
				SELECT  
						valor,
						H.fechainicio,
						I.descripcion

				FROM persona as A
				INNER JOIN empleado as B
				ON(A.idPersona=B.Persona_idPersona)
				INNER JOIN empleado_x_planilla as C
				ON(C.Empleado_idEmpleado=B.idEmpleado)
				INNER JOIN planilla as D
				ON(D.idPlanilla=C.Planilla_idPlanilla)
				INNER JOIN empleado_x_deduccion as G
				ON(G.Empleado_idEmpleado=B.idEmpleado)
				INNER JOIN deduccion as H
				ON(H.idDeduccion=G.Deduccion_idDeduccion)
				INNER JOIN tipodeduccion as I
				ON(H.TipoDeduccion_idTipoDeduccion=I.idTipoDeduccion)
				WHERE idEmpleado = '$idEmpleado' AND G.Planilla_idPlanilla = '$idPlanilla' AND idPlanilla = '$idPlanilla' 

			");

			$registros = $conexion->cantidadRegistros($sql);

			if ($registros > 0) {
				while ($fila_personas = $conexion->obtenerFila($sql)) {	
					?>
						<tr>
							<td><?php echo $fila_personas["descripcion"];?></td>
							<td><?php echo $fila_personas["fechainicio"];?></td>
							<td><?php echo $fila_personas["valor"];?></td>
							
						</tr>
					<?php	
				}
			}else{
				?>
				<tr>
					<td><?php echo "No tiene deducciones!";?></td>
				</tr>
			<?php	
			}

			 $conexion->liberarResultado($sql);

        }	
        
		public static function guardarDeduccion($conexion, $idEmpleado, $inicio, $fin, $monto, $tipo){
			$guardar = $conexion->ejecutarInstruccion("
				INSERT INTO deduccion(fechainicio, fechafin, valor, TipoDeduccion_idTipoDeduccion)
				VALUES('$inicio','$fin','$monto','$tipo');
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
				SELECT idDeduccion 
				FROM deduccion
				ORDER BY idDeduccion DESC
				LIMIT 1;
			");
			$res2 = $conexion->obtenerFila($sql2);
			$idDeduccion = $res2["idDeduccion"];

			$sql3 = $conexion->ejecutarInstruccion("
				SELECT Persona_idPersona 
				FROM empleado
				WHERE idEmpleado = '$idEmpleado';
			");
			$res3 = $conexion->obtenerFila($sql3);
			$idPersona = $res3["Persona_idPersona"];

			$fecha = null;
			$estado = null;
			$conexion->ejecutarInstruccion("
			INSERT INTO empleado_x_deduccion(Empleado_idEmpleado, Empleado_Persona_idPersona, Deduccion_idDeduccion, fecha_emp_deduc, estado_emp_deduc, Planilla_idPlanilla) 
			VALUES ('$idEmpleado','$idPersona','$idDeduccion','$fecha','$estado','$idPlanilla')
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

		public static function selectTipos($conexion){

			$sql = $conexion->ejecutarInstruccion("
				SELECT  idTipoDeduccion,
						descripcion
				FROM tipodeduccion
			");

			while ($tipos = $conexion->obtenerFila($sql)) {
				?>
				<option value="<?php echo $tipos["idTipoDeduccion"];?>">
					<?php echo $tipos["descripcion"];?>
				</option>
				<?php	
			}
			
			$conexion->liberarResultado($sql);

		}

		public static function adelantos($conexion, $idEmpleado, $idPlanilla){

			$sql = $conexion->ejecutarInstruccion("CALL AdelantoProductos($idEmpleado, $idPlanilla)");
	
			$registros = $conexion->cantidadRegistros($sql);
	
			if ($registros > 0) {
				while ($row = $conexion->obtenerFila($sql)) {	
					?>
						<tr>
							<td><?php echo $row["descp_gral"];?></td>
							<td><?php echo $row["fechaRegistro"];?></td>
							<td><?php echo $row["monto_adelanto"];?></td>
							
						</tr>
					<?php	
				}
			}else{
				?>
				<tr>
					<td><?php echo "No tiene adelantos!";?></td>
				</tr>
			<?php	
			}
	
			 $conexion->liberarResultado($sql);
	
		}
	}
	
?>