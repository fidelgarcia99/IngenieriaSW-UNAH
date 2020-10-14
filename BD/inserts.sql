/*Tabla Usuario*/
insert into Usuario (idUsuario, nombre_usuario, password) values (1, 'admin123', 'UmxrCcUp');
insert into Usuario (idUsuario, nombre_usuario, password) values (2, 'sdancy1', 'HppfRWpNc');
insert into Usuario (idUsuario, nombre_usuario, password) values (3, 'jthyer2', 'DUNgRKpB8W2');
insert into Usuario (idUsuario, nombre_usuario, password) values (4, 'hinkin3', '9NLzLEC');
insert into Usuario (idUsuario, nombre_usuario, password) values (5, 'trutgers4', 'qzUQHpa6PmJ');
insert into Usuario (idUsuario, nombre_usuario, password) values (6, 'vlillie5', 'xrTZAC');
insert into Usuario (idUsuario, nombre_usuario, password) values (7, 'psemered6', '3ATjnN');
insert into Usuario (idUsuario, nombre_usuario, password) values (8, 'cjuschka7', 'jNj8Fy');
insert into Usuario (idUsuario, nombre_usuario, password) values (9, 'rmawditt8', 'sXqlNGn3PYCC');
insert into Usuario (idUsuario, nombre_usuario, password) values (10, 'bcanwell9', 'XGEtzl0tg');

/*Tabla Pais*/
insert into Pais (idPais, nom_pais) values (1, 'Honduras');
insert into Pais (idPais, nom_pais) values (2, 'Guatemala');
insert into Pais (idPais, nom_pais) values (3, 'Costa Rica');
insert into Pais (idPais, nom_pais) values (4, 'El Salvador');
insert into Pais (idPais, nom_pais) values (5, 'China');
insert into Pais (idPais, nom_pais) values (6, 'Haiti');
insert into Pais (idPais, nom_pais) values (7, 'Brasil');
insert into Pais (idPais, nom_pais) values (8, 'Francia');
insert into Pais (idPais, nom_pais) values (9, 'Argentina');
insert into Pais (idPais, nom_pais) values (10, 'Belice');
 
 /*Tabla Departamento*/
insert into Departamento (idDepartamento, nom_departamento, Pais_idPais) values (1, 'Choluteca', '1');
insert into Departamento (idDepartamento, nom_departamento, Pais_idPais) values (2, 'Francisco Morazan', '1');
insert into Departamento (idDepartamento, nom_departamento, Pais_idPais) values (3, 'Atlantida', '1');
insert into Departamento (idDepartamento, nom_departamento, Pais_idPais) values (4, 'Comayagua', '1');
insert into Departamento (idDepartamento, nom_departamento, Pais_idPais) values (5, 'Copan', '1');
insert into Departamento (idDepartamento, nom_departamento, Pais_idPais) values (6, 'Cortes', '1');
insert into Departamento (idDepartamento, nom_departamento, Pais_idPais) values (7, 'Ocotepeque', '1');
insert into Departamento (idDepartamento, nom_departamento, Pais_idPais) values (8, 'Yoro', '1');
insert into Departamento (idDepartamento, nom_departamento, Pais_idPais) values (9, 'Olancho', '1');
insert into Departamento (idDepartamento, nom_departamento, Pais_idPais) values (10, 'Valle', '1');

/*Tabla Ciudad*/
insert into Ciudad (idCiudad, nom_ciudad, Departamento_idDepartamento) values (1, 'Choluteca', '1');
insert into Ciudad (idCiudad, nom_ciudad, Departamento_idDepartamento) values (2, 'Tegucigalpa', '2');
insert into Ciudad (idCiudad, nom_ciudad, Departamento_idDepartamento) values (3, 'La Ceiba', '3');
insert into Ciudad (idCiudad, nom_ciudad, Departamento_idDepartamento) values (4, 'Comayagua', '4');
insert into Ciudad (idCiudad, nom_ciudad, Departamento_idDepartamento) values (5, 'Santa Rosa de Copan', '5');
insert into Ciudad (idCiudad, nom_ciudad, Departamento_idDepartamento) values (6, 'Catacamas', '9');
insert into Ciudad (idCiudad, nom_ciudad, Departamento_idDepartamento) values (7, 'San Marcos de Colon', '1');
insert into Ciudad (idCiudad, nom_ciudad, Departamento_idDepartamento) values (8, 'Ojojona', '2');
insert into Ciudad (idCiudad, nom_ciudad, Departamento_idDepartamento) values (9, 'Tela', '3');
insert into Ciudad (idCiudad, nom_ciudad, Departamento_idDepartamento) values (10, 'San Lorenzo', '10');

