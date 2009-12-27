SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `gea-edu` ;
CREATE SCHEMA IF NOT EXISTS `gea-edu` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `gea-edu`;

-- -----------------------------------------------------
-- Table `gea-edu`.`Catedratico`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gea-edu`.`Catedratico` (
  `Clave` VARCHAR(30) NOT NULL ,
  `Nombre` VARCHAR(45) NOT NULL ,
  `Apeido_Paterno` VARCHAR(45) NOT NULL ,
  `Apeido_Materno` VARCHAR(45) NOT NULL ,
  `Hora_entrda` VARCHAR(45) NOT NULL ,
  `Hora_salida` VARCHAR(45) NOT NULL ,
  `Telefono` VARCHAR(45) NULL ,
  `Email` VARCHAR(45) NULL ,
  PRIMARY KEY (`Clave`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `gea-edu`.`Horario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gea-edu`.`Horario` (
  `idHorario` VARCHAR(12) NOT NULL ,
  `Catedratico_Clave` VARCHAR(30) NOT NULL ,
  PRIMARY KEY (`idHorario`, `Catedratico_Clave`) ,
  INDEX `fk_Horario_Catedratico1` (`Catedratico_Clave` ASC) ,
  CONSTRAINT `fk_Horario_Catedratico1`
    FOREIGN KEY (`Catedratico_Clave` )
    REFERENCES `gea-edu`.`Catedratico` (`Clave` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `gea-edu`.`Grupo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gea-edu`.`Grupo` (
  `idGrupo` VARCHAR(10) NOT NULL ,
  `Semestre` VARCHAR(45) NOT NULL ,
  `Horario_idHorario` VARCHAR(12) NOT NULL ,
  PRIMARY KEY (`idGrupo`, `Horario_idHorario`) ,
  INDEX `fk_Grupo_Horario1` (`Horario_idHorario` ASC) ,
  CONSTRAINT `fk_Grupo_Horario1`
    FOREIGN KEY (`Horario_idHorario` )
    REFERENCES `gea-edu`.`Horario` (`idHorario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `gea-edu`.`Alumno`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gea-edu`.`Alumno` (
  `Numero_de_cuenta` VARCHAR(10) NOT NULL ,
  `Apeido_Paterno` VARCHAR(45) NOT NULL ,
  `Apeido_Materno` VARCHAR(45) NOT NULL ,
  `Telefono` VARCHAR(45) NULL ,
  `Email` VARCHAR(45) NULL ,
  `Grupo_idGrupo` VARCHAR(10) NOT NULL ,
  `Grupo_Horario_idHorario` VARCHAR(12) NOT NULL ,
  `Grupo_Horario_Catedratico_Clave` VARCHAR(30) NOT NULL ,
  PRIMARY KEY (`Numero_de_cuenta`, `Grupo_idGrupo`, `Grupo_Horario_idHorario`, `Grupo_Horario_Catedratico_Clave`) ,
  INDEX `fk_Alumno_Grupo1` (`Grupo_idGrupo` ASC, `Grupo_Horario_idHorario` ASC, `Grupo_Horario_Catedratico_Clave` ASC) ,
  CONSTRAINT `fk_Alumno_Grupo1`
    FOREIGN KEY (`Grupo_idGrupo` , `Grupo_Horario_idHorario` , `Grupo_Horario_Catedratico_Clave` )
    REFERENCES `gea-edu`.`Grupo` (`idGrupo` , `Horario_idHorario` , `Horario_Catedratico_Clave` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `gea-edu`.`Materia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gea-edu`.`Materia` (
  `Clave` VARCHAR(30) NOT NULL ,
  `Nombre` VARCHAR(45) NOT NULL ,
  `Semestre` VARCHAR(45) NOT NULL ,
  `Creditos` VARCHAR(45) NULL ,
  `Horario_idHorario` VARCHAR(12) NOT NULL ,
  PRIMARY KEY (`Clave`, `Horario_idHorario`) ,
  INDEX `fk_Materia_Horario1` (`Horario_idHorario` ASC) ,
  CONSTRAINT `fk_Materia_Horario1`
    FOREIGN KEY (`Horario_idHorario` )
    REFERENCES `gea-edu`.`Horario` (`idHorario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
