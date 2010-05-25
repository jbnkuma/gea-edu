SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `Gea-edu` ;
CREATE SCHEMA IF NOT EXISTS `Gea-edu` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
SHOW WARNINGS;
USE `Gea-edu`;

-- -----------------------------------------------------
-- Table `Gea-edu`.`Tabla_Alumno`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Gea-edu`.`Tabla_Alumno` (
  `ncuenta` VARCHAR(12) NOT NULL ,
  `nombre` VARCHAR(45) NULL ,
  `a_paterno` VARCHAR(45) NULL ,
  `a_materno` VARCHAR(45) NULL ,
  `edad` VARCHAR(45) NULL ,
  `telefono` VARCHAR(45) NULL ,
  `email` VARCHAR(45) NULL ,
  `genero` VARCHAR(45) NULL ,
  PRIMARY KEY (`ncuenta`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Gea-edu`.`Tabla_Materia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Gea-edu`.`Tabla_Materia` (
  `id_materia` VARCHAR(15) NOT NULL ,
  `nombre` VARCHAR(45) NULL ,
  `semestre` VARCHAR(45) NULL ,
  `curso` VARCHAR(45) NULL ,
  PRIMARY KEY (`id_materia`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Gea-edu`.`Tabla_Grupo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Gea-edu`.`Tabla_Grupo` (
  `id_grupo` INT NOT NULL ,
  `nombre` VARCHAR(45) NULL ,
  `cupo` INT NULL ,
  `Tabla_Materia_id_materia` VARCHAR(15) NOT NULL ,
  PRIMARY KEY (`id_grupo`, `Tabla_Materia_id_materia`) ,
  INDEX `fk_Tabla_Grupo_Tabla_Materia1` (`Tabla_Materia_id_materia` ASC) ,
  CONSTRAINT `fk_Tabla_Grupo_Tabla_Materia1`
    FOREIGN KEY (`Tabla_Materia_id_materia` )
    REFERENCES `Gea-edu`.`Tabla_Materia` (`id_materia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Gea-edu`.`Tabla_Horario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Gea-edu`.`Tabla_Horario` (
  `idhorario` INT NOT NULL ,
  `lunes` TIME NULL ,
  `martes` TIME NULL ,
  `miercoles` TIME NULL ,
  `jueves` TIME NULL ,
  `viernes` VARCHAR(45) NULL ,
  `Tabla_Grupo_id_grupo` INT NOT NULL ,
  PRIMARY KEY (`Tabla_Grupo_id_grupo`, `idhorario`) ,
  INDEX `fk_Tabla_Horario_Tabla_Grupo1` (`Tabla_Grupo_id_grupo` ASC) ,
  CONSTRAINT `fk_Tabla_Horario_Tabla_Grupo1`
    FOREIGN KEY (`Tabla_Grupo_id_grupo` )
    REFERENCES `Gea-edu`.`Tabla_Grupo` (`id_grupo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Gea-edu`.`Registro_Alumno`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Gea-edu`.`Registro_Alumno` (
  `idRegistro` INT NOT NULL ,
  `Tabla_Alumno_ncuenta` VARCHAR(12) NOT NULL ,
  `Tabla_Grupo_id_grupo` INT NOT NULL ,
  PRIMARY KEY (`idRegistro`, `Tabla_Alumno_ncuenta`, `Tabla_Grupo_id_grupo`) ,
  INDEX `fk_Registro_Alumno_Tabla_Alumno` (`Tabla_Alumno_ncuenta` ASC) ,
  INDEX `fk_Registro_Alumno_Tabla_Grupo1` (`Tabla_Grupo_id_grupo` ASC) ,
  CONSTRAINT `fk_Registro_Alumno_Tabla_Alumno`
    FOREIGN KEY (`Tabla_Alumno_ncuenta` )
    REFERENCES `Gea-edu`.`Tabla_Alumno` (`ncuenta` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registro_Alumno_Tabla_Grupo1`
    FOREIGN KEY (`Tabla_Grupo_id_grupo` )
    REFERENCES `Gea-edu`.`Tabla_Grupo` (`id_grupo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

SHOW WARNINGS;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