/*Tabla Persona*/
insert into Persona (idPersona, Ciudad_idCiudad, Ciudad_Departamento_idDepartamento, pnombre, snombre, papellido, sapellido, num_identidad, direccion) values (1, '1', '1', 'Leroy', 'Jsandye', 'Grahamslaw', 'Sorensen', '74-294-2589', '3280 Delladonna Street');
insert into Persona (idPersona, Ciudad_idCiudad, Ciudad_Departamento_idDepartamento, pnombre, snombre, papellido, sapellido, num_identidad, direccion) values (2, '1', '1', 'Porty', 'Yule', 'Seers', 'Lettice', '12-507-7784', '0 Colorado Terrace');
insert into Persona (idPersona, Ciudad_idCiudad, Ciudad_Departamento_idDepartamento, pnombre, snombre, papellido, sapellido, num_identidad, direccion) values (3, '2', '2', 'Mirella', 'Ches', 'Schoroder', 'O''Keevan', '72-675-6239', '543 Clemons Court');
insert into Persona (idPersona, Ciudad_idCiudad, Ciudad_Departamento_idDepartamento, pnombre, snombre, papellido, sapellido, num_identidad, direccion) values (4, '3', '3', 'Packston', 'Kissiah', 'Licciardiello', 'Iddens', '83-842-4194', '05 Hanover Court');
insert into Persona (idPersona, Ciudad_idCiudad, Ciudad_Departamento_idDepartamento, pnombre, snombre, papellido, sapellido, num_identidad, direccion) values (5, '7', '1', 'Godfree', 'Mano', 'O''Donegan', 'Ingley', '68-049-4030', '062 Beilfuss Point');
insert into Persona (idPersona, Ciudad_idCiudad, Ciudad_Departamento_idDepartamento, pnombre, snombre, papellido, sapellido, num_identidad, direccion) values (6, '7', '1', 'Onfre', 'Toni', 'Gaitley', 'Feehan', '34-686-3082', '16 Sundown Park');
insert into Persona (idPersona, Ciudad_idCiudad, Ciudad_Departamento_idDepartamento, pnombre, snombre, papellido, sapellido, num_identidad, direccion) values (7, '8', '2', 'Joell', 'Danella', 'Stallion', 'Oglethorpe', '34-553-4668', '7787 Everett Parkway');
insert into Persona (idPersona, Ciudad_idCiudad, Ciudad_Departamento_idDepartamento, pnombre, snombre, papellido, sapellido, num_identidad, direccion) values (8, '4', '4', 'Codi', 'Clara', 'Wylder', 'Provest', '34-873-2486', '96778 Hanover Terrace');
insert into Persona (idPersona, Ciudad_idCiudad, Ciudad_Departamento_idDepartamento, pnombre, snombre, papellido, sapellido, num_identidad, direccion) values (9, '1', '1', 'Dale', 'Johnathan', 'Ciardo', 'Narramor', '69-945-7802', '575 Morrow Junction');
insert into Persona (idPersona, Ciudad_idCiudad, Ciudad_Departamento_idDepartamento, pnombre, snombre, papellido, sapellido, num_identidad, direccion) values (10, '10', '10', 'Hy', 'Grove', 'Ezzell', 'Paten', '75-703-4237', '9378 Vernon Street');


/*Tabla Correo*/
insert into Correo (idCorreo, dir_correo, Persona_idPersona) values (1, 'csimkiss0@fda.gov', 1);
insert into Correo (idCorreo, dir_correo, Persona_idPersona) values (2, 'kcotilard1@desdev.cn', 2);
insert into Correo (idCorreo, dir_correo, Persona_idPersona) values (3, 'gwhodcoat2@google.cn', 3);
insert into Correo (idCorreo, dir_correo, Persona_idPersona) values (4, 'tcray3@gnu.org', 4);
insert into Correo (idCorreo, dir_correo, Persona_idPersona) values (5, 'nrides4@kickstarter.com', 5);
insert into Correo (idCorreo, dir_correo, Persona_idPersona) values (6, 'vdashkov5@goo.gl', 6);
insert into Correo (idCorreo, dir_correo, Persona_idPersona) values (7, 'gpilley6@blogger.com', 7);
insert into Correo (idCorreo, dir_correo, Persona_idPersona) values (8, 'ssember7@usda.gov', 8);
insert into Correo (idCorreo, dir_correo, Persona_idPersona) values (9, 'ayair8@addtoany.com', 9);
insert into Correo (idCorreo, dir_correo, Persona_idPersona) values (10, 'sraggles9@symantec.com', 10);

/*Tabla Telefono*/
insert into Telefono (idTelefono, Persona_idPersona, num_telefono) values (1, 1, '58766993');
insert into Telefono (idTelefono, Persona_idPersona, num_telefono) values (2, 2, '95847958');
insert into Telefono (idTelefono, Persona_idPersona, num_telefono) values (3, 3, '13816051');
insert into Telefono (idTelefono, Persona_idPersona, num_telefono) values (4, 4, '10530723');
insert into Telefono (idTelefono, Persona_idPersona, num_telefono) values (5, 5, '63163170');
insert into Telefono (idTelefono, Persona_idPersona, num_telefono) values (6, 6, '35241413');
insert into Telefono (idTelefono, Persona_idPersona, num_telefono) values (7, 7, '23844060');
insert into Telefono (idTelefono, Persona_idPersona, num_telefono) values (8, 8, '66369705');
insert into Telefono (idTelefono, Persona_idPersona, num_telefono) values (9, 9, '89933877');
insert into Telefono (idTelefono, Persona_idPersona, num_telefono) values (10, 10, '37482756');

