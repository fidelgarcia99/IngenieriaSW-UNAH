<?php
	//incluimos la clase conexion para poder crear el objeto Conexion que enviaremos como parametro
	include_once("clases/class_conexion.php");
	//se incluye la clase personas parapoder llamar sus funciones desde el index
	include_once("clases/class_personas.php");
	//objeto Conexion 
	$conexion = new Conexion();
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Conexion BD</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<table>
				<tr>
					<th>Nombre</th>
					<th>Apellido</th>
					<th>Identidad</th>
					<th>Direccion</th>
					<th>Ciudad</th>
					<th>Departamento</th>
				</tr>
				<?php
				//llamamos a la funcion "consulta" de la clase "Personas" y le mandamos como parametro el objeto "$conexion".
				//en esta seccion se va a imprimir cada fila (resultado) que devuelva la consulta
				Personas::consulta($conexion);
				?>
			</table>
		</div>
	</div>
</body>
</html>