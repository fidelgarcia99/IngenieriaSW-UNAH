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
		$id= null,
		$nom_departamento=null
	){
		$this->pNombre = $pNombre;
		$this->sNombre = $sNombre;
		$this->pApellido = $pApellido;
		$this->sApellido = $sApellido;
		$this->nom_ciudad = $nom_ciudad;
		$this->direccion = $direccion;
		$this->num_telefono = $num_telefono;
		$this->dir_correo = $dir_correo;
		$this->fechaRegistro = $fechaRegistro;
		$this->id = $id;
		$this->nom_departamento = $nom_departamento;
	}



	public function registraCliente($conexion){
		return $conexion->ejecutarInstruccion("
		call SPnuevo_cliente(
			'$this->pNombre', '$this->sNombre', '$this->pApellido', '$this->sApellido',
			 $this->nom_ciudad, '$this->direccion', '$this->num_telefono', '$this->email',
			 '$this->fechaRegistro', '$this->id', $this->nom_departamento);");
	}


	public function llenarCiudad($conexion){
		$ciudad = $conexion->ejecutarInstruccion("
		SELECT idCiudad, nom_ciudad from ciudad
			");

			$c = 0;
			while ($fila_ciudad = $conexion->obtenerFila($ciudad)) {
				if ($c==0) {
                         ?>
					<option selected value="<?php echo $fila_ciudad["idCiudad"];?>">
						<?php echo $fila_ciudad["nom_ciudad"];?>

					</option>

					<?php
				}
			}

			$conexion->liberarResultado($ciudad);
	}


}
?>
