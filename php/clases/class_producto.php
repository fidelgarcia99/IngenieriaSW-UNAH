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

	public function llenarProveedor($conexion){
          $proveedor = $conexion->ejecutarInstruccion("
		select idProveedor,nombre_proveedor from proveedor
			");

			$c = 0;
			while ($fila_proveedor = $conexion->obtenerFila($proveedor)) {
				if ($c==0) {
					?>
					<option selected value="<?php echo $fila_proveedor["idProveedor"];?>">
						<?php echo $fila_proveedor["nombre_proveedor"];?>

					</option>

					<?php
				}
			}

			$conexion->liberarResultado($proveedor);
	}


	public function llenarMarcas($conexion){
          $Marcas = $conexion->ejecutarInstruccion("
		select idMarca,nombre_marca from marca
			");

			$c = 0;
			while ($fila_Marcas = $conexion->obtenerFila($Marcas)) {
				if ($c==0) {
					?>
					<option selected value="<?php echo $fila_Marcas["idMarca"];?>">
						<?php echo $fila_Marcas["nombre_marca"];?>

					</option>

					<?php
				}
			}

			$conexion->liberarResultado($Marcas);
	}

	public function llenarSucursal($conexion){
          $Sucursal = $conexion->ejecutarInstruccion("
		select idSucursal,nombre_sucursal from Sucursal
			");

			$c = 0;
			while ($fila_Sucursal = $conexion->obtenerFila($Sucursal)) {
				if ($c==0) {
					?>
					<option selected value="<?php echo $fila_Sucursal["idSucursal"];?>">
						<?php echo $fila_Sucursal["nombre_sucursal"];?>

					</option>

					<?php
				}
			}

			$conexion->liberarResultado($Sucursal);
	}

}
?>