/*Tabla Compañia*/
insert into Compania (idCompania, Telefono_idTelefono, Telefono_Persona_idPersona, nombre_compania) values (1, 1, 1, 'Kling-Kuhlman');
insert into Compania (idCompania, Telefono_idTelefono, Telefono_Persona_idPersona, nombre_compania) values (2, 2, 2, 'Rowe-Heathcote');
insert into Compania (idCompania, Telefono_idTelefono, Telefono_Persona_idPersona, nombre_compania) values (1, 3, 3, 'Kling-Kuhlman');
insert into Compania (idCompania, Telefono_idTelefono, Telefono_Persona_idPersona, nombre_compania) values (1, 4, 4, 'Kling-Kuhlman');
insert into Compania (idCompania, Telefono_idTelefono, Telefono_Persona_idPersona, nombre_compania) values (2, 5, 5, 'Rowe-Heathcote');
insert into Compania (idCompania, Telefono_idTelefono, Telefono_Persona_idPersona, nombre_compania) values (1, 6, 6, 'Kling-Kuhlman');
insert into Compania (idCompania, Telefono_idTelefono, Telefono_Persona_idPersona, nombre_compania) values (2, 7, 7, 'Rowe-Heathcote');
insert into Compania (idCompania, Telefono_idTelefono, Telefono_Persona_idPersona, nombre_compania) values (1, 8, 8, 'Kling-Kuhlman');
insert into Compania (idCompania, Telefono_idTelefono, Telefono_Persona_idPersona, nombre_compania) values (2, 9, 9, 'Rowe-Heathcote');
insert into Compania (idCompania, Telefono_idTelefono, Telefono_Persona_idPersona, nombre_compania) values (2, 10, 10, 'Rowe-Heathcote');



/*Tabla Empleado*/
insert into Empleado (idEmpleado, Persona_idPersona, Usuario_idUsuario, sueldo_emp) values (1, 1, 1, '8808.11');
insert into Empleado (idEmpleado, Persona_idPersona, Usuario_idUsuario, sueldo_emp) values (2, 2, 2, '10824.54');
insert into Empleado (idEmpleado, Persona_idPersona, Usuario_idUsuario, sueldo_emp) values (3, 3, 3, '14490.49');
insert into Empleado (idEmpleado, Persona_idPersona, Usuario_idUsuario, sueldo_emp) values (4, 4, 4, '11409.77');
insert into Empleado (idEmpleado, Persona_idPersona, Usuario_idUsuario, sueldo_emp) values (5, 5, 5, '15722.92');

/*Tabla Cliente*/
insert into Cliente (idCliente, Persona_idPersona, fechaRegistro) values (1, 6, '2019-12-19');
insert into Cliente (idCliente, Persona_idPersona, fechaRegistro) values (2, 7, '2019-11-04');
insert into Cliente (idCliente, Persona_idPersona, fechaRegistro) values (3, 8, '2019-11-21');
insert into Cliente (idCliente, Persona_idPersona, fechaRegistro) values (4, 9, '2020-04-10');
insert into Cliente (idCliente, Persona_idPersona, fechaRegistro) values (5, 10, '2020-07-09');

/*Tabla FormaPago*/
insert into FormaPago (idFormaPago, descripcion_formapago) values (1, 'Efectivo');
insert into FormaPago (idFormaPago, descripcion_formapago) values (2, 'Tarjeta de Credito');
insert into FormaPago (idFormaPago, descripcion_formapago) values (3, 'Tarjeta de Debito');
insert into FormaPago (idFormaPago, descripcion_formapago) values (4, 'Cheque');
insert into FormaPago (idFormaPago, descripcion_formapago) values (5, 'TENGO');
insert into FormaPago (idFormaPago, descripcion_formapago) values (6, 'Tigo Money');

/*Tabla Tipo Contenedor*/
insert into TipoContenedor (idTipoContenedor, descripcion_tipocont) values (1, 'Estante');
insert into TipoContenedor (idTipoContenedor, descripcion_tipocont) values (2, 'Caja');
insert into TipoContenedor (idTipoContenedor, descripcion_tipocont) values (3, 'Baul');
insert into TipoContenedor (idTipoContenedor, descripcion_tipocont) values (4, 'Division');
insert into TipoContenedor (idTipoContenedor, descripcion_tipocont) values (5, 'Otro');

/*Tabla Proveedor*/
insert into Proveedor (idProveedor, nombre_proveedor, direccion_proveedor, telefono_proveedor, correo_proveedor, Persona_idPersona) values (1, 'Grady-Jakubowski', '8 Colorado Parkway', '1454151491', 'gbenard0@linkedin.com', null);
insert into Proveedor (idProveedor, nombre_proveedor, direccion_proveedor, telefono_proveedor, correo_proveedor, Persona_idPersona) values (2, 'Leuschke-Bogisich', '34 Spohn Point', '7746286784', 'lcornely1@wikimedia.org', null);
insert into Proveedor (idProveedor, nombre_proveedor, direccion_proveedor, telefono_proveedor, correo_proveedor, Persona_idPersona) values (3, 'Christiansen LLC', '60350 Longview Street', '9233698602', 'jjanda2@mac.com', null);
insert into Proveedor (idProveedor, nombre_proveedor, direccion_proveedor, telefono_proveedor, correo_proveedor, Persona_idPersona) values (4, 'Cartwright, Dickens and Lubowitz', '385 Lakewood Gardens Point', '3954162347', 'tpethybridge3@t.co', 4);
insert into Proveedor (idProveedor, nombre_proveedor, direccion_proveedor, telefono_proveedor, correo_proveedor, Persona_idPersona) values (5, 'Yost-Muller', '471 Lakewood Park', '5648200043', 'jhuller4@toplist.cz', null);
insert into Proveedor (idProveedor, nombre_proveedor, direccion_proveedor, telefono_proveedor, correo_proveedor, Persona_idPersona) values (6, 'Blick and Sons', '285 Express Parkway', '9846661087', 'mbiggadyke5@discuz.net', null);
insert into Proveedor (idProveedor, nombre_proveedor, direccion_proveedor, telefono_proveedor, correo_proveedor, Persona_idPersona) values (7, 'Kerluke, Roob and Hintz', '32 Bonner Court', '9887942437', 'ibrunning6@edublogs.org', null);
insert into Proveedor (idProveedor, nombre_proveedor, direccion_proveedor, telefono_proveedor, correo_proveedor, Persona_idPersona) values (8, 'Sporer-Dickens', '510 Elmside Trail', '6047043878', 'alarrosa7@chron.com', null);
insert into Proveedor (idProveedor, nombre_proveedor, direccion_proveedor, telefono_proveedor, correo_proveedor, Persona_idPersona) values (9, 'Russel, Fritsch and Kunze', '95495 Green Park', '8284641164', 'tfoort8@hubpages.com', null);
insert into Proveedor (idProveedor, nombre_proveedor, direccion_proveedor, telefono_proveedor, correo_proveedor, Persona_idPersona) values (10, 'Bins-Prohaska', '9774 Waxwing Trail', '9584337825', 'bmallon9@mit.edu', null);

