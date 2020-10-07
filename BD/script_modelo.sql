-- MySQL Script generated by MySQL Workbench
-- Tue Oct  6 20:39:30 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema modelosistema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema modelosistema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `modelosistema` DEFAULT CHARACTER SET utf8 ;
USE `modelosistema` ;

-- -----------------------------------------------------
-- Table `modelosistema`.`Pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Pais` (
  `idPais` INT NOT NULL AUTO_INCREMENT,
  `nom_pais` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idPais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Departamento` (
  `idDepartamento` INT NOT NULL AUTO_INCREMENT,
  `nom_departamento` VARCHAR(100) NOT NULL,
  `Pais_idPais` INT NOT NULL,
  PRIMARY KEY (`idDepartamento`, `Pais_idPais`),
  INDEX `fk_Departamento_Pais1_idx` (`Pais_idPais` ASC),
  CONSTRAINT `fk_Departamento_Pais1`
    FOREIGN KEY (`Pais_idPais`)
    REFERENCES `modelosistema`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Ciudad` (
  `idCiudad` INT NOT NULL AUTO_INCREMENT,
  `nom_ciudad` VARCHAR(100) NOT NULL,
  `Departamento_idDepartamento` INT NOT NULL,
  PRIMARY KEY (`idCiudad`, `Departamento_idDepartamento`),
  INDEX `fk_Ciudad_Departamento1_idx` (`Departamento_idDepartamento` ASC),
  CONSTRAINT `fk_Ciudad_Departamento1`
    FOREIGN KEY (`Departamento_idDepartamento`)
    REFERENCES `modelosistema`.`Departamento` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Persona` (
  `idPersona` INT NOT NULL AUTO_INCREMENT,
  `Ciudad_idCiudad` INT NOT NULL,
  `Ciudad_Departamento_idDepartamento` INT NOT NULL,
  `pnombre` VARCHAR(45) NOT NULL,
  `snombre` VARCHAR(45) NULL,
  `papellido` VARCHAR(45) NOT NULL,
  `sapellido` VARCHAR(45) NULL,
  `num_identidad` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(100) NULL,
  PRIMARY KEY (`idPersona`, `Ciudad_idCiudad`, `Ciudad_Departamento_idDepartamento`),
  INDEX `fk_Persona_Ciudad1_idx` (`Ciudad_idCiudad` ASC, `Ciudad_Departamento_idDepartamento` ASC),
  CONSTRAINT `fk_Persona_Ciudad1`
    FOREIGN KEY (`Ciudad_idCiudad` , `Ciudad_Departamento_idDepartamento`)
    REFERENCES `modelosistema`.`Ciudad` (`idCiudad` , `Departamento_idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `Persona_idPersona` INT NOT NULL,
  `fechaRegistro` DATE NOT NULL,
  PRIMARY KEY (`idCliente`, `Persona_idPersona`),
  INDEX `fk_Cliente_Persona_idx` (`Persona_idPersona` ASC),
  CONSTRAINT `fk_Cliente_Persona`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `modelosistema`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Empleado` (
  `idEmpleado` INT NOT NULL AUTO_INCREMENT,
  `Persona_idPersona` INT NOT NULL,
  `sueldo_emp` DOUBLE NOT NULL,
  PRIMARY KEY (`idEmpleado`, `Persona_idPersona`),
  INDEX `fk_Empleado_Persona1_idx` (`Persona_idPersona` ASC),
  CONSTRAINT `fk_Empleado_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `modelosistema`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Telefono` (
  `idTelefono` INT NOT NULL AUTO_INCREMENT,
  `Persona_idPersona` INT NOT NULL,
  `num_telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTelefono`, `Persona_idPersona`),
  INDEX `fk_Telefono_Persona1_idx` (`Persona_idPersona` ASC),
  CONSTRAINT `fk_Telefono_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `modelosistema`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Compania`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Compania` (
  `idCompania` INT NOT NULL AUTO_INCREMENT,
  `Telefono_idTelefono` INT NOT NULL,
  `Telefono_Persona_idPersona` INT NOT NULL,
  `nombre_compania` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCompania`, `Telefono_idTelefono`, `Telefono_Persona_idPersona`),
  INDEX `fk_Compania_Telefono1_idx` (`Telefono_idTelefono` ASC, `Telefono_Persona_idPersona` ASC),
  CONSTRAINT `fk_Compania_Telefono1`
    FOREIGN KEY (`Telefono_idTelefono` , `Telefono_Persona_idPersona`)
    REFERENCES `modelosistema`.`Telefono` (`idTelefono` , `Persona_idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Correo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Correo` (
  `idCorreo` INT NOT NULL AUTO_INCREMENT,
  `dir_correo` VARCHAR(45) NOT NULL,
  `Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idCorreo`, `Persona_idPersona`),
  INDEX `fk_Correo_Persona1_idx` (`Persona_idPersona` ASC),
  CONSTRAINT `fk_Correo_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `modelosistema`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Cargo` (
  `idCargo` INT NOT NULL AUTO_INCREMENT,
  `descripcion_cargo` VARCHAR(100) NOT NULL,
  `nombre_cargo` VARCHAR(50) NOT NULL,
  `sueldo_base` DOUBLE NULL,
  PRIMARY KEY (`idCargo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Cargo_x_Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Cargo_x_Empleado` (
  `Cargo_idCargo` INT NOT NULL,
  `Empleado_idEmpleado` INT NOT NULL,
  `Empleado_Persona_idPersona` INT NOT NULL,
  `fecha_nombramiento` DATE NOT NULL,
  `fecha_fin` DATE NULL,
  PRIMARY KEY (`Cargo_idCargo`, `Empleado_idEmpleado`, `Empleado_Persona_idPersona`),
  INDEX `fk_Cargo_has_Empleado_Empleado1_idx` (`Empleado_idEmpleado` ASC, `Empleado_Persona_idPersona` ASC),
  INDEX `fk_Cargo_has_Empleado_Cargo1_idx` (`Cargo_idCargo` ASC),
  CONSTRAINT `fk_Cargo_has_Empleado_Cargo1`
    FOREIGN KEY (`Cargo_idCargo`)
    REFERENCES `modelosistema`.`Cargo` (`idCargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cargo_has_Empleado_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado` , `Empleado_Persona_idPersona`)
    REFERENCES `modelosistema`.`Empleado` (`idEmpleado` , `Persona_idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Planilla`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Planilla` (
  `idPlanilla` INT NOT NULL AUTO_INCREMENT,
  `fechaefectiva` DATE NULL,
  `fechainicio` DATE NULL,
  `fechafin` DATE NULL,
  PRIMARY KEY (`idPlanilla`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Empleado_x_Planilla`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Empleado_x_Planilla` (
  `Empleado_idEmpleado` INT NOT NULL,
  `Empleado_Persona_idPersona` INT NOT NULL,
  `Planilla_idPlanilla` INT NOT NULL,
  PRIMARY KEY (`Empleado_idEmpleado`, `Empleado_Persona_idPersona`, `Planilla_idPlanilla`),
  INDEX `fk_Empleado_has_Planilla_Planilla1_idx` (`Planilla_idPlanilla` ASC),
  INDEX `fk_Empleado_has_Planilla_Empleado1_idx` (`Empleado_idEmpleado` ASC, `Empleado_Persona_idPersona` ASC),
  CONSTRAINT `fk_Empleado_has_Planilla_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado` , `Empleado_Persona_idPersona`)
    REFERENCES `modelosistema`.`Empleado` (`idEmpleado` , `Persona_idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empleado_has_Planilla_Planilla1`
    FOREIGN KEY (`Planilla_idPlanilla`)
    REFERENCES `modelosistema`.`Planilla` (`idPlanilla`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Bono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Bono` (
  `idBono` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(100) NOT NULL,
  `fecha_bono` DATE NULL,
  `monto` DOUBLE NOT NULL,
  PRIMARY KEY (`idBono`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Empleado_x_Bono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Empleado_x_Bono` (
  `Empleado_idEmpleado` INT NOT NULL,
  `Empleado_Persona_idPersona` INT NOT NULL,
  `Bono_idBono` INT NOT NULL,
  `estado_bono` BINARY NULL,
  `Planilla_idPlanilla` INT NULL,
  PRIMARY KEY (`Empleado_idEmpleado`, `Empleado_Persona_idPersona`, `Bono_idBono`),
  INDEX `fk_Empleado_has_Bono_Bono1_idx` (`Bono_idBono` ASC),
  INDEX `fk_Empleado_has_Bono_Empleado1_idx` (`Empleado_idEmpleado` ASC, `Empleado_Persona_idPersona` ASC),
  INDEX `fk_Empleado_has_Bono_Planilla1_idx` (`Planilla_idPlanilla` ASC),
  CONSTRAINT `fk_Empleado_has_Bono_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado` , `Empleado_Persona_idPersona`)
    REFERENCES `modelosistema`.`Empleado` (`idEmpleado` , `Persona_idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empleado_has_Bono_Bono1`
    FOREIGN KEY (`Bono_idBono`)
    REFERENCES `modelosistema`.`Bono` (`idBono`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empleado_has_Bono_Planilla1`
    FOREIGN KEY (`Planilla_idPlanilla`)
    REFERENCES `modelosistema`.`Planilla` (`idPlanilla`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Anticipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Anticipos` (
  `idAnticipos` INT NOT NULL AUTO_INCREMENT,
  `Empleado_idEmpleado` INT NOT NULL,
  `Empleado_Persona_idPersona` INT NOT NULL,
  `descripcion_anticipo` VARCHAR(45) NULL,
  `fecha_anticipo` DATE NULL,
  `monto_anticipo` DOUBLE NULL,
  `estado_anticipo` BINARY NULL,
  PRIMARY KEY (`idAnticipos`, `Empleado_idEmpleado`, `Empleado_Persona_idPersona`),
  INDEX `fk_Anticipos_Empleado1_idx` (`Empleado_idEmpleado` ASC, `Empleado_Persona_idPersona` ASC),
  CONSTRAINT `fk_Anticipos_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado` , `Empleado_Persona_idPersona`)
    REFERENCES `modelosistema`.`Empleado` (`idEmpleado` , `Persona_idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`TipoDeduccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`TipoDeduccion` (
  `idTipoDeduccion` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(100) NOT NULL,
  `monto` DOUBLE NULL,
  PRIMARY KEY (`idTipoDeduccion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Deduccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Deduccion` (
  `idDeduccion` INT NOT NULL AUTO_INCREMENT,
  `fechainicio` DATE NULL,
  `fechafin` DATE NULL,
  `valor` DOUBLE NULL,
  `TipoDeduccion_idTipoDeduccion` INT NOT NULL,
  PRIMARY KEY (`idDeduccion`, `TipoDeduccion_idTipoDeduccion`),
  INDEX `fk_Deduccion_TipoDeduccion1_idx` (`TipoDeduccion_idTipoDeduccion` ASC),
  CONSTRAINT `fk_Deduccion_TipoDeduccion1`
    FOREIGN KEY (`TipoDeduccion_idTipoDeduccion`)
    REFERENCES `modelosistema`.`TipoDeduccion` (`idTipoDeduccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Empleado_x_Deduccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Empleado_x_Deduccion` (
  `Empleado_idEmpleado` INT NOT NULL,
  `Empleado_Persona_idPersona` INT NOT NULL,
  `Deduccion_idDeduccion` INT NOT NULL,
  `fecha_emp_deduc` DATE NOT NULL,
  `estado_emp_deduc` BINARY NULL,
  `Planilla_idPlanilla` INT NULL,
  PRIMARY KEY (`Empleado_idEmpleado`, `Empleado_Persona_idPersona`, `Deduccion_idDeduccion`),
  INDEX `fk_Empleado_has_Deduccion_Deduccion1_idx` (`Deduccion_idDeduccion` ASC),
  INDEX `fk_Empleado_has_Deduccion_Empleado1_idx` (`Empleado_idEmpleado` ASC, `Empleado_Persona_idPersona` ASC),
  INDEX `fk_Empleado_x_Deduccion_Planilla1_idx` (`Planilla_idPlanilla` ASC),
  CONSTRAINT `fk_Empleado_has_Deduccion_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado` , `Empleado_Persona_idPersona`)
    REFERENCES `modelosistema`.`Empleado` (`idEmpleado` , `Persona_idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empleado_has_Deduccion_Deduccion1`
    FOREIGN KEY (`Deduccion_idDeduccion`)
    REFERENCES `modelosistema`.`Deduccion` (`idDeduccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empleado_x_Deduccion_Planilla1`
    FOREIGN KEY (`Planilla_idPlanilla`)
    REFERENCES `modelosistema`.`Planilla` (`idPlanilla`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Factura_Encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Factura_Encabezado` (
  `idFactura` INT NOT NULL AUTO_INCREMENT,
  `fecha_factura` DATE NOT NULL,
  `observaciones` VARCHAR(100) NOT NULL,
  `total_factura` DOUBLE NOT NULL,
  `RTN` VARCHAR(45) NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Cliente_Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idFactura`, `Cliente_idCliente`, `Cliente_Persona_idPersona`),
  INDEX `fk_Factura_Encabezado_Cliente1_idx` (`Cliente_idCliente` ASC, `Cliente_Persona_idPersona` ASC),
  CONSTRAINT `fk_Factura_Encabezado_Cliente1`
    FOREIGN KEY (`Cliente_idCliente` , `Cliente_Persona_idPersona`)
    REFERENCES `modelosistema`.`Cliente` (`idCliente` , `Persona_idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`TipoContrato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`TipoContrato` (
  `idTipoContrato` INT NOT NULL AUTO_INCREMENT,
  `descripcion_tipocon` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idTipoContrato`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Contrato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Contrato` (
  `idContrato` INT NOT NULL AUTO_INCREMENT,
  `fechainicio_contrato` DATE NOT NULL,
  `fechafin_contrato` DATE NOT NULL,
  `Empleado_idEmpleado` INT NOT NULL,
  `Empleado_Persona_idPersona` INT NOT NULL,
  `TipoContrato_idTipoContrato` INT NOT NULL,
  PRIMARY KEY (`idContrato`, `Empleado_idEmpleado`, `Empleado_Persona_idPersona`, `TipoContrato_idTipoContrato`),
  INDEX `fk_Contrato_Empleado1_idx` (`Empleado_idEmpleado` ASC, `Empleado_Persona_idPersona` ASC),
  INDEX `fk_Contrato_TipoContrato1_idx` (`TipoContrato_idTipoContrato` ASC),
  CONSTRAINT `fk_Contrato_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado` , `Empleado_Persona_idPersona`)
    REFERENCES `modelosistema`.`Empleado` (`idEmpleado` , `Persona_idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contrato_TipoContrato1`
    FOREIGN KEY (`TipoContrato_idTipoContrato`)
    REFERENCES `modelosistema`.`TipoContrato` (`idTipoContrato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Jornada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Jornada` (
  `idJornada` INT NOT NULL AUTO_INCREMENT,
  `horainicio_jor` DATETIME NOT NULL,
  `horafin_jor` DATETIME NOT NULL,
  `Empleado_idEmpleado` INT NOT NULL,
  `Empleado_Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idJornada`, `Empleado_idEmpleado`, `Empleado_Persona_idPersona`),
  INDEX `fk_Jornada_Empleado1_idx` (`Empleado_idEmpleado` ASC, `Empleado_Persona_idPersona` ASC),
  CONSTRAINT `fk_Jornada_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado` , `Empleado_Persona_idPersona`)
    REFERENCES `modelosistema`.`Empleado` (`idEmpleado` , `Persona_idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`TarjetaAcumulacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`TarjetaAcumulacion` (
  `idTarjetaAcumulacion` INT NOT NULL AUTO_INCREMENT,
  `fechaEmision` DATE NOT NULL,
  `fechaVencimiento` DATE NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Cliente_Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idTarjetaAcumulacion`, `Cliente_idCliente`, `Cliente_Persona_idPersona`),
  INDEX `fk_TarjetaAcumulacion_Cliente1_idx` (`Cliente_idCliente` ASC, `Cliente_Persona_idPersona` ASC),
  CONSTRAINT `fk_TarjetaAcumulacion_Cliente1`
    FOREIGN KEY (`Cliente_idCliente` , `Cliente_Persona_idPersona`)
    REFERENCES `modelosistema`.`Cliente` (`idCliente` , `Persona_idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Movimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Movimiento` (
  `idMovimiento` INT NOT NULL AUTO_INCREMENT,
  `fechaTransaccion` DATE NOT NULL,
  `tipoMovimiento` VARCHAR(1) NOT NULL,
  `cantidadPuntos` INT NOT NULL,
  `TarjetaAcumulacion_idTarjetaAcumulacion` INT NOT NULL,
  `TarjetaAcumulacion_Cliente_idCliente` INT NOT NULL,
  `TarjetaAcumulacion_Cliente_Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idMovimiento`, `TarjetaAcumulacion_idTarjetaAcumulacion`, `TarjetaAcumulacion_Cliente_idCliente`, `TarjetaAcumulacion_Cliente_Persona_idPersona`),
  INDEX `fk_Movimiento_TarjetaAcumulacion1_idx` (`TarjetaAcumulacion_idTarjetaAcumulacion` ASC, `TarjetaAcumulacion_Cliente_idCliente` ASC, `TarjetaAcumulacion_Cliente_Persona_idPersona` ASC),
  CONSTRAINT `fk_Movimiento_TarjetaAcumulacion1`
    FOREIGN KEY (`TarjetaAcumulacion_idTarjetaAcumulacion` , `TarjetaAcumulacion_Cliente_idCliente` , `TarjetaAcumulacion_Cliente_Persona_idPersona`)
    REFERENCES `modelosistema`.`TarjetaAcumulacion` (`idTarjetaAcumulacion` , `Cliente_idCliente` , `Cliente_Persona_idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`FormaPago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`FormaPago` (
  `idFormaPago` INT NOT NULL AUTO_INCREMENT,
  `descripcion_formapago` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFormaPago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`FacturaEncabezado_x_FormaPago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`FacturaEncabezado_x_FormaPago` (
  `Factura_Encabezado_idFactura` INT NOT NULL,
  `Factura_Encabezado_Cliente_idCliente` INT NOT NULL,
  `Factura_Encabezado_Cliente_Persona_idPersona` INT NOT NULL,
  `FormaPago_idFormaPago` INT NOT NULL,
  `montoPagado` DOUBLE NOT NULL,
  PRIMARY KEY (`Factura_Encabezado_idFactura`, `Factura_Encabezado_Cliente_idCliente`, `Factura_Encabezado_Cliente_Persona_idPersona`, `FormaPago_idFormaPago`),
  INDEX `fk_Factura_Encabezado_has_FormaPago_FormaPago1_idx` (`FormaPago_idFormaPago` ASC),
  INDEX `fk_Factura_Encabezado_has_FormaPago_Factura_Encabezado1_idx` (`Factura_Encabezado_idFactura` ASC, `Factura_Encabezado_Cliente_idCliente` ASC, `Factura_Encabezado_Cliente_Persona_idPersona` ASC),
  CONSTRAINT `fk_Factura_Encabezado_has_FormaPago_Factura_Encabezado1`
    FOREIGN KEY (`Factura_Encabezado_idFactura` , `Factura_Encabezado_Cliente_idCliente` , `Factura_Encabezado_Cliente_Persona_idPersona`)
    REFERENCES `modelosistema`.`Factura_Encabezado` (`idFactura` , `Cliente_idCliente` , `Cliente_Persona_idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_Encabezado_has_FormaPago_FormaPago1`
    FOREIGN KEY (`FormaPago_idFormaPago`)
    REFERENCES `modelosistema`.`FormaPago` (`idFormaPago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`TipoContenedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`TipoContenedor` (
  `idTipoContenedor` INT NOT NULL AUTO_INCREMENT,
  `descripcion_tipocont` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoContenedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Contenedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Contenedor` (
  `idContenedor` INT NOT NULL AUTO_INCREMENT,
  `descripcion_cont` VARCHAR(45) NOT NULL,
  `TipoContenedor_idTipoContenedor` INT NOT NULL,
  PRIMARY KEY (`idContenedor`),
  INDEX `fk_Contenedor_TipoContenedor1_idx` (`TipoContenedor_idTipoContenedor` ASC),
  CONSTRAINT `fk_Contenedor_TipoContenedor1`
    FOREIGN KEY (`TipoContenedor_idTipoContenedor`)
    REFERENCES `modelosistema`.`TipoContenedor` (`idTipoContenedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Producto` (
  `idProducto` INT NOT NULL AUTO_INCREMENT,
  `nombre_producto` VARCHAR(45) NOT NULL,
  `fechaVencimiento` DATE NULL,
  `fechaElaboracion` DATE NULL,
  `precioCosto` DOUBLE NOT NULL,
  `precioVenta` DOUBLE NOT NULL,
  `precioOferta` DOUBLE NULL,
  `estado_producto` VARCHAR(1) NOT NULL,
  `cantidad` DOUBLE NOT NULL,
  `Contenedor_idContenedor` INT NOT NULL,
  PRIMARY KEY (`idProducto`),
  INDEX `fk_Producto_Contenedor1_idx` (`Contenedor_idContenedor` ASC),
  CONSTRAINT `fk_Producto_Contenedor1`
    FOREIGN KEY (`Contenedor_idContenedor`)
    REFERENCES `modelosistema`.`Contenedor` (`idContenedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`FacturaEncabezado_x_Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`FacturaEncabezado_x_Producto` (
  `Factura_Encabezado_idFactura` INT NOT NULL,
  `Factura_Encabezado_Cliente_idCliente` INT NOT NULL,
  `Factura_Encabezado_Cliente_Persona_idPersona` INT NOT NULL,
  `Producto_idProducto` INT NOT NULL,
  `cantidadcompra` DOUBLE NOT NULL,
  PRIMARY KEY (`Factura_Encabezado_idFactura`, `Factura_Encabezado_Cliente_idCliente`, `Factura_Encabezado_Cliente_Persona_idPersona`, `Producto_idProducto`),
  INDEX `fk_Factura_Encabezado_has_Producto_Producto1_idx` (`Producto_idProducto` ASC),
  INDEX `fk_Factura_Encabezado_has_Producto_Factura_Encabezado1_idx` (`Factura_Encabezado_idFactura` ASC, `Factura_Encabezado_Cliente_idCliente` ASC, `Factura_Encabezado_Cliente_Persona_idPersona` ASC),
  CONSTRAINT `fk_Factura_Encabezado_has_Producto_Factura_Encabezado1`
    FOREIGN KEY (`Factura_Encabezado_idFactura` , `Factura_Encabezado_Cliente_idCliente` , `Factura_Encabezado_Cliente_Persona_idPersona`)
    REFERENCES `modelosistema`.`Factura_Encabezado` (`idFactura` , `Cliente_idCliente` , `Cliente_Persona_idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_Encabezado_has_Producto_Producto1`
    FOREIGN KEY (`Producto_idProducto`)
    REFERENCES `modelosistema`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Proveedor` (
  `idProveedor` INT NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` VARCHAR(45) NOT NULL,
  `direccion_proveedor` VARCHAR(45) NOT NULL,
  `telefono_proveedor` VARCHAR(45) NOT NULL,
  `correo_proveedor` VARCHAR(45) NULL,
  `Persona_idPersona` INT NULL,
  PRIMARY KEY (`idProveedor`),
  INDEX `fk_Proveedor_Persona1_idx` (`Persona_idPersona` ASC),
  CONSTRAINT `fk_Proveedor_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `modelosistema`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Producto_x_Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Producto_x_Proveedor` (
  `Producto_idProducto` INT NOT NULL,
  `Proveedor_idProveedor` INT NOT NULL,
  `cantidad_ingreso` DOUBLE NOT NULL,
  `fecha_ingreso` DATE NOT NULL,
  PRIMARY KEY (`Producto_idProducto`, `Proveedor_idProveedor`),
  INDEX `fk_Producto_has_Proveedor_Proveedor1_idx` (`Proveedor_idProveedor` ASC),
  INDEX `fk_Producto_has_Proveedor_Producto1_idx` (`Producto_idProducto` ASC),
  CONSTRAINT `fk_Producto_has_Proveedor_Producto1`
    FOREIGN KEY (`Producto_idProducto`)
    REFERENCES `modelosistema`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_has_Proveedor_Proveedor1`
    FOREIGN KEY (`Proveedor_idProveedor`)
    REFERENCES `modelosistema`.`Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Sucursal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Sucursal` (
  `idSucursal` INT NOT NULL AUTO_INCREMENT,
  `nombre_sucursal` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `Ciudad_idCiudad` INT NOT NULL,
  `Ciudad_Departamento_idDepartamento` INT NOT NULL,
  PRIMARY KEY (`idSucursal`),
  INDEX `fk_Sucursal_Ciudad1_idx` (`Ciudad_idCiudad` ASC, `Ciudad_Departamento_idDepartamento` ASC),
  CONSTRAINT `fk_Sucursal_Ciudad1`
    FOREIGN KEY (`Ciudad_idCiudad` , `Ciudad_Departamento_idDepartamento`)
    REFERENCES `modelosistema`.`Ciudad` (`idCiudad` , `Departamento_idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Area` (
  `idArea` INT NOT NULL AUTO_INCREMENT,
  `nombre_area` VARCHAR(45) NOT NULL,
  `Sucursal_idSucursal` INT NOT NULL,
  PRIMARY KEY (`idArea`),
  INDEX `fk_Area_Sucursal1_idx` (`Sucursal_idSucursal` ASC),
  CONSTRAINT `fk_Area_Sucursal1`
    FOREIGN KEY (`Sucursal_idSucursal`)
    REFERENCES `modelosistema`.`Sucursal` (`idSucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Pasillo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Pasillo` (
  `idPasillo` INT NOT NULL AUTO_INCREMENT,
  `descripcion_pasillo` VARCHAR(45) NOT NULL,
  `Area_idArea` INT NOT NULL,
  PRIMARY KEY (`idPasillo`),
  INDEX `fk_Pasillo_Area1_idx` (`Area_idArea` ASC),
  CONSTRAINT `fk_Pasillo_Area1`
    FOREIGN KEY (`Area_idArea`)
    REFERENCES `modelosistema`.`Area` (`idArea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelosistema`.`Pasillo_x_Contenedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelosistema`.`Pasillo_x_Contenedor` (
  `Pasillo_idPasillo` INT NOT NULL,
  `Contenedor_idContenedor` INT NOT NULL,
  PRIMARY KEY (`Pasillo_idPasillo`, `Contenedor_idContenedor`),
  INDEX `fk_Pasillo_has_Contenedor_Contenedor1_idx` (`Contenedor_idContenedor` ASC),
  INDEX `fk_Pasillo_has_Contenedor_Pasillo1_idx` (`Pasillo_idPasillo` ASC),
  CONSTRAINT `fk_Pasillo_has_Contenedor_Pasillo1`
    FOREIGN KEY (`Pasillo_idPasillo`)
    REFERENCES `modelosistema`.`Pasillo` (`idPasillo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pasillo_has_Contenedor_Contenedor1`
    FOREIGN KEY (`Contenedor_idContenedor`)
    REFERENCES `modelosistema`.`Contenedor` (`idContenedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
