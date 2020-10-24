<?php
class Empleados{
	private $pNombre;
	private $sNombre;
	private $pApellido;
	private $sApellido;
	private $num_identidad;
	private $direccion;
	private $num_telefono;
	private $cargo;
	private $fechainicio_contrato;

	public function __construct(
		$pNombre = null,
		$sNombre = null,
		$pApellido = null,
		$sApellido = null,
		$num_identidad = null,
		$direccion = null,
		$num_telefono = null,
		$cargo = null,
		$fechainicio_contrato= null
	){
		$this->pNombre = $pNombre;
		$this->sNombre = $sNombre;
		$this->pApellido = $pApellido;
		$this->sApellido = $sApellido;
		$this->num_identidad = $num_identidad;
		$this->direccion = $direccion;
		$this->num_telefono = $num_telefono;
		$this->cargo = $cargo;
		$this->fechainicio_contrato = $fechainicio_contrato;
	}



	public function registraEmpleado($conexion){
		return $conexion->ejecutarInstruccion("
          INSERT INTO usuario ( idEmpleado, nombre_usuario, password)
		VALUES ('$this->pNombre' ,'$this->sNombre', '$this->pApellido','$this->sApellido' ,'$this->num_identidad', 
		'$this->direccion','$this->num_telefono', '$this->cargo',  '$this->fechainicio_contrato')");
	}


	public function llenarCargos($conexion){
		$cargo = $conexion->ejecutarInstruccion("
		select idCargo,nombre_cargo from cargo
			");

			$c = 0;
			while ($fila_cargo = $conexion->obtenerFila($cargo)) {
				if ($c==0) {
					?>
					<option selected value="<?php echo $fila_cargo["idCargo"];?>">
						<?php echo $fila_cargo["nombre_cargo"];?>
						
					</option>

					<?php
				}
			}
			
			$conexion->liberarResultado($cargo);
	}


}
?>