/*TablaTipoDeduccion*/
insert into TipoDeduccion (idTipoDeduccion, descripcion, monto) values (1, 'Pago de materiales perjudicados', '1686.61');
insert into TipoDeduccion (idTipoDeduccion, descripcion, monto) values (2, 'Compra de objetos en la tienda', '2530.68');
insert into TipoDeduccion (idTipoDeduccion, descripcion, monto) values (3, 'Pago de materiales perjudicados', '2614.90');

/*Tabla Bono*/
insert into Bono (idBono, descripcion, fecha_bono, monto) values (1, 'Comisiones', '2019-12-10', '2356.34');
insert into Bono (idBono, descripcion, fecha_bono, monto) values (2, 'Aguinaldo', '2019-10-18', '5125.74');
insert into Bono (idBono, descripcion, fecha_bono, monto) values (3, 'Catorceavo', '2020-02-18', '5802.12');

/*Tabla Planilla*/
insert into Planilla (idPlanilla, fechaefectiva, fechainicio, fechafin) values (1, '2020-01-08', '2019-12-09', '2020-01-09');
insert into Planilla (idPlanilla, fechaefectiva, fechainicio, fechafin) values (2, '2020-02-08', '2020-01-09', '2020-02-09');
insert into Planilla (idPlanilla, fechaefectiva, fechainicio, fechafin) values (3, '2020-03-08', '2020-02-10', '2020-03-09');
insert into Planilla (idPlanilla, fechaefectiva, fechainicio, fechafin) values (4, '2020-04-08', '2020-03-03', '2020-04-09');
insert into Planilla (idPlanilla, fechaefectiva, fechainicio, fechafin) values (5, '2020-05-08', '2020-04-08', '2020-05-09');
insert into Planilla (idPlanilla, fechaefectiva, fechainicio, fechafin) values (6, '2019-06-08', '2020-05-05', '2020-06-09');
insert into Planilla (idPlanilla, fechaefectiva, fechainicio, fechafin) values (7, '2020-07-08', '2020-06-01', '2020-07-09');
insert into Planilla (idPlanilla, fechaefectiva, fechainicio, fechafin) values (8, '2019-08-08', '2020-07-09', '2020-08-09');
insert into Planilla (idPlanilla, fechaefectiva, fechainicio, fechafin) values (9, '2019-09-08', '2020-08-03', '2020-09-09');
insert into Planilla (idPlanilla, fechaefectiva, fechainicio, fechafin) values (10, '2020-10-08', '2020-09-09', '2020-10-09');

/*Tabla Cargo*/
insert into Cargo (idCargo, descripcion_cargo, nombre_cargo, sueldo_base) values (1, 'Administrador de los procesos gerenciales', 'Gerente', '12455.63');
insert into Cargo (idCargo, descripcion_cargo, nombre_cargo, sueldo_base) values (2, 'Encargado de la caja', 'Cajero', '8120.94');
insert into Cargo (idCargo, descripcion_cargo, nombre_cargo, sueldo_base) values (3, 'Encargado de la caja', 'Cajero', '8382.32');
insert into Cargo (idCargo, descripcion_cargo, nombre_cargo, sueldo_base) values (4, 'Encargado de lavar autos', 'Lavador de autos', '8579.51');
insert into Cargo (idCargo, descripcion_cargo, nombre_cargo, sueldo_base) values (5, 'Encargado de lavar autos', 'Lavador de autos', '9596.80');
insert into Cargo (idCargo, descripcion_cargo, nombre_cargo, sueldo_base) values (6, 'Especialista en mecanica basica', 'Mecanico automotriz', '8932.60');
insert into Cargo (idCargo, descripcion_cargo, nombre_cargo, sueldo_base) values (7, 'Especialista en circuitos electricos', 'Electrico automotriz', '9593.45');
insert into Cargo (idCargo, descripcion_cargo, nombre_cargo, sueldo_base) values (8, 'Especialista en mecanica basica', 'Mecanico automotriz', '9336.16');
insert into Cargo (idCargo, descripcion_cargo, nombre_cargo, sueldo_base) values (9, 'Encargado de lavar autos', 'Lavador de autos', '8822.66');
insert into Cargo (idCargo, descripcion_cargo, nombre_cargo, sueldo_base) values (10, 'Especialista en circuitos electricos', 'Electrico automotriz', '9878.79');

