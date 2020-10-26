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
          return $conexion->ejecutarInstruccion("
					INSERT INTO .usuario
					(
					Empleado_idEmpleado,
					idtipousuario,
					nombre_usuario,
					password)
					VALUES
					(
					$this->idEmpleado,
					$this->tipo,
					'$this->username',
					'$this->passwd');
					");
	}

}

?>
