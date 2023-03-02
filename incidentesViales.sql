

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


CREATE SCHEMA IF NOT EXISTS `dbIncidentes` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `dbIncidentes` ;

-- -----------------------------------------------------
-- Table `dbIncidentes`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbIncidentes`.`Usuario` (
  `idUsuario` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidoP` VARCHAR(45) NOT NULL,
  `apellidoM` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  `numMovil` VARCHAR(12) NOT NULL,
  `status` INT NOT NULL,
  `tipoAgente` INT NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `dbIncidentes`.`Municipio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbIncidentes`.`Municipio` (
  `idMunicipio` VARCHAR(10) NOT NULL,
  `nombreMunicipio` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idMunicipio`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `dbIncidentes`.`Localidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbIncidentes`.`Localidad` (
  `idLocalidad` VARCHAR(10) NOT NULL,
  `nombreLocalidad` VARCHAR(45) NOT NULL,
  `municipio_idMunicipio` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idLocalidad`),
  INDEX `fk_Localidad_Municipio1_idx` (`municipio_idMunicipio` ASC) VISIBLE,
  CONSTRAINT `fk_Localidad_Municipio1`
    FOREIGN KEY (`municipio_idMunicipio`)
    REFERENCES `dbIncidentes`.`Municipio` (`idMunicipio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `dbIncidentes`.`Ubicacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbIncidentes`.`Ubicacion` (
  `idUbicacion` VARCHAR(10) NOT NULL,
  `calle` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  `latitud` DECIMAL(8) NOT NULL,
  `longitud` DECIMAL(8) NOT NULL,
  `Localidad_idLocalidad` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idUbicacion`),
  INDEX `fk_Ubicacion_Localidades1_idx` (`Localidad_idLocalidad` ASC) VISIBLE,
  CONSTRAINT `fk_Ubicacion_Localidades1`
    FOREIGN KEY (`Localidad_idLocalidad`)
    REFERENCES `dbIncidentes`.`Localidad` (`idLocalidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `dbIncidentes`.`TipoIncidente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbIncidentes`.`TipoIncidente` (
  `idTipoIncidente` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoIncidente`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `dbIncidentes`.`Superficie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbIncidentes`.`Superficie` (
  `idSuperficie` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idSuperficie`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `dbIncidentes`.`IncidenteVial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbIncidentes`.`IncidenteVial` (
  `idIncidente` VARCHAR(10) NOT NULL,
  `Usuario_idUsuario` VARCHAR(10) NOT NULL,
  `clasificacion` INT NOT NULL,
  `numPersonasF` INT NOT NULL,
  `numPersonasH` INT NOT NULL,
  `numPersonasI` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `hora` DATETIME NOT NULL,
  `Ubicacion_idUbicacion` VARCHAR(10) NOT NULL,
  `TipoIncidente_idTipoIncidente` VARCHAR(10) NOT NULL,
  `Superficie_idSuperficie` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idIncidente`),
  INDEX `fk_IncidenteVial_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  INDEX `fk_IncidenteVial_Ubicacion1_idx` (`Ubicacion_idUbicacion` ASC) VISIBLE,
  INDEX `fk_IncidenteVial_TipoIncidente1_idx` (`TipoIncidente_idTipoIncidente` ASC) VISIBLE,
  INDEX `fk_IncidenteVial_Superficie1_idx` (`Superficie_idSuperficie` ASC) VISIBLE,
  CONSTRAINT `fk_IncidenteVial_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `dbIncidentes`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_IncidenteVial_Ubicacion1`
    FOREIGN KEY (`Ubicacion_idUbicacion`)
    REFERENCES `dbIncidentes`.`Ubicacion` (`idUbicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_IncidenteVial_TipoIncidente1`
    FOREIGN KEY (`TipoIncidente_idTipoIncidente`)
    REFERENCES `dbIncidentes`.`TipoIncidente` (`idTipoIncidente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_IncidenteVial_Superficie1`
    FOREIGN KEY (`Superficie_idSuperficie`)
    REFERENCES `dbIncidentes`.`Superficie` (`idSuperficie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `dbIncidentes`.`PlacasTransporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbIncidentes`.`PlacasTransporte` (
  `idPlacasTransporte` VARCHAR(10) NOT NULL,
  `Placas` VARCHAR(8) NOT NULL,
  `consultaREPUVE` JSON NULL,
  PRIMARY KEY (`idPlacasTransporte`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `dbIncidentes`.`ModoTransporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbIncidentes`.`ModoTransporte` (
  `idModoTransporte` VARCHAR(10) NOT NULL,
  `modo` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idModoTransporte`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `dbIncidentes`.`Involucrado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbIncidentes`.`Involucrado` (
  `idInvolucrado` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apeidoP` VARCHAR(45) NOT NULL,
  `apeidoM` VARCHAR(45) NOT NULL,
  `sobriedad` TINYINT NOT NULL,
  `usoCinturon` TINYINT NOT NULL,
  `genero` TINYINT NOT NULL,
  `edad` INT NOT NULL,
  `consecuencias` INT NOT NULL,
  `tipoInvolucrado` INT NOT NULL,
  `incidenteVial_idIncidente` VARCHAR(10) NOT NULL,
  `placasTransporte_idPlacasTransporte` VARCHAR(10) NOT NULL,
  `modoTransporte_idModoTransporte` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idInvolucrado`),
  INDEX `fk_Involucrado_IncidenteVial_idx` (`incidenteVial_idIncidente` ASC) VISIBLE,
  INDEX `fk_Involucrado_placasTransporte1_idx` (`placasTransporte_idPlacasTransporte` ASC) VISIBLE,
  INDEX `fk_Involucrado_modoTransporte1_idx` (`modoTransporte_idModoTransporte` ASC) VISIBLE,
  CONSTRAINT `fk_Involucrado_IncidenteVial`
    FOREIGN KEY (`incidenteVial_idIncidente`)
    REFERENCES `dbIncidentes`.`IncidenteVial` (`idIncidente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Involucrado_placasTransporte1`
    FOREIGN KEY (`placasTransporte_idPlacasTransporte`)
    REFERENCES `dbIncidentes`.`PlacasTransporte` (`idPlacasTransporte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Involucrado_modoTransporte1`
    FOREIGN KEY (`modoTransporte_idModoTransporte`)
    REFERENCES `dbIncidentes`.`ModoTransporte` (`idModoTransporte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `dbIncidentes`.`Municipio`
-- -----------------------------------------------------
START TRANSACTION;
USE `dbIncidentes`;
INSERT INTO `dbIncidentes`.`Municipio` (`idMunicipio`, `nombreMunicipio`) VALUES ('MN01', 'Armeria');
INSERT INTO `dbIncidentes`.`Municipio` (`idMunicipio`, `nombreMunicipio`) VALUES ('MN02', 'Colima');
INSERT INTO `dbIncidentes`.`Municipio` (`idMunicipio`, `nombreMunicipio`) VALUES ('MN03', 'Comala');
INSERT INTO `dbIncidentes`.`Municipio` (`idMunicipio`, `nombreMunicipio`) VALUES ('MN04', 'Coquimatlán');
INSERT INTO `dbIncidentes`.`Municipio` (`idMunicipio`, `nombreMunicipio`) VALUES ('MN05', 'Cuauhtémoc');
INSERT INTO `dbIncidentes`.`Municipio` (`idMunicipio`, `nombreMunicipio`) VALUES ('MN06', 'Ixtlahuacán');
INSERT INTO `dbIncidentes`.`Municipio` (`idMunicipio`, `nombreMunicipio`) VALUES ('MN07', 'Manzanillo');
INSERT INTO `dbIncidentes`.`Municipio` (`idMunicipio`, `nombreMunicipio`) VALUES ('MN08', 'Minatitlán');
INSERT INTO `dbIncidentes`.`Municipio` (`idMunicipio`, `nombreMunicipio`) VALUES ('MN09', 'Tecomán');
INSERT INTO `dbIncidentes`.`Municipio` (`idMunicipio`, `nombreMunicipio`) VALUES ('MN10', 'Villa de Álvarez');


COMMIT;


-- -----------------------------------------------------
-- Data for table `dbIncidentes`.`Localidad`
-- -----------------------------------------------------
START TRANSACTION;
USE `dbIncidentes`;
INSERT INTO `dbIncidentes`.`Localidad` (`idLocalidad`, `nombreLocalidad`, `municipio_idMunicipio`) VALUES ('LC01', 'Ciudad de Armería', 'MN01');
INSERT INTO `dbIncidentes`.`Localidad` (`idLocalidad`, `nombreLocalidad`, `municipio_idMunicipio`) VALUES ('LC02', 'Cofradía de Juárez', 'MN01');
INSERT INTO `dbIncidentes`.`Localidad` (`idLocalidad`, `nombreLocalidad`, `municipio_idMunicipio`) VALUES ('LC03', 'Rincón de López', 'MN01');
INSERT INTO `dbIncidentes`.`Localidad` (`idLocalidad`, `nombreLocalidad`, `municipio_idMunicipio`) VALUES ('LC04', 'Augusto Gómez Villanueva', 'MN01');
INSERT INTO `dbIncidentes`.`Localidad` (`idLocalidad`, `nombreLocalidad`, `municipio_idMunicipio`) VALUES ('LC05', 'Cuyutlán', 'MN01');

INSERT INTO `dbIncidentes`.`Localidad` (`idLocalidad`, `nombreLocalidad`, `municipio_idMunicipio`) VALUES ('LC01', 'Ciudad de Armería', 'MN01');
INSERT INTO `dbIncidentes`.`Localidad` (`idLocalidad`, `nombreLocalidad`, `municipio_idMunicipio`) VALUES ('LC02', 'Cofradía de Juárez', 'MN01');
INSERT INTO `dbIncidentes`.`Localidad` (`idLocalidad`, `nombreLocalidad`, `municipio_idMunicipio`) VALUES ('LC03', 'Rincón de López', 'MN01');
INSERT INTO `dbIncidentes`.`Localidad` (`idLocalidad`, `nombreLocalidad`, `municipio_idMunicipio`) VALUES ('LC04', 'Augusto Gómez Villanueva', 'MN01');
INSERT INTO `dbIncidentes`.`Localidad` (`idLocalidad`, `nombreLocalidad`, `municipio_idMunicipio`) VALUES ('LC05', 'Cuyutlán', 'MN01');
COMMIT;
INSERT INTO `dbIncidentes`.`Localidad` (`idLocalidad`, `nombreLocalidad`, `municipio_idMunicipio`) VALUES ('LC06','Colima', 'MN02');
INSERT INTO `dbIncidentes`.`Localidad` (`idLocalidad`, `nombreLocalidad`, `municipio_idMunicipio`) VALUES ('LC07','Lo de Villa11​', 'MN02');
INSERT INTO `dbIncidentes`.`Localidad` (`idLocalidad`, `nombreLocalidad`, `municipio_idMunicipio`) VALUES ('LC08','Los Tepames', 'MN02');
INSERT INTO `dbIncidentes`.`Localidad` (`idLocalidad`, `nombreLocalidad`, `municipio_idMunicipio`) VALUES ('LC09','Piscila', 'MN02');
INSERT INTO `dbIncidentes`.`Localidad` (`idLocalidad`, `nombreLocalidad`, `municipio_idMunicipio`) VALUES ('LC10','El Chanal', 'MN02');
INSERT INTO `dbIncidentes`.`Localidad` (`idLocalidad`, `nombreLocalidad`, `municipio_idMunicipio`) VALUES ('LC11','Los Asmoles', 'MN02');
INSERT INTO `dbIncidentes`.`Localidad` (`idLocalidad`, `nombreLocalidad`, `municipio_idMunicipio`) VALUES ('LC12','Las Guásimas', 'MN02');
INSERT INTO `dbIncidentes`.`Localidad` (`idLocalidad`, `nombreLocalidad`, `municipio_idMunicipio`) VALUES ('LC13','Estampilla', 'MN02');
INSERT INTO `dbIncidentes`.`Localidad` (`idLocalidad`, `nombreLocalidad`, `municipio_idMunicipio`) VALUES ('LC14','Tinajas', 'MN02');
INSERT INTO `dbIncidentes`.`Localidad` (`idLocalidad`, `nombreLocalidad`, `municipio_idMunicipio`) VALUES ('LC15','Los Ortices', 'MN02');
INSERT INTO `dbIncidentes`.`Localidad` (`idLocalidad`, `nombreLocalidad`, `municipio_idMunicipio`) VALUES ('LC16','Loma de Juárez', 'MN02');
INSERT INTO `dbIncidentes`.`Localidad` (`idLocalidad`, `nombreLocalidad`, `municipio_idMunicipio`) VALUES ('LC17','La Estancia', 'MN02');
INSERT INTO `dbIncidentes`.`Localidad` (`idLocalidad`, `nombreLocalidad`, `municipio_idMunicipio`) VALUES ('LC18','La Pradera', 'MN02');

-- -----------------------------------------------------
-- Data for table `dbIncidentes`.`TipoIncidente`
-- -----------------------------------------------------
START TRANSACTION;
USE `dbIncidentes`;
INSERT INTO `dbIncidentes`.`TipoIncidente` (`idTipoIncidente`, `nombre`) VALUES ('TIN01', 'Colisión con vehículo automotor');
INSERT INTO `dbIncidentes`.`TipoIncidente` (`idTipoIncidente`, `nombre`) VALUES ('TIN02', 'Colisión con peatón');
INSERT INTO `dbIncidentes`.`TipoIncidente` (`idTipoIncidente`, `nombre`) VALUES ('TIN03', 'Colisión con animal');
INSERT INTO `dbIncidentes`.`TipoIncidente` (`idTipoIncidente`, `nombre`) VALUES ('TIN04', 'Colisión con objeto fijo');
INSERT INTO `dbIncidentes`.`TipoIncidente` (`idTipoIncidente`, `nombre`) VALUES ('TIN05', 'Volcadura');
INSERT INTO `dbIncidentes`.`TipoIncidente` (`idTipoIncidente`, `nombre`) VALUES ('TIN06', 'Caída de pasajero');
INSERT INTO `dbIncidentes`.`TipoIncidente` (`idTipoIncidente`, `nombre`) VALUES ('TIN07', 'Salida del camino');
INSERT INTO `dbIncidentes`.`TipoIncidente` (`idTipoIncidente`, `nombre`) VALUES ('TIN08', 'Incendio');
INSERT INTO `dbIncidentes`.`TipoIncidente` (`idTipoIncidente`, `nombre`) VALUES ('TIN09', 'Colisión con ferrocarril');
INSERT INTO `dbIncidentes`.`TipoIncidente` (`idTipoIncidente`, `nombre`) VALUES ('TIN10', 'Colisión con motocicleta');
INSERT INTO `dbIncidentes`.`TipoIncidente` (`idTipoIncidente`, `nombre`) VALUES ('TIN11', 'Colisión con ciclista');
INSERT INTO `dbIncidentes`.`TipoIncidente` (`idTipoIncidente`, `nombre`) VALUES ('TIN12', 'Colisión múltiple');
INSERT INTO `dbIncidentes`.`TipoIncidente` (`idTipoIncidente`, `nombre`) VALUES ('TIN13', 'Otro');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dbIncidentes`.`Superficie`
-- -----------------------------------------------------
START TRANSACTION;
USE `dbIncidentes`;
INSERT INTO `dbIncidentes`.`Superficie` (`idSuperficie`, `nombre`) VALUES ('SF01', 'Empedrado');
INSERT INTO `dbIncidentes`.`Superficie` (`idSuperficie`, `nombre`) VALUES ('SF02', 'Huellas de rodamiento');
INSERT INTO `dbIncidentes`.`Superficie` (`idSuperficie`, `nombre`) VALUES ('SF03', 'Adoquín');
INSERT INTO `dbIncidentes`.`Superficie` (`idSuperficie`, `nombre`) VALUES ('SF04', 'Concreto');
INSERT INTO `dbIncidentes`.`Superficie` (`idSuperficie`, `nombre`) VALUES ('SF05', 'Asfalto');
INSERT INTO `dbIncidentes`.`Superficie` (`idSuperficie`, `nombre`) VALUES ('SF06', 'Terracerpia');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dbIncidentes`.`ModoTransporte`
-- -----------------------------------------------------
START TRANSACTION;
USE `dbIncidentes`;
INSERT INTO `dbIncidentes`.`ModoTransporte` (`idModoTransporte`, `modo`) VALUES ('MT01', 'Automóvil');
INSERT INTO `dbIncidentes`.`ModoTransporte` (`idModoTransporte`, `modo`) VALUES ('MT02', 'Camioneta de Pasajeros');
INSERT INTO `dbIncidentes`.`ModoTransporte` (`idModoTransporte`, `modo`) VALUES ('MT03', 'Microbús');
INSERT INTO `dbIncidentes`.`ModoTransporte` (`idModoTransporte`, `modo`) VALUES ('MT04', 'Camión Urbano de Pasajeros');
INSERT INTO `dbIncidentes`.`ModoTransporte` (`idModoTransporte`, `modo`) VALUES ('MT05', 'Ómnibus');
INSERT INTO `dbIncidentes`.`ModoTransporte` (`idModoTransporte`, `modo`) VALUES ('MT07', 'Camioneta de Carga');
INSERT INTO `dbIncidentes`.`ModoTransporte` (`idModoTransporte`, `modo`) VALUES ('MT08', 'Camión de carga');
INSERT INTO `dbIncidentes`.`ModoTransporte` (`idModoTransporte`, `modo`) VALUES ('MT09', 'Tractor');
INSERT INTO `dbIncidentes`.`ModoTransporte` (`idModoTransporte`, `modo`) VALUES ('MT10', 'Ferrocarril');
INSERT INTO `dbIncidentes`.`ModoTransporte` (`idModoTransporte`, `modo`) VALUES ('MT11', 'Motocicleta');
INSERT INTO `dbIncidentes`.`ModoTransporte` (`idModoTransporte`, `modo`) VALUES ('MT12', 'Bicicleta');
INSERT INTO `dbIncidentes`.`ModoTransporte` (`idModoTransporte`, `modo`) VALUES ('MT13', 'Peatón');
INSERT INTO `dbIncidentes`.`ModoTransporte` (`idModoTransporte`, `modo`) VALUES ('MT14', 'Otro');

COMMIT;

