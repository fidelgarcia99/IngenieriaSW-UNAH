<?php
	class Personas{//se crea la clase persona
		
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
						idPlanilla
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
			
			while ($fila_personas = $conexion->obtenerFila($personas)) {	
			?>
				<tr>
					<td><?php echo $fila_personas["pnombre"];?></td>
					<td><?php echo $fila_personas["papellido"];?></td>
					<td><?php echo $fila_personas["nombre_cargo"];?></td>
					<td><?php echo $fila_personas["fecha_nombramiento"];?></td>
					<td>  <!-- Button trigger modal -->
                      <div class="text-center"><button type="button" onclick="deducciones(<?php echo $fila_personas["idEmpleado"];?>, <?php echo $idPlanilla; ?>)" class="btn btn-primary" data-toggle="modal" data-target="#deducciones">Deducciones
                      </button></div>
                    </td> 
                    <td>  <!-- Button trigger modal -->
                      <div class="text-center"><button type="button" onclick="bonos(<?php echo $fila_personas["idEmpleado"];?>, <?php echo $idPlanilla; ?>)"class="btn btn-primary" data-toggle="modal" data-target="#bonos">Bonos
                      </button></div>
                    </td>
                    <td><?php echo $fila_personas["sueldo_emp"];?></td>  
				</tr>
			<?php	
			}
			 $conexion->liberarResultado($personas);
		}

		public static function deducciones($conexion, $idEmpleado, $idPlanilla){

			$sql = $conexion->ejecutarInstruccion("
				SELECT  
						valor,
						H.fechainicio

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
				WHERE idEmpleado = '$idEmpleado' AND G.Planilla_idPlanilla = '$idPlanilla' AND idPlanilla = '$idPlanilla' 

			");

			$registros = $conexion->cantidadRegistros($sql);

			if ($registros > 0) {
				while ($fila_personas = $conexion->obtenerFila($sql)) {	
					?>
						<tr>
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

		public static function llenarFechas($conexion){

			$personas = $conexion->ejecutarInstruccion("
				SELECT  idPlanilla, fechainicio, fechafin FROM planilla 
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
	}
?>