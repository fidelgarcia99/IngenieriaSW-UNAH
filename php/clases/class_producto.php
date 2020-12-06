<?php
class Producto
{
	private $descripcion;
	private $barcode;
	private $costo;
	private $venta;
	private $descuento;
	private $cantidad;
	private $contenedor;
	private $categoria;
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
		$marca = null
	) {
		$this->descripcion = $descripcion;
		$this->barcode = $barcode;
		$this->costo = $costo;
		$this->venta = $venta;
		$this->descuento = $descuento;
		$this->cantidad = $cantidad;
		$this->contenedor = $contenedor;
		$this->categoria = $categoria;
		$this->marca = $marca;
	}

	public function registrarProducto($conexion)
	{
		return $conexion->ejecutarInstruccion("
			call SPnuevo_producto(
			'$this->descripcion',
			'$this->barcode',
			$this->contenedor,
			$this->categoria,
			$this->marca
			);");
	}

	public function actualizarProducto($conexion, $id)
	{
		return $conexion->ejecutarInstruccion("
			call SPactualiza_producto();");
	}

	public static function eliminarProducto($conexion, $id_registro)
	{
		return $conexion->ejecutarInstruccion("call SPelimina_producto($id_registro)");
	}

	public static function llenarProveedor($conexion)
	{
		$proveedor = $conexion->ejecutarInstruccion("
		select idProveedor,nombre_proveedor from proveedor
			");

		$c = 0;
		while ($fila_proveedor = $conexion->obtenerFila($proveedor)) {
			if ($c == 0) {
?>
				<option value="<?php echo $fila_proveedor["idProveedor"]; ?>">
					<?php echo $fila_proveedor["nombre_proveedor"]; ?>

				</option>

			<?php
			}
		}
		$conexion->liberarResultado($proveedor);
	}

	public static function llenarMarcas($conexion)
	{
		$Marcas = $conexion->ejecutarInstruccion("
		select idMarca,nombre_marca from marca
			");

		$c = 0;
		while ($fila_Marcas = $conexion->obtenerFila($Marcas)) {
			if ($c == 0) {
			?>
				<option value="<?php echo $fila_Marcas["idMarca"]; ?>">
					<?php echo $fila_Marcas["nombre_marca"]; ?>

				</option>

			<?php
			}
		}

		$conexion->liberarResultado($Marcas);
	}

	public static function llenarUbicacion($conexion)
	{
		$ubicacion = $conexion->ejecutarInstruccion('
					SELECT
					c.idContenedor as Id,
					CONCAT(c.descripcion_cont," ",tc.descripcion_tipocont) as Ubicacion
					FROM contenedor c
					INNER JOIN tipocontenedor tc
					ON c.TipoContenedor_idTipoContenedor = tc.idTipoContenedor;
					');
		$c = 0;
		while ($fila_ubicacion = $conexion->obtenerFila($ubicacion)) {
			if ($c == 0) {
			?>
				<option value="<?php echo $fila_ubicacion["Id"]; ?>">
					<?php echo $fila_ubicacion["Ubicacion"]; ?>

				</option>

			<?php
			}
		}

		$conexion->liberarResultado($ubicacion);
	}

	public static function llenarCategoria($conexion)
	{
		$result = $conexion->ejecutarInstruccion("select * from tipoproducto;");

		while ($fila_categoria = $conexion->obtenerFila($result)) {
			if ($c == 0) {
			?>
				<option value="<?php echo $fila_categoria["idTipo_Producto"]; ?>">
					<?php echo $fila_categoria["descp_tipo"]; ?>

				</option>

			<?php
			}
		}

		$conexion->liberarResultado($result);
	}

	public static function llenarProductos($conexion)
	{
		$result = $conexion->ejecutarInstruccion("select * from producto;");

		while ($fila_producto = $conexion->obtenerFila($result)) {
			if ($c == 0) {
			?>
				<option value="<?php echo $fila_producto["precioVenta"]; ?>">
					<?php echo $fila_producto["descp_gral"]; ?>

				</option>

<?php
			}
		}

		$conexion->liberarResultado($result);
	}
}
?>