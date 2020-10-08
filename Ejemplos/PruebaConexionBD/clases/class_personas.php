<?php
	class Personas{//se crea la clase persona
		public static function consulta($conexion){//funcion que se llamara desde el index.html (o cualquier parte)
			//se crea una variable ($personas) a la cuql se le asigna la conexion que a su vez llama a su funcion "ejecutarInstruccion" y esta recibe como paramentro la consulta SQL
			$personas = $conexion->ejecutarInstruccion('
				SELECT  pnombre, 
						papellido, 	
						num_identidad,
						direccion,
						nom_ciudad,
						nom_departamento
				FROM persona as A
				INNER JOIN ciudad as B
				ON(A.Ciudad_idCiudad=B.idCiudad)
				INNER JOIN departamento as C
				ON(C.idDepartamento=B.Departamento_idDepartamento)
			');
			//mediante el siguiente "while" cada registro que devuelva la consulta se mostrara
			//se crea una variable ($fila_personas) ala que se le asignara la conexion que a su vez llama a su funcion "obtenerFila" y esta recibe como parametrp la variable "$personas" anteriormente creada
			while ($fila_personas = $conexion->obtenerFila($personas)) {
			?>  
				<tr>
					<td><?php echo $fila_personas["pnombre"];?></td>
					<td><?php echo $fila_personas["papellido"];?></td>
					<td><?php echo $fila_personas["num_identidad"];?></td>
					<td><?php echo $fila_personas["direccion"];?></td>
					<td><?php echo $fila_personas["nom_ciudad"];?></td>
					<td><?php echo $fila_personas["nom_departamento"];?></td>
				</tr>

			<?php	
			}
			//libera el espacio en memoria asociado con la consulta
			 $conexion->liberarResultado($personas);
		}	
	}
?>