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
  `Telefono` VARCHAR(45) NULL DEFAULT NULL ,
  `Email` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`Clave`) )
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
  `Creditos` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`Clave`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `gea-edu`.`HorarioM`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gea-edu`.`HorarioM` (
  `idHorarioM` VARCHAR(15) NOT NULL ,
  `Dia` DATE NULL ,
  `Hora` TIME NULL ,
  `Catedratico_Clave` VARCHAR(30) NOT NULL ,
  `Materia_Clave` VARCHAR(30) NOT NULL ,
  `Materia_Horario_idHorario` VARCHAR(12) NOT NULL ,
  PRIMARY KEY (`idHorarioM`, `Catedratico_Clave`, `Materia_Clave`, `Materia_Horario_idHorario`) ,
  INDEX `fk_HorarioM_Catedratico1` (`Catedratico_Clave` ASC) ,
  INDEX `fk_HorarioM_Materia1` (`Materia_Clave` ASC, `Materia_Horario_idHorario` ASC) ,
  CONSTRAINT `fk_HorarioM_Catedratico1`
    FOREIGN KEY (`Catedratico_Clave` )
    REFERENCES `gea-edu`.`Catedratico` (`Clave` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_HorarioM_Materia1`
    FOREIGN KEY (`Materia_Clave` , `Materia_Horario_idHorario` )
    REFERENCES `gea-edu`.`Materia` (`Clave` , `Horario_idHorario` )
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
  `Telefono` VARCHAR(45) NULL DEFAULT NULL ,
  `Email` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`Numero_de_cuenta`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `gea-edu`.`HorarioA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gea-edu`.`HorarioA` (
  `idHorarioA` VARCHAR(15) NOT NULL ,
  `Dia` DATE NOT NULL ,
  `Hora` TIME NOT NULL ,
  `Alumno_Numero_de_cuenta` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`idHorarioA`, `Alumno_Numero_de_cuenta`) ,
  INDEX `fk_HorarioA_Alumno` (`Alumno_Numero_de_cuenta` ASC) ,
  CONSTRAINT `fk_HorarioA_Alumno`
    FOREIGN KEY (`Alumno_Numero_de_cuenta` )
    REFERENCES `gea-edu`.`Alumno` (`Numero_de_cuenta` )
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
  `HorarioM_idHorarioM` INT NOT NULL ,
  `HorarioM_Catedratico_Clave` VARCHAR(30) NOT NULL ,
  `HorarioM_Materia_Clave` VARCHAR(30) NOT NULL ,
  `HorarioM_Materia_Horario_idHorario` VARCHAR(12) NOT NULL ,
  `HorarioA_idHorarioA` INT NOT NULL ,
  `HorarioA_Alumno_Numero_de_cuenta` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`idGrupo`, `HorarioM_idHorarioM`, `HorarioM_Catedratico_Clave`, `HorarioM_Materia_Clave`, `HorarioM_Materia_Horario_idHorario`, `HorarioA_idHorarioA`, `HorarioA_Alumno_Numero_de_cuenta`) ,
  INDEX `fk_Grupo_HorarioM1` (`HorarioM_idHorarioM` ASC, `HorarioM_Catedratico_Clave` ASC, `HorarioM_Materia_Clave` ASC, `HorarioM_Materia_Horario_idHorario` ASC) ,
  INDEX `fk_Grupo_HorarioA1` (`HorarioA_idHorarioA` ASC, `HorarioA_Alumno_Numero_de_cuenta` ASC) ,
  CONSTRAINT `fk_Grupo_HorarioM1`
    FOREIGN KEY (`HorarioM_idHorarioM` , `HorarioM_Catedratico_Clave` , `HorarioM_Materia_Clave` , `HorarioM_Materia_Horario_idHorario` )
    REFERENCES `gea-edu`.`HorarioM` (`idHorarioM` , `Catedratico_Clave` , `Materia_Clave` , `Materia_Horario_idHorario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Grupo_HorarioA1`
    FOREIGN KEY (`HorarioA_idHorarioA` , `HorarioA_Alumno_Numero_de_cuenta` )
    REFERENCES `gea-edu`.`HorarioA` (`idHorarioA` , `Alumno_Numero_de_cuenta` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
