SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
CREATE SCHEMA IF NOT EXISTS `Geaedu` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `mydb` ;
USE `Geaedu` ;

-- -----------------------------------------------------
-- Table `Geaedu`.`Tabla_Alumno`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Geaedu`.`Tabla_Alumno` (
  `ncuenta` VARCHAR(12) NOT NULL ,
  `nombre` VARCHAR(45) NULL DEFAULT NULL ,
  `a_paterno` VARCHAR(45) NULL DEFAULT NULL ,
  `a_materno` VARCHAR(45) NULL DEFAULT NULL ,
  `edad` VARCHAR(45) NULL DEFAULT NULL ,
  `telefono` VARCHAR(45) NULL DEFAULT NULL ,
  `email` VARCHAR(45) NULL DEFAULT NULL ,
  `genero` VARCHAR(45) NULL DEFAULT NULL ,
  `calle` VARCHAR(45) NULL DEFAULT NULL ,
  `colonia` VARCHAR(45) NULL DEFAULT NULL ,
  `municipio` VARCHAR(45) NULL DEFAULT NULL ,
  `estado` VARCHAR(45) NULL DEFAULT NULL ,
  `codigop` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`ncuenta`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `Geaedu`.`Tabla_Materia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Geaedu`.`Tabla_Materia` (
  `id_materia` VARCHAR(15) NOT NULL ,
  `nombre` VARCHAR(45) NULL DEFAULT NULL ,
  `semestre` VARCHAR(45) NULL DEFAULT NULL ,
  `curso` VARCHAR(45) NULL DEFAULT NULL ,
  `grupo` VARCHAR(45) NULL ,
  `docente` VARCHAR(45) NULL ,
  PRIMARY KEY (`id_materia`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `Geaedu`.`Tabla_Grupo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Geaedu`.`Tabla_Grupo` (
  `id_grupo` INT NOT NULL ,
  `nombre` VARCHAR(45) NULL DEFAULT NULL ,
  `cupo` INT NULL DEFAULT NULL ,
  `Tabla_Materia_id_materia` VARCHAR(15) NOT NULL ,
  `semestre` INT NULL ,
  PRIMARY KEY (`id_grupo`, `Tabla_Materia_id_materia`) ,
  INDEX `fk_Tabla_Grupo_Tabla_Materia1` (`Tabla_Materia_id_materia` ASC) ,
  CONSTRAINT `fk_Tabla_Grupo_Tabla_Materia1`
    FOREIGN KEY (`Tabla_Materia_id_materia` )
    REFERENCES `Geaedu`.`Tabla_Materia` (`id_materia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `Geaedu`.`Tabla_Horario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Geaedu`.`Tabla_Horario` (
  `idhorario` INT NOT NULL ,
  `idmateria` INT NOT NULL ,
  `lunes` TIME NULL DEFAULT NULL ,
  `martes` TIME NULL DEFAULT NULL ,
  `miercoles` TIME NULL DEFAULT NULL ,
  `jueves` TIME NULL DEFAULT NULL ,
  `viernes` VARCHAR(45) NULL DEFAULT NULL ,
  `Tabla_Grupo_id_grupo` INT NOT NULL ,
  `Tabla_Materia_id_materia` VARCHAR(15) NOT NULL ,
  PRIMARY KEY (`Tabla_Grupo_id_grupo`, `idhorario`, `idmateria`, `Tabla_Materia_id_materia`) ,
  INDEX `fk_Tabla_Horario_Tabla_Grupo1` (`Tabla_Grupo_id_grupo` ASC) ,
  INDEX `fk_Tabla_Horario_Tabla_Materia1` (`Tabla_Materia_id_materia` ASC) ,
  CONSTRAINT `fk_Tabla_Horario_Tabla_Grupo1`
    FOREIGN KEY (`Tabla_Grupo_id_grupo` )
    REFERENCES `Geaedu`.`Tabla_Grupo` (`id_grupo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tabla_Horario_Tabla_Materia1`
    FOREIGN KEY (`Tabla_Materia_id_materia` )
    REFERENCES `Geaedu`.`Tabla_Materia` (`id_materia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `Geaedu`.`Registro_Alumno`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Geaedu`.`Registro_Alumno` (
  `idRegistro` INT NOT NULL ,
  `Tabla_Alumno_ncuenta` VARCHAR(12) NOT NULL ,
  `Tabla_Grupo_id_grupo` INT NOT NULL ,
  PRIMARY KEY (`idRegistro`, `Tabla_Alumno_ncuenta`, `Tabla_Grupo_id_grupo`) ,
  INDEX `fk_Registro_Alumno_Tabla_Alumno` (`Tabla_Alumno_ncuenta` ASC) ,
  INDEX `fk_Registro_Alumno_Tabla_Grupo1` (`Tabla_Grupo_id_grupo` ASC) ,
  CONSTRAINT `fk_Registro_Alumno_Tabla_Alumno`
    FOREIGN KEY (`Tabla_Alumno_ncuenta` )
    REFERENCES `Geaedu`.`Tabla_Alumno` (`ncuenta` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registro_Alumno_Tabla_Grupo1`
    FOREIGN KEY (`Tabla_Grupo_id_grupo` )
    REFERENCES `Geaedu`.`Tabla_Grupo` (`id_grupo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `Geaedu`.`Horarios_chavales`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Geaedu`.`Horarios_chavales` (
  `idalumno` INT NOT NULL ,
  `idmateria` VARCHAR(45) NULL ,
  `lunes` DATE NULL ,
  `martes` DATE NULL ,
  `miercoles` DATE NULL ,
  `jueves` DATE NULL ,
  `viernes` DATE NULL ,
  `Tabla_Alumno_ncuenta` VARCHAR(12) NOT NULL ,
  `Tabla_Materia_id_materia` VARCHAR(15) NOT NULL ,
  PRIMARY KEY (`idalumno`, `Tabla_Alumno_ncuenta`, `Tabla_Materia_id_materia`) ,
  INDEX `fk_Horarios_chavales_Tabla_Alumno1` (`Tabla_Alumno_ncuenta` ASC) ,
  INDEX `fk_Horarios_chavales_Tabla_Materia1` (`Tabla_Materia_id_materia` ASC) ,
  CONSTRAINT `fk_Horarios_chavales_Tabla_Alumno1`
    FOREIGN KEY (`Tabla_Alumno_ncuenta` )
    REFERENCES `Geaedu`.`Tabla_Alumno` (`ncuenta` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Horarios_chavales_Tabla_Materia1`
    FOREIGN KEY (`Tabla_Materia_id_materia` )
    REFERENCES `Geaedu`.`Tabla_Materia` (`id_materia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
