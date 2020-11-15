<?php
class producto{
	private $nombre_producto;
	private $fechaVencimiento;
	private $precioCosto;
	private $precioVenta;
	private $cantidad;
	private $cod_barra;
	private $nombre_proveedor;
	private $marca_producto;

	public function __construct(
		$nombre_producto = null,
		$fechaVencimiento = null,
		$precioCosto = null,
		$precioVenta = null,
		$cantidad = null,
		$cod_barra = null,
		$nombre_proveedor = null,
		$marca_producto = null
	){
		$this->nombre_producto = $nombre_producto;
		$this->fechaVencimiento = $fechaVencimiento;
		$this->precioCosto = $precioCosto;
		$this->precioVenta = $precioVenta;
		$this->cantidad = $cantidad;
		$this->cod_barra = $cod_barra;
		$this->nombre_proveedor = $nombre_proveedor;
		$this->marca_producto = $marca_producto;
	}

	public function __toString(){
		$var = "producto{"
		."nombre_producto: ".$this->nombre_producto." , "
		."fechaVencimiento: ".$this->fechaVencimiento." , "
		."precioCosto: ".$this->precioCosto." , "
		."precioVenta: ".$this->precioVenta." , "
		."cantidad: ".$this->cantidad." , "
		."cod_barra: ".$this->cod_barra." , "
		."nombre_proveedor: ".$this->nombre_proveedor." , "
		."marca_producto: ".$this->marca_producto;
		return $var."}";
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
	public function llenarMarca(/*Parametros*/){
	}

}
?>