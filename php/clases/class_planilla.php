<?php
	class Personas{//se crea la clase persona
		
		public static function empleados($conexion){

			$personas = $conexion->ejecutarInstruccion('
				SELECT  pnombre, 
						papellido, 	
						num_identidad,
						direccion,
						idEmpleado,
						sueldo_emp,
						fechainicio,
						fechafin
				FROM persona as A
				INNER JOIN empleado as B
				ON(A.idPersona=B.Persona_idPersona)
				INNER JOIN empleado_x_planilla as C
				ON(C.Empleado_idEmpleado=B.idEmpleado)
				INNER JOIN planilla as D
				ON(D.idPlanilla=C.Planilla_idPlanilla)
				WHERE fechainicio = "2019-12-09"

			');
			
			while ($fila_personas = $conexion->obtenerFila($personas)) {	
			?>
				<tr>
					<td><?php echo $fila_personas["pnombre"];?></td>
					<td><?php echo $fila_personas["papellido"];?></td>
					<td><?php echo $fila_personas["num_identidad"];?></td>
					<td><?php echo $fila_personas["direccion"];?></td>
					<td>  <!-- Button trigger modal -->
                      <div class="text-center"><button type="button" onclick="deducciones(<?php echo $fila_personas["idEmpleado"];?>)" class="btn btn-primary" data-toggle="modal" data-target="#deducciones">Deducciones
                      </button></div>
                    </td> 
                    <td>  <!-- Button trigger modal -->
                      <div class="text-center"><button type="button" onclick="bonos(<?php echo $fila_personas["idEmpleado"];?>)"class="btn btn-primary" data-toggle="modal" data-target="#bonos">Bonos
                      </button></div>
                    </td>
                    <td><?php echo $fila_personas["sueldo_emp"];?></td>  
				</tr>
			<?php	
			}
			 $conexion->liberarResultado($personas);
		}

		public static function deducciones($conexion, $idEmpleado){

			$personas = $conexion->ejecutarInstruccion("
				SELECT  
						valor,
						D.fechainicio

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
				WHERE idEmpleado = '$idEmpleado' AND D.fechainicio = '2019-12-09'

			");

			
			$c = 0;
			while ($fila_personas = $conexion->obtenerFila($personas)) {
				
			?>
				<tr>
					<td><?php echo "descripcion";?></td>
					<td><?php echo $fila_personas["valor"];?></td>
					
				</tr>
			<?php	
			}
			 $conexion->liberarResultado($personas);

		}	

		public static function bonos($conexion, $idEmpleado){

			$personas = $conexion->ejecutarInstruccion("
				SELECT  
						monto,
						fecha_bono,
						fechainicio

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
				WHERE idEmpleado = '$idEmpleado' AND fechainicio = '2019-12-09'

			");

			
			$c = 0;
			while ($fila_personas = $conexion->obtenerFila($personas)) {
				
			?>

				<tr>
					<td><?php echo "descripcion";?></td>
					<td><?php echo $fila_personas["fecha_bono"];?></td>
					<td><?php echo $fila_personas["monto"];?></td>
					
				</tr>

			<?php	
			}
			
			 $conexion->liberarResultado($personas);

		}	
	}
?>