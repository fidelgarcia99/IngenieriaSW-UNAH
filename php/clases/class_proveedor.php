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
    return $conexion->ejecutarInstruccion("
    										INSERT INTO proveedor( 
    										idProveedor,
    										nombre_proveedor, 
    										direccion_proveedor, 
    										telefono_proveedor, 
    										correo_proveedor, 
    										Persona_idPersona
    										)
    										VALUES (
    										NULL, 
    										'$this->nombre',
    										'$this->direccion', 
    										'$this->telefono', 
    										'$this->correo', 
    										NULL
    										)
    									");
	}

}
?>
