<?php
class Usuario{
	private $username;
	private $email;
	private $passwd;
	private $idEmpleado;

	public function __construct(
		$username = null,
		$passwd = null,
		$idEmpleado = null
	){
		$this->username = $username;
		$this->passwd = $passwd;
		$this->idEmpleado = $idEmpleado;
	}

	public function registraUsuario($conexion){
          return $conexion->ejecutarInstruccion("
          INSERT INTO usuario ( idEmpleado, nombre_usuario, password)
          VALUES ('$this->idEmpleado' ,'$this->username', '$this->passwd')");
	}

}

?>