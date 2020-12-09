<?php
class Compra{
	private $numFactura;
	private $nom_proveedor;
	private $fechaFactura;
     private $ISV;
     private $descuento;
	private $total;
	private $precio;
	private $cantidad;
	private $producto;
	
	public function __construct(
		$numFactura = null,
		$nom_proveedor = null,
		$fechaFactura = null,
          $ISV = null,
          $descuento = null,
		$total = null,
		$precio = null,
		$cantidad = null,
		$producto = null
		
	){
		$this->numFactura = $numFactura;
		$this->nom_proveedor = $nom_proveedor;
		$this->fechaFactura = $fechaFactura;
          $this->ISV = $ISV;
          $this->descuento = $descuento;
		$this->total = $total;
		$this->precio = $precio;
		$this->cantidad = $cantidad;
		$this->producto = $producto;
		
	}

	public function registrarCompra($conexion){
		return $conexion->ejecutarInstruccion("call SPnuevoingresar_facturacompras('$this->nom_proveedor', $this->total, 
		                                        $this->ISV, $this->descuento, '$this->numFactura', '$this->fechaFactura');");
	}

	public function registrarCompraDetalle($conexion){
		return $conexion->ejecutarInstruccion("call SPnuevo_detalle_compra('$this->producto','$this->numFactura',  
		                                        '$this->cantidad', $this->precio, $this->ISV, $this->descuento, $this->total);");
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
						<?php echo $fila_compra["num_factura"];?>

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
