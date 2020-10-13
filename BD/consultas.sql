/*Para mostrar inventario actual junto con ubicacion*/
SELECT 
    p.idProducto,
    p.nombre_producto,
    p.fechaElaboracion,
    p.fechaVencimiento,
    p.precioCosto,
    p.precioVenta,
    p.precioOferta,
    p.cantidad,
    p.Contenedor_idContenedor,
    proveedor.nombre_proveedor,
    proveedor.telefono_proveedor,
    contenedor.descripcion_cont,
    pasillo.descripcion_pasillo,
    area.nombre_area
FROM
    producto AS p
        INNER JOIN
    producto_x_proveedor ON p.idProducto = producto_x_proveedor.Producto_idProducto
        INNER JOIN
    proveedor ON producto_x_proveedor.Proveedor_idProveedor = proveedor.idProveedor
		INNER JOIN
	contenedor ON p.Contenedor_idContenedor = contenedor.idContenedor
		INNER JOIN
	pasillo_x_contenedor ON contenedor.idContenedor = pasillo_x_contenedor.Contenedor_idContenedor
		INNER JOIN
	pasillo ON pasillo_x_contenedor.Pasillo_idPasillo = pasillo.idPasillo
		INNER JOIN
	area ON pasillo.Area_idArea = area.idArea
WHERE
    p.cantidad > 0;


/*Para mostrar la planilla*/