/*Tabla EmpleadoxPlanilla*/
insert into Empleado_x_Planilla (Empleado_idEmpleado, Empleado_Persona_idPersona, Planilla_idPlanilla) values (1, 1, '1');
insert into Empleado_x_Planilla (Empleado_idEmpleado, Empleado_Persona_idPersona, Planilla_idPlanilla) values (2, 2, '1');
insert into Empleado_x_Planilla (Empleado_idEmpleado, Empleado_Persona_idPersona, Planilla_idPlanilla) values (3, 3, '1');
insert into Empleado_x_Planilla (Empleado_idEmpleado, Empleado_Persona_idPersona, Planilla_idPlanilla) values (4, 4, '1');
insert into Empleado_x_Planilla (Empleado_idEmpleado, Empleado_Persona_idPersona, Planilla_idPlanilla) values (5, 5, '1');
insert into Empleado_x_Planilla (Empleado_idEmpleado, Empleado_Persona_idPersona, Planilla_idPlanilla) values (1, 1, '2');
insert into Empleado_x_Planilla (Empleado_idEmpleado, Empleado_Persona_idPersona, Planilla_idPlanilla) values (2, 2, '2');
insert into Empleado_x_Planilla (Empleado_idEmpleado, Empleado_Persona_idPersona, Planilla_idPlanilla) values (3, 3, '2');
insert into Empleado_x_Planilla (Empleado_idEmpleado, Empleado_Persona_idPersona, Planilla_idPlanilla) values (4, 4, '2');
insert into Empleado_x_Planilla (Empleado_idEmpleado, Empleado_Persona_idPersona, Planilla_idPlanilla) values (5, 5, '2');
insert into Empleado_x_Planilla (Empleado_idEmpleado, Empleado_Persona_idPersona, Planilla_idPlanilla) values (1, 1, '3');
insert into Empleado_x_Planilla (Empleado_idEmpleado, Empleado_Persona_idPersona, Planilla_idPlanilla) values (2, 2, '3');
insert into Empleado_x_Planilla (Empleado_idEmpleado, Empleado_Persona_idPersona, Planilla_idPlanilla) values (3, 3, '3');
insert into Empleado_x_Planilla (Empleado_idEmpleado, Empleado_Persona_idPersona, Planilla_idPlanilla) values (4, 4, '3');
insert into Empleado_x_Planilla (Empleado_idEmpleado, Empleado_Persona_idPersona, Planilla_idPlanilla) values (5, 5, '3');

/*Tabla EmpleadoxBono*/
insert into Empleado_x_Bono (Empleado_idEmpleado, Empleado_Persona_idPersona, Bono_idBono, estado_bono, Planilla_idPlanilla) values (1, 1, 1, true, '1');
insert into Empleado_x_Bono (Empleado_idEmpleado, Empleado_Persona_idPersona, Bono_idBono, estado_bono, Planilla_idPlanilla) values (2, 2, 2, false, '1');
insert into Empleado_x_Bono (Empleado_idEmpleado, Empleado_Persona_idPersona, Bono_idBono, estado_bono, Planilla_idPlanilla) values (3, 3, 3, true, '1');
insert into Empleado_x_Bono (Empleado_idEmpleado, Empleado_Persona_idPersona, Bono_idBono, estado_bono, Planilla_idPlanilla) values (4, 4, 1, true, '1');
insert into Empleado_x_Bono (Empleado_idEmpleado, Empleado_Persona_idPersona, Bono_idBono, estado_bono, Planilla_idPlanilla) values (5, 5, 2, true, '2');

/*Tabla Deduccion*/
insert into Deduccion (idDeduccion, fechainicio, fechafin, TipoDeduccion_idTipoDeduccion, valor) values (1, '2020-04-23', '2020-02-04', 1, '1918.15');
insert into Deduccion (idDeduccion, fechainicio, fechafin, TipoDeduccion_idTipoDeduccion, valor) values (2, '2020-06-09', '2019-11-03', 2, '1905.42');
insert into Deduccion (idDeduccion, fechainicio, fechafin, TipoDeduccion_idTipoDeduccion, valor) values (3, '2019-11-03', '2020-09-11', 3, '1366.90');
insert into Deduccion (idDeduccion, fechainicio, fechafin, TipoDeduccion_idTipoDeduccion, valor) values (4, '2020-04-18', '2020-08-11', 2, '1267.71');
insert into Deduccion (idDeduccion, fechainicio, fechafin, TipoDeduccion_idTipoDeduccion, valor) values (5, '2020-05-03', '2020-01-12', 3, '1393.14');
insert into Deduccion (idDeduccion, fechainicio, fechafin, TipoDeduccion_idTipoDeduccion, valor) values (6, '2020-03-10', '2019-10-19', 1, '2952.26');
insert into Deduccion (idDeduccion, fechainicio, fechafin, TipoDeduccion_idTipoDeduccion, valor) values (7, '2020-06-28', '2020-08-10', 1, '2249.08');
insert into Deduccion (idDeduccion, fechainicio, fechafin, TipoDeduccion_idTipoDeduccion, valor) values (8, '2020-03-06', '2020-02-01', 2, '2994.25');
insert into Deduccion (idDeduccion, fechainicio, fechafin, TipoDeduccion_idTipoDeduccion, valor) values (9, '2020-08-20', '2020-08-18', 3, '2398.44');
insert into Deduccion (idDeduccion, fechainicio, fechafin, TipoDeduccion_idTipoDeduccion, valor) values (10, '2020-08-04', '2019-10-16', 1, '2976.75');

