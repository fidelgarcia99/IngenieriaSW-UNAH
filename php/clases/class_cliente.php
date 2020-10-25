<?php
class Clientes{
	private $pNombre;
	private $sNombre;
	private $pApellido;
	private $sApellido;
	private $nom_ciudad;
	private $direccion;
	private $num_telefono;
	private $email;
	private $fechaRegistro;

	public function __construct(
		$pNombre = null,
		$sNombre = null,
		$pApellido = null,
		$sApellido = null,
		$nom_ciudad = null,
		$direccion = null,
		$num_telefono = null,
		$email = null,
		$fechaRegistro= null
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
	}



	public function registraEmpleado($conexion){
		return $conexion->ejecutarInstruccion("
          INSERT INTO  ( )
		VALUES ('$this->pNombre' ,'$this->sNombre', '$this->pApellido','$this->sApellido' ,'$this->nom_ciudad', 
		'$this->direccion','$this->num_telefono', '$this->email',  '$this->fechaRegistro')");
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