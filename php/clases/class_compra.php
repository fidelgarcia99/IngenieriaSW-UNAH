<?php
class Compra{
	private $numFactura;
	private $nom_proveedor;
	private $fechaFactura;
     private $ISV;
     private $descuento;
	private $total;
	
	public function __construct(
		$numFactura = null,
		$nom_proveedor = null,
		$fechaFactura = null,
          $ISV = null,
          $descuento = null,
		$total = null
		
	){
		$this->numFactura = $numFactura;
		$this->nom_proveedor = $nom_proveedor;
		$this->fechaFactura = $fechaFactura;
          $this->ISV = $ISV;
          $this->descuento = $descuento;
		$this->total = $total;
		
	}

	public function registrarCompra($conexion){
		return $conexion->ejecutarInstruccion("call SPnuevoingresar_facturacompras('$this->numFactura', '$this->nom_proveedor', 
		                                        '$this->fechaFactura', '$this->ISV', '$this->descuento', '$this->total');");
	}

	public static function llenarFacturaCompra($conexion){
          $compra = $conexion->ejecutarInstruccion("
		select idfactura, num_factura from factura_compras
			");

			$c = 0;
			while ($fila_compra = $conexion->obtenerFila($compra)) {
				if ($c==0) {
					?>
					<option value="<?php echo $fila_compra["idfactura"];?>">
						<?php echo $fila_compra["num_Factura"];?>

					</option>

					<?php
				}
			}
			$conexion->liberarResultado($compra);
	}

	public static function llenarProducto($conexion){
          $producto = $conexion->ejecutarInstruccion("
		select idProducto, descp_gral from producto
			");

			$c = 0;
			while ($fila_producto = $conexion->obtenerFila($producto)) {
				if ($c==0) {
					?>
					<option value="<?php echo $fila_producto["idProducto"];?>">
						<?php echo $fila_producto["descp_gral"];?>

					</option>

					<?php
				}
			}
			$conexion->liberarResultado($producto);
	}

}
?>
