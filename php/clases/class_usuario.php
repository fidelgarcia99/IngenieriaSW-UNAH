<?php
class Usuario{
	private $username;
	private $tipo;
	private $passwd;
	private $idEmpleado;

	public function __construct(
		$username = null,
		$passwd = null,
		$idEmpleado = null,
		$tipo = null
	){
		$this->username = $username;
		$this->passwd = $passwd;
		$this->idEmpleado = $idEmpleado;
		$this->tipo = $tipo;
	}

	public function registraUsuario($conexion){
		  return $conexion->ejecutarInstruccion("CALL SPnuevo_usuario($this->idEmpleado , $this->tipo,
		  '$this->username', '$this->passwd');");
	}

	public function actualizarUsuario($conexion,$id){
			return $conexion->ejecutarInstruccion("CALL SPactualiza_usuario($id , $this->idEmpleado , $this->tipo,
			'$this->username', '$this->passwd');");
	}

}

?>
