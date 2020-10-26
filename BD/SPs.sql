----Para crear nuevo usuario----
DELIMITER $$
CREATE PROCEDURE SPnuevo_usuario
    (
    IN idUsuario INT,
    IN idEmpleado INT,
    IN idTipoUsuario INT,
    IN nombre_usuario VARCHAR(50),
    IN password_usuario VARCHAR(50),
    IN pcAccion VARCHAR(1000),
	OUT pcMensaje VARCHAR(1000),
	OUT pbOcurreError BOOLEAN
    )
    SP:BEGIN
        DECLARE vcMsjTemp VARCHAR(1000);
		SET autocommit = 0;
		
		START TRANSACTION;
		SET vcMsjTemp = NULL;
		SET pbOcurreError = TRUE;
		
		IF pcAccion IN('', NULL) THEN
			SET vcMsjTemp = CONCAT('Accion: ');
		END IF;
		
		IF idUsuario IS NULL THEN
			SET vcMsjTemp = CONCAT('ID Usuario ');
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
		
		IF vcMsjTemp <> '' THEN
			SET pcMensaje = CONCAT('Faltan los campos necesarios para crear el usuario: ', vcMsjTemp);
			LEAVE SP;
		END IF;

        INSERT INTO Usuario VALUES(idUsuario, idEmpleado, idTipoUsuario, nombre_usuario, password_usuario);
        COMMIT;
    END


----Para crear nuevo proveedor---
DELIMITER $$
CREATE PROCEDURE SPnuevo_proveedor
    (
    IN idProveedor INT,
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
		SET autocommit = 0;
		
		START TRANSACTION;
		SET vcMsjTemp = NULL;
		SET pbOcurreError = TRUE;
		
		IF pcAccion IN('', NULL) THEN
			SET vcMsjTemp = CONCAT('Accion: ');
		END IF;
		
		IF idProveedor IS NULL THEN
			SET vcMsjTemp = CONCAT('ID Proveedor ');
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
		
		IF vcMsjTemp <> '' THEN
			SET pcMensaje = CONCAT('Faltan los campos necesarios para crear el usuario: ', vcMsjTemp);
			LEAVE SP;
		END IF;

        INSERT INTO Usuario VALUES(idProveedor, nombre_proveedor, direccion_proveedor, telefono_proveedor, correo_proveedor, idPersona);
        COMMIT;
    END

----Para crear nuevo empleado----

----Para crear nuevo cliente----