/*EmpleadoxDeduccion*/
insert into Empleado_x_Deduccion (Empleado_idEmpleado, Empleado_Persona_idPersona, Deduccion_idDeduccion, fecha_emp_deduc, estado_emp_deduc, Planilla_idPlanilla) values (1, 1, 1, '2020-09-08', false, 1);
insert into Empleado_x_Deduccion (Empleado_idEmpleado, Empleado_Persona_idPersona, Deduccion_idDeduccion, fecha_emp_deduc, estado_emp_deduc, Planilla_idPlanilla) values (2, 2, 2, '2020-02-28', false, 2);
insert into Empleado_x_Deduccion (Empleado_idEmpleado, Empleado_Persona_idPersona, Deduccion_idDeduccion, fecha_emp_deduc, estado_emp_deduc, Planilla_idPlanilla) values (3, 3, 3, '2020-08-06', false, 3);
insert into Empleado_x_Deduccion (Empleado_idEmpleado, Empleado_Persona_idPersona, Deduccion_idDeduccion, fecha_emp_deduc, estado_emp_deduc, Planilla_idPlanilla) values (4, 4, 4, '2020-09-20', false, 4);
insert into Empleado_x_Deduccion (Empleado_idEmpleado, Empleado_Persona_idPersona, Deduccion_idDeduccion, fecha_emp_deduc, estado_emp_deduc, Planilla_idPlanilla) values (5, 5, 5, '2020-04-08', false, 5);
insert into Empleado_x_Deduccion (Empleado_idEmpleado, Empleado_Persona_idPersona, Deduccion_idDeduccion, fecha_emp_deduc, estado_emp_deduc, Planilla_idPlanilla) values (1, 1, 6, '2020-02-13', false, 6);
insert into Empleado_x_Deduccion (Empleado_idEmpleado, Empleado_Persona_idPersona, Deduccion_idDeduccion, fecha_emp_deduc, estado_emp_deduc, Planilla_idPlanilla) values (2, 2, 7, '2019-11-12', true, 7);
insert into Empleado_x_Deduccion (Empleado_idEmpleado, Empleado_Persona_idPersona, Deduccion_idDeduccion, fecha_emp_deduc, estado_emp_deduc, Planilla_idPlanilla) values (4, 4, 8, '2019-10-15', true, 8);
insert into Empleado_x_Deduccion (Empleado_idEmpleado, Empleado_Persona_idPersona, Deduccion_idDeduccion, fecha_emp_deduc, estado_emp_deduc, Planilla_idPlanilla) values (4, 4, 9, '2020-04-30', false, 9);
insert into Empleado_x_Deduccion (Empleado_idEmpleado, Empleado_Persona_idPersona, Deduccion_idDeduccion, fecha_emp_deduc, estado_emp_deduc, Planilla_idPlanilla) values (5, 5, 10, '2020-01-20', false, 10);

/*Tablo TipoContrato*/
insert into TipoContrato (idTipoContrato, descripcion_tipocon) values (1, 'Permanente');
insert into TipoContrato (idTipoContrato, descripcion_tipocon) values (2, 'Temporal');
insert into TipoContrato (idTipoContrato, descripcion_tipocon) values (3, 'Pendiente');

/*Tabla Contrato*/
insert into Contrato (idContrato, fechainicio_contrato, fechafin_contrato, Empleado_idEmpleado, Empleado_Persona_idPersona, TipoContrato_idTipoContrato) values (1, '2019-11-25', '2025-02-28', 1, 1, 1);
insert into Contrato (idContrato, fechainicio_contrato, fechafin_contrato, Empleado_idEmpleado, Empleado_Persona_idPersona, TipoContrato_idTipoContrato) values (2, '2019-01-06', '2022-12-11', 2, 2, 2);
insert into Contrato (idContrato, fechainicio_contrato, fechafin_contrato, Empleado_idEmpleado, Empleado_Persona_idPersona, TipoContrato_idTipoContrato) values (3, '2019-04-25', '2020-11-22', 3, 3, 3);
insert into Contrato (idContrato, fechainicio_contrato, fechafin_contrato, Empleado_idEmpleado, Empleado_Persona_idPersona, TipoContrato_idTipoContrato) values (4, '2020-03-28', '2025-04-09', 4, 4, 1);
insert into Contrato (idContrato, fechainicio_contrato, fechafin_contrato, Empleado_idEmpleado, Empleado_Persona_idPersona, TipoContrato_idTipoContrato) values (5, '2020-12-07', '2021-02-23', 5, 5, 3);

/*Anticipos*/
insert into Anticipos (idAnticipos, Empleado_idEmpleado, Empleado_Persona_idPersona, fecha_anticipo, monto_anticipo, estado_anticipo) values (1, 1, 1, '2020-03-14', '1334.87', false);
insert into Anticipos (idAnticipos, Empleado_idEmpleado, Empleado_Persona_idPersona, fecha_anticipo, monto_anticipo, estado_anticipo) values (2, 2, 2, '2019-11-01', '1983.97', false);
insert into Anticipos (idAnticipos, Empleado_idEmpleado, Empleado_Persona_idPersona, fecha_anticipo, monto_anticipo, estado_anticipo) values (3, 3, 3, '2020-08-21', '1359.60', true);
insert into Anticipos (idAnticipos, Empleado_idEmpleado, Empleado_Persona_idPersona, fecha_anticipo, monto_anticipo, estado_anticipo) values (4, 2, 2, '2020-03-02', '2665.02', true);
insert into Anticipos (idAnticipos, Empleado_idEmpleado, Empleado_Persona_idPersona, fecha_anticipo, monto_anticipo, estado_anticipo) values (5, 1, 1, '2020-09-12', '1946.37', false);

