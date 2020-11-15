<?php
class Producto{
	private $descripcion;
	private $barcode;
	private $costo;
	private $venta;
	private $descuento;
	private $cantidad;
	private $contenedor;
	private $categoria;
	private $proveedor;
	private $marca;

	public function __construct(
		$descripcion = null,
		$barcode = null,
		$costo = null,
		$venta = null,
		$descuento = null,
		$cantidad = null,
		$contenedor = null,
		$categoria = null,
		$proveedor = null,
		$marca = null
	){
		$this->descripcion = $descripcion;
		$this->barcode = $barcode;
		$this->costo = $costo;
		$this->venta = $venta;
		$this->descuento = $descuento;
		$this->cantidad = $cantidad;
		$this->contenedor = $contenedor;
		$this->categoria = $categoria;
		$this->proveedor = $proveedor;
		$this->marca = $marca;
	}

	public function registrarProducto($conexion){
		return $conexion->ejecutarInstruccion("
			call SPnuevo_producto(
			'$this->descripcion',
			'$this->barcode',
			$this->contenedor,
			$this->categoria,
			$this->marca,
			$this->proveedor
			);");
	}

	public function actualizarProducto($conexion,$id){
		return $conexion->ejecutarInstruccion("
			call SPactualiza_producto();");
	}

	public static function eliminarProducto($conexion, $id_registro){
		return $conexion->ejecutarInstruccion("call SPelimina_producto($id_registro)");
	}

}
?>
