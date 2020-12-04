<?php
class Proveedor{
	private $nombre;
	private $direccion;
	private $telefono;
	private $correo;

	public function __construct(
		$nombre = null,
		$direccion = null,
		$telefono = null,
		$correo = null
	){
		$this->nombre = $nombre;
		$this->direccion = $direccion;
		$this->telefono = $telefono;
		$this->correo = $correo;
	}

	public function registroProveedor($conexion){
	return $conexion->ejecutarInstruccion("CALL SPnuevo_proveedor('$this->nombre','$this->direccion',
	'$this->telefono','$this->correo', NULL);");
	}

	public static function eliminarProveedor($conexion, $id_registro){
		return $conexion->ejecutarInstruccion("call SPelimina_proveedor($id_registro)");
	}
}
?>
