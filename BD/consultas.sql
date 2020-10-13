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
    prov.nombre_proveedor,
    prov.telefono_proveedor,
    cont.descripcion_cont,
    pas.descripcion_pasillo,
    a.nombre_area
FROM
    producto AS p
        INNER JOIN
    producto_x_proveedor pxp ON p.idProducto = pxp.Producto_idProducto
        INNER JOIN
    proveedor prov ON pxp.Proveedor_idProveedor = prov.idProveedor
		INNER JOIN
	contenedor cont ON p.Contenedor_idContenedor = cont.idContenedor
		INNER JOIN
	pasillo_x_contenedor pxc ON cont.idContenedor = pxc.Contenedor_idContenedor
		INNER JOIN
	pasillo pas ON pxc.Pasillo_idPasillo = pas.idPasillo
		INNER JOIN
	area a ON pas.Area_idArea = a.idArea
WHERE
    p.cantidad > 0;


/*Para mostrar la planilla*/
SELECT 
    e.idEmpleado,
    u.nombre_usuario,
    p.pnombre,
    p.snombre,
    p.papellido,
    p.sapellido,
    p.num_identidad,
    t.num_telefono,
    cor.dir_correo,
    cxe.fecha_nombramiento,
    c.nombre_cargo,
    e.sueldo_emp,
    b.monto,
    b.descripcion,
    b.fecha_bono,
    d.fechainicio,
    d.valor,
    a.monto_anticipo,
    a.fecha_anticipo,
    a.estado_anticipo,
    j.horainicio_jor,
    j.horafin_jor
FROM
    empleado AS e
        INNER JOIN
    persona p ON e.Persona_idPersona = p.idPersona
        INNER JOIN
    telefono t ON p.idPersona = t.Persona_idPersona
        INNER JOIN
    correo cor ON p.idPersona = cor.Persona_idPersona
        INNER JOIN
    cargo_x_empleado cxe ON e.idEmpleado = cxe.Empleado_idEmpleado
        INNER JOIN
    cargo c ON cxe.Cargo_idCargo = c.idCargo
        INNER JOIN
    empleado_x_planilla exp ON e.idEmpleado = exp.Empleado_idEmpleado
        INNER JOIN
    planilla pla ON exp.Planilla_idPlanilla = pla.idPlanilla
        INNER JOIN
    empleado_x_bono exb ON e.idEmpleado = exb.Empleado_idEmpleado
        INNER JOIN
    bono b ON exb.Bono_idBono = b.idBono
        INNER JOIN
    empleado_x_deduccion exd ON e.idEmpleado = exd.Empleado_idEmpleado
        INNER JOIN
    deduccion d ON exd.Deduccion_idDeduccion = d.idDeduccion
        INNER JOIN
    anticipos a ON e.idEmpleado = a.Empleado_idEmpleado
        INNER JOIN
    jornada j ON e.idEmpleado = j.Empleado_idEmpleado
        INNER JOIN
    usuario u ON e.Usuario_idUsuario = u.idUsuario
WHERE
    pla.fechafin > CURDATE()