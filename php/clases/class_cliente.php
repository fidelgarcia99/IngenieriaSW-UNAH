<?php
class Cliente{
	private $pNombre;
	private $sNombre;
	private $pApellido;
	private $sApellido;
	private $nom_ciudad;
	private $direccion;
	private $num_telefono;
	private $dir_correo;
	private $fechaRegistro;
	private $id;
	private $nom_departamento;

	public function __construct(
		$pNombre = null,
		$sNombre = null,
		$pApellido = null,
		$sApellido = null,
		$nom_ciudad = null,
		$direccion = null,
		$num_telefono = null,
		$email = null,
		$fechaRegistro= null,
		$id= null
	){
		$this->pNombre = $pNombre;
		$this->sNombre = $sNombre;
		$this->pApellido = $pApellido;
		$this->sApellido = $sApellido;
		$this->nom_ciudad = $nom_ciudad;
		$this->direccion = $direccion;
		$this->num_telefono = $num_telefono;
		$this->email = $email;
		$this->fechaRegistro = $fechaRegistro;
		$this->id = $id;
	}


	



	public function registrarCliente($conexion){
		return $conexion->ejecutarInstruccion("
			call SPnuevo_cliente('$this->pNombre', '$this->sNombre', '$this->pApellido', '$this->sApellido',
			 $this->nom_ciudad, '$this->direccion', '$this->num_telefono', '$this->email', '$this->fechaRegistro', '$this->id');");
	}

	public function actualizarCliente($conexion,$id){
		return $conexion->ejecutarInstruccion("
			call SPactualiza_cliente($id,'$this->pNombre', '$this->sNombre', '$this->pApellido', '$this->sApellido',
			 $this->nom_ciudad, '$this->direccion', '$this->num_telefono', '$this->email', '$this->id');");
	}

	public static function eliminarCliente($conexion, $id_registro){
		return $conexion->ejecutarInstruccion("call SPelimina_cliente($id_registro)");
	}



	public function llenarCiudad($conexion){
		$ciudad = $conexion->ejecutarInstruccion("
		SELECT idCiudad, nom_ciudad from ciudad
			");

			$c = 0;
			echo '<option value="-1" selected disable>--- Selecciones una ciudad ---</option>';
			while ($fila_ciudad = $conexion->obtenerFila($ciudad)) {
				if ($c==0) {
                         ?>
					<option value="<?php echo $fila_ciudad["idCiudad"];?>">
						<?php echo $fila_ciudad["nom_ciudad"];?>

					</option>

					<?php
				}
			}

			$conexion->liberarResultado($ciudad);
	}

	public static function llenarCliente($conexion){
          $cliente = $conexion->ejecutarInstruccion('
		select  p.pnombre, p.snombre,p.papellido,p.sapellido, p.num_identidad, c.idCliente
		from persona p
	    inner join cliente c  on p.idPersona=c.Persona_idPersona
					');
					
			$c = 0;
			   

			
			while ($fila_cliente = $conexion->obtenerFila($cliente)) {
				if ($c==0) {
					?>
					<option value="<?php echo $fila_cliente["idCliente"];?>">
						<?php echo $fila_cliente['pnombre'];?>
						<?php echo $fila_cliente["snombre"];?>
						<?php echo $fila_cliente["papellido"];?>
						<?php echo $fila_cliente["sapellido"];?>
						-
						<?php echo $fila_cliente["num_identidad"];?>
					</option>

				
					<?php
				}
			};

			
			$conexion->liberarResultado($cliente);
			
	}

	

	

}
?>