/*Sucursal*/
insert into Sucursal (idSucursal, nombre_sucursal, direccion, Ciudad_idCiudad, Ciudad_Departamento_idDepartamento) values (1, 'Principal', '3 Dexter Drive', 1, 1);
insert into Sucursal (idSucursal, nombre_sucursal, direccion, Ciudad_idCiudad, Ciudad_Departamento_idDepartamento) values (2, 'Bodega 1', '3 Roxbury Court', 7, 1);
insert into Sucursal (idSucursal, nombre_sucursal, direccion, Ciudad_idCiudad, Ciudad_Departamento_idDepartamento) values (3, 'Bodega 2', '52 Daystar Road', 10, 10);

/*Area*/
insert into Area (idArea, nombre_area, Sucursal_idSucursal) values (1, 'Parte principal', 1);
insert into Area (idArea, nombre_area, Sucursal_idSucursal) values (2, 'Minibodega', 1);
insert into Area (idArea, nombre_area, Sucursal_idSucursal) values (3, 'Llantera', 2);
insert into Area (idArea, nombre_area, Sucursal_idSucursal) values (4, 'Estanteria', 2);
insert into Area (idArea, nombre_area, Sucursal_idSucursal) values (5, 'Sala principal', 3);
insert into Area (idArea, nombre_area, Sucursal_idSucursal) values (6, 'Sotano', 3);

/*CargoxEmpleado*/
insert into Cargo_x_Empleado (Cargo_idCargo, Empleado_idEmpleado, Empleado_Persona_idPersona, fecha_nombramiento, fecha_fin) values (1, 1, 1, '2019-12-04', null);
insert into Cargo_x_Empleado (Cargo_idCargo, Empleado_idEmpleado, Empleado_Persona_idPersona, fecha_nombramiento, fecha_fin) values (2, 2, 2, '2020-09-07', null);
insert into Cargo_x_Empleado (Cargo_idCargo, Empleado_idEmpleado, Empleado_Persona_idPersona, fecha_nombramiento, fecha_fin) values (3, 3, 3, '2020-10-02', null);
insert into Cargo_x_Empleado (Cargo_idCargo, Empleado_idEmpleado, Empleado_Persona_idPersona, fecha_nombramiento, fecha_fin) values (4, 4, 4, '2020-06-11', null);
insert into Cargo_x_Empleado (Cargo_idCargo, Empleado_idEmpleado, Empleado_Persona_idPersona, fecha_nombramiento, fecha_fin) values (5, 5, 5, '2020-05-29', null);

/*Contenedor*/
insert into Contenedor (idContenedor, descripcion_cont, TipoContenedor_idTipoContenedor) values (1, 'N#1', 1);
insert into Contenedor (idContenedor, descripcion_cont, TipoContenedor_idTipoContenedor) values (2, 'N#2', 1);
insert into Contenedor (idContenedor, descripcion_cont, TipoContenedor_idTipoContenedor) values (3, 'N#3', 1);
insert into Contenedor (idContenedor, descripcion_cont, TipoContenedor_idTipoContenedor) values (4, 'N#1', 2);
insert into Contenedor (idContenedor, descripcion_cont, TipoContenedor_idTipoContenedor) values (5, 'N#2', 2);
insert into Contenedor (idContenedor, descripcion_cont, TipoContenedor_idTipoContenedor) values (6, 'N#3', 2);
insert into Contenedor (idContenedor, descripcion_cont, TipoContenedor_idTipoContenedor) values (7, 'N#1', 3);
insert into Contenedor (idContenedor, descripcion_cont, TipoContenedor_idTipoContenedor) values (8, 'N#2', 3);
insert into Contenedor (idContenedor, descripcion_cont, TipoContenedor_idTipoContenedor) values (9, 'N#1', 4);
insert into Contenedor (idContenedor, descripcion_cont, TipoContenedor_idTipoContenedor) values (10, 'N#1', 5);

/*Pasillo*/
insert into Pasillo (idPasillo, descripcion_pasillo, Area_idArea) values (1, 'Pasillo 1', 1);
insert into Pasillo (idPasillo, descripcion_pasillo, Area_idArea) values (2, 'Pasillo 2', 1);
insert into Pasillo (idPasillo, descripcion_pasillo, Area_idArea) values (3, 'Pasillo 1', 2);
insert into Pasillo (idPasillo, descripcion_pasillo, Area_idArea) values (4, 'Pasillo 2', 2);
insert into Pasillo (idPasillo, descripcion_pasillo, Area_idArea) values (5, 'Pasillo 1', 3);
insert into Pasillo (idPasillo, descripcion_pasillo, Area_idArea) values (6, 'Pasillo 2 ', 3);
insert into Pasillo (idPasillo, descripcion_pasillo, Area_idArea) values (7, 'Pasillo 1', 4);
insert into Pasillo (idPasillo, descripcion_pasillo, Area_idArea) values (8, 'Pasillo 2', 4);
insert into Pasillo (idPasillo, descripcion_pasillo, Area_idArea) values (9, 'Pasillo 1', 5);
insert into Pasillo (idPasillo, descripcion_pasillo, Area_idArea) values (10, 'Pasillo 1', 6);
/*PasilloxContenedor*/
insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (1, 1);
insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (1, 2);
insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (1, 3);

insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (2, 1);
insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (2, 2);
insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (2, 3);

insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (3, 7);
insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (3, 8);

insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (4, 7);
insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (4, 8);

insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (5, 7);
insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (5, 8);

insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (6, 1);
insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (6, 2);
insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (6, 3);

insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (7, 7);
insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (7, 8);
insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (7, 10);

insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (8, 1);
insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (8, 4);
insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (8, 5);

insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (9, 1);
insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (9, 2);
insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (9, 3);
insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (9, 9);

insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (10, 1);
insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (10, 2);
insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (10, 3);
insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (10, 9);
insert into Pasillo_x_Contenedor (Pasillo_idPasillo, Contenedor_idContenedor) values (10, 10);

/*Producto*/
insert into Producto (idProducto, nombre_producto, fechaVencimiento, fechaElaboracion, precioCosto, precioVenta, precioOferta, estado_producto, cantidad, Contenedor_idContenedor) values (1, 'Churros Yummi', '2019-12-04', '2020-07-27', '83.78', '291.12', '0', 'D', 99, 1);
insert into Producto (idProducto, nombre_producto, fechaVencimiento, fechaElaboracion, precioCosto, precioVenta, precioOferta, estado_producto, cantidad, Contenedor_idContenedor) values (2, 'Lubricante Sparco', null, null, '66.99', '209.15', '0', 'D', 189, 1);
insert into Producto (idProducto, nombre_producto, fechaVencimiento, fechaElaboracion, precioCosto, precioVenta, precioOferta, estado_producto, cantidad, Contenedor_idContenedor) values (3, 'Coca Cola 2 lt.', '2019-10-16', '2020-06-10', '60.13', '185.34', '0', 'D', 267, 7);
insert into Producto (idProducto, nombre_producto, fechaVencimiento, fechaElaboracion, precioCosto, precioVenta, precioOferta, estado_producto, cantidad, Contenedor_idContenedor) values (4, 'Aromatizante', '2019-12-13', '2020-06-29', '58.30', '112.31', '0', 'D', 235, 6);
insert into Producto (idProducto, nombre_producto, fechaVencimiento, fechaElaboracion, precioCosto, precioVenta, precioOferta, estado_producto, cantidad, Contenedor_idContenedor) values (5, 'Bujias NSK', null, null, '91.36', '218.42', '0', 'D', 215, 10);
insert into Producto (idProducto, nombre_producto, fechaVencimiento, fechaElaboracion, precioCosto, precioVenta, precioOferta, estado_producto, cantidad, Contenedor_idContenedor) values (6, 'Set de Tuercas Honda', null, null, '60.43', '161.15', '0', 'D', 275, 2);
insert into Producto (idProducto, nombre_producto, fechaVencimiento, fechaElaboracion, precioCosto, precioVenta, precioOferta, estado_producto, cantidad, Contenedor_idContenedor) values (7, 'Botes Aguazul 1 lt.', '2019-12-11', '2020-04-20', '90.90', '231.69', '0', 'D', 79, 9);
insert into Producto (idProducto, nombre_producto, fechaVencimiento, fechaElaboracion, precioCosto, precioVenta, precioOferta, estado_producto, cantidad, Contenedor_idContenedor) values (8, 'Pegatinas Nissan', null, null, '60.31', '261.96', '0', 'D', 320, 6);
insert into Producto (idProducto, nombre_producto, fechaVencimiento, fechaElaboracion, precioCosto, precioVenta, precioOferta, estado_producto, cantidad, Contenedor_idContenedor) values (9, 'Perilla de puerta Toyota', null, null, '57.09', '75.60', '0', 'D', 203, 3);
insert into Producto (idProducto, nombre_producto, fechaVencimiento, fechaElaboracion, precioCosto, precioVenta, precioOferta, estado_producto, cantidad, Contenedor_idContenedor) values (10, 'Tuercas de llana 22R', null, null, '64.14', '128.99', '0', 'D', 176, 3);

/*ProductoxProveedor*/
insert into Producto_x_Proveedor (Producto_idProducto, Proveedor_idProveedor, cantidad_ingreso, fecha_ingreso) values (1, 1, 59, '2020-07-16');
insert into Producto_x_Proveedor (Producto_idProducto, Proveedor_idProveedor, cantidad_ingreso, fecha_ingreso) values (2, 2, 50, '2020-06-06');
insert into Producto_x_Proveedor (Producto_idProducto, Proveedor_idProveedor, cantidad_ingreso, fecha_ingreso) values (3, 3, 77, '2020-03-14');
insert into Producto_x_Proveedor (Producto_idProducto, Proveedor_idProveedor, cantidad_ingreso, fecha_ingreso) values (4, 4, 7, '2020-08-07');
insert into Producto_x_Proveedor (Producto_idProducto, Proveedor_idProveedor, cantidad_ingreso, fecha_ingreso) values (5, 5, 28, '2019-12-21');

/*INSERTS FALTANTES*/
/*Factura_Encabezado*/
/*FacturaEncabezadoxFormaPago*/
/*FacturaEncabezadoxProducto*/
/*Jornada*/
/*Movimiento*/
/*TarjetaAcumulacion*/