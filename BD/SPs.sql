----Para crear nuevo usuario----
DELIMITER $$
CREATE PROCEDURE SPnuevo_usuario
    (
		IN idEmpleado INT,
		IN idTipousuario INT,
    	IN nombre_usuario VARCHAR(50),
    	IN password_usuario VARCHAR(50),
    	OUT pcAccion VARCHAR(1000),
		OUT pcMensaje VARCHAR(1000),
		OUT pbOcurreError BOOLEAN
    )
    SP:BEGIN
        DECLARE vcMsjTemp VARCHAR(1000);
		DECLARE idUsuario_insert INT;
		SET pbOcurreError = 0;
		SET autocommit = 0;
		
		START TRANSACTION;
		SET vcMsjTemp = NULL;
		SET pbOcurreError = TRUE;
		
		IF pcAccion IN('', NULL) THEN
			SET vcMsjTemp = CONCAT('Accion: ');
		END IF;
		
		IF idEmpleado IS NULL THEN
			SET vcMsjTemp = CONCAT('ID Empleado ');
		END IF;
		
		IF idTipoUsuario IS NULL THEN
			SET vcMsjTemp = CONCAT('IDTipoUsuario ');
		END IF;
		
		IF nombre_usuario IS NULL THEN
			SET vcMsjTemp = CONCAT('Nombre Usuario ');
		END IF;

        IF password_usuario IS NULL THEN
            SET vcMsjTemp = CONCAT('Password Usuario ');
        END IF;
		
		SET idUsuario_insert = (SELECT COUNT(idUsuario) FROM Usuario) + 1;

		IF vcMsjTemp <> '' THEN
			SET pcMensaje = CONCAT('Faltan los campos necesarios para crear el usuario: ', vcMsjTemp);
			LEAVE SP;
		END IF;

        INSERT INTO Usuario VALUES(idUsuario_insert, idEmpleado, idTipoUsuario, nombre_usuario, password_usuario);
        COMMIT;
    END
    


----Para crear nuevo proveedor---
DELIMITER $$
CREATE PROCEDURE SPnuevo_proveedor(
    IN nombre_proveedor VARCHAR(45),
    IN direccion_proveedor VARCHAR(45),
    IN telefono_proveedor VARCHAR(45),
    IN correo_proveedor VARCHAR(45),
    IN idPersona INT,
    IN pcAccion VARCHAR(1000),
	OUT pcMensaje VARCHAR(1000),
	OUT pbOcurreError BOOLEAN
    )
SP:BEGIN
        DECLARE vcMsjTemp VARCHAR(1000);
        DECLARE idProveedor_insert INT;
		SET autocommit = 0;
		
		START TRANSACTION;
		SET vcMsjTemp = NULL;
		SET pbOcurreError = TRUE;
		
		IF pcAccion IN('', NULL) THEN
			SET vcMsjTemp = CONCAT('Accion: ');
		END IF;
		
		IF nombre_proveedor IS NULL THEN
			SET vcMsjTemp = CONCAT('Nombre Proveedor ');
		END IF;
		
		IF direccion_proveedor IS NULL THEN
			SET vcMsjTemp = CONCAT('Direccion Proveedor ');
		END IF;
		
		IF telefono_proveedor IS NULL THEN
			SET vcMsjTemp = CONCAT('Telefono Proveedor ');
		END IF;

        IF correo_proveedor IS NULL THEN
            SET vcMsjTemp = CONCAT('Correo Usuario ');
        END IF;
		
		SET idProveedor_insert = (SELECT COUNT(idProveedor) FROM Proveedor) + 1;
        
		IF vcMsjTemp <> '' THEN
			SET pcMensaje = CONCAT('Faltan los campos necesarios para crear el usuario: ', vcMsjTemp);
			LEAVE SP;
		END IF;

        INSERT INTO Usuario VALUES(idProveedor_insert, nombre_proveedor, direccion_proveedor, telefono_proveedor, correo_proveedor, idPersona);
        COMMIT;
    END

----Para crear nuevo empleado----
----Persona, Telefono, Empleado, CargoxEmpleado----
DELIMITER $$
CREATE PROCEDURE SPnuevo_empleado
(
	IN pNombre VARCHAR(50),
	IN sNombre VARCHAR(50),
	IN pApellido VARCHAR(50),
	IN sApellido VARCHAR(50),
	IN nom_ciudad INT,
	IN direccion VARCHAR(50),
	IN num_telefono VARCHAR(50),
	IN email VARCHAR(50),
	IN fechaRegistro DATE,
	IN identidad VARCHAR(50),
	IN idCargo_insert INT
)
SP:BEGIN
	DECLARE sueldo_base_insert FLOAT;
	DECLARE idPersona_insert INT;
	DECLARE idTelefono_insert INT;
	DECLARE idCorreo_insert INT;
	DECLARE idEmpleado_insert INT;
	DECLARE nom_departamento INT;

	SET idPersona_insert = (SELECT COUNT(idPersona) FROM Persona) + 1;
	SET idTelefono_insert = (SELECT COUNT(idTelefono) FROM Telefono) + 1;
	SET idCorreo_insert = (SELECT COUNT(idCorreo_insert) FROM Correo) + 1;
	SET idEmpleado_insert = (SELECT COUNT(idEmpleado_insert) FROM Empleado) + 1;

	SET sueldo_base_insert = (SELECT sueldo_base FROM Cargo WHERE idCargo = idCargo_insert);

	SET autocommit = 0;
	START TRANSACTION;

	INSERT INTO Persona VALUES(idPersona_insert, nom_ciudad, nom_departamento, pNombre, sNombre, pApellido, sApellido, identidad, direccion);
	
	INSERT INTO Telefono VALUES(idTelefono_insert, idPersona_insert, num_telefono);

	IF email <> '' THEN
		INSERT INTO Correo VALUES(idCorreo_insert, email, idPersona_insert);
	END IF;

	INSERT INTO Empleado VALUES(idEmpleado_insert, idPersona_insert, sueldo_base_insert);
	
	INSERT INTO CargoxEmpleado VALUES(idCargo_insert, idEmpleado_insert, idPersona_insert, fechaRegistro);
	COMMIT;
END


----Para crear nuevo cliente----
CREATE PROCEDURE SPnuevo_cliente(
	IN pNombre VARCHAR(50),
	IN sNombre VARCHAR(50),
	IN pApellido VARCHAR(50),
	IN sApellido VARCHAR(50),
	IN nom_ciudad INT,
	IN direccion VARCHAR(50),
	IN num_telefono VARCHAR(50),
	IN email VARCHAR(50),
	IN fechaRegistro DATE,
	IN id VARCHAR(50),
	IN nom_departamento INT
    )
BEGIN
		SET autocommit = 0;
		
		START TRANSACTION;
	
        INSERT INTO persona (Ciudad_idCiudad,Ciudad_Departamento_idDepartamento,pnombre,snombre,papellido,sapellido,num_identidad,direccion)
		VALUES (nom_ciudad,nom_departamento,pNombre,sNombre,pApellido,sApellido,id,direccion);

		SELECT @idPersona:= idPersona from persona where num_identidad = id FOR UPDATE;

		INSERT INTO telefono (Persona_idPersona,num_telefono)
		VALUES (@idPersona,num_telefono);

		INSERT INTO correo (dir_correo,Persona_idPersona)
		VALUES (email,@idPersona);

		INSERT INTO cliente (Persona_idPersona,fechaRegistro)
		VALUES (@idPersona,DATE(fechaRegistro));
        
        COMMIT;
        
END