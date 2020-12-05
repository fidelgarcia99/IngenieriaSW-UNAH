<?php
class Empleado{
	private $pNombre;
	private $sNombre;
	private $pApellido;
	private $sApellido;
	private $num_identidad;
	private $direccion;
	private $num_telefono;
	private $cargo;
	private $ciudad;
	private $email;
	private $fechainicio_contrato;

	public function __construct(
		$pNombre = null,
		$sNombre = null,
		$pApellido = null,
		$sApellido = null,
		$num_identidad = null,
		$direccion = null,
		$num_telefono = null,
		$ciudad = null,
		$email = null,
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
		$this->ciudad = $ciudad;
		$this->email = $email;
		$this->cargo = $cargo;
		$this->fechainicio_contrato = $fechainicio_contrato;
	}



	public function registraEmpleado($conexion){
		return $conexion->ejecutarInstruccion("
          CALL SPnuevo_empleado('$this->pNombre' ,'$this->sNombre', '$this->pApellido','$this->sApellido' , '$this->ciudad',
		'$this->direccion','$this->num_telefono', '$this->email',  '$this->fechainicio_contrato', '$this->num_identidad', '$this->cargo')");
	}

	public function actualizarEmpleado($conexion, $id){
		return $conexion->ejecutarInstruccion("
          CALL SPactualiza_empleado('$id', '$this->pNombre' ,'$this->sNombre', '$this->pApellido','$this->sApellido' ,'$this->ciudad','$this->direccion','$this->num_telefono', '$this->email',  '$this->fechainicio_contrato', '$this->num_identidad','$this->cargo')");
	}

	public function despedirEmpleado($conexion, $id){
		return $conexion->ejecutarInstruccion("CALL SPdespedir_empleado('$id')");
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
					$c=1;
				}else{
					?>
					<option value="<?php echo $fila_cargo["idCargo"];?>">
						<?php echo $fila_cargo["nombre_cargo"];?>

					</option>

					<?php
				}
			}

			$conexion->liberarResultado($cargo);
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
					$c=1;
				}
				else{
					?>
					<option value="<?php echo $fila_ciudad["idCiudad"];?>">
						<?php echo $fila_ciudad["nom_ciudad"];?>

					</option>

					<?php
				}
			}

			$conexion->liberarResultado($ciudad);
	}



	public function llenarEmpleados($conexion){
		$empleado = $conexion->ejecutarInstruccion("
		SELECT persona.pnombre, persona.papellido,e.idEmpleado FROM `persona` 
		     inner join empleado as e on persona.idPersona =e.Persona_idPersona
			");

			$c = 0;
			while ($fila_empleado = $conexion->obtenerFila($empleado)) {
				if ($c==0) {
                         ?>
					<option selected value="<?php echo $fila_empleado["idEmpleado"];?>">
						<?php echo $fila_empleado['pnombre']." ".$fila_empleado["papellido"];?>

					</option>

					<?php
					$c=1;
				}else{
					?>
					<option value="<?php echo $fila_empleado["idEmpleado"];?>">
						<?php echo $fila_empleado['pnombre']." ".$fila_empleado["papellido"];?>

					</option>

					<?php
				}
			}

			$conexion->liberarResultado($empleado);
	}


}
?>
