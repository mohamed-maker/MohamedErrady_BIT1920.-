-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `gender` INT NULL,
  `age_of_diagnosis` INT NULL,
  `patient_id` INT NOT NULL,
  PRIMARY KEY (`patient_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`patient_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`patient_info` (
  `patient_id` INT NOT NULL,
  `mutations_id` VARCHAR(45) NULL,
  PRIMARY KEY (`patient_id`),
  CONSTRAINT `paitnet`
    FOREIGN KEY (`patient_id`)
    REFERENCES `mydb`.`Patient` (`patient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`syndrome` (
  `syndrome_id` INT NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`syndrome_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Gene_affected`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gene_affected` (
  `gene_id` INT NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`gene_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Mutations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mutations` (
  `idMutations` INT NOT NULL,
  `gene_name` VARCHAR(45) NULL,
  `start` INT NULL,
  `end` INT NULL,
  `chromosome` INT NULL,
  `patient_name` VARCHAR(45) NULL,
  `patient_syndrome` VARCHAR(45) NULL,
  `syndrome_id` INT NULL,
  `gene_id` INT NULL,
  `patient_id` INT NULL,
  PRIMARY KEY (`idMutations`),
  INDEX `syndrome_idx` (`syndrome_id` ASC) VISIBLE,
  INDEX `affection_idx` (`gene_id` ASC) VISIBLE,
  CONSTRAINT `fk_Mutations_3`
    FOREIGN KEY ()
    REFERENCES `mydb`.`patient_info` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `syndrome`
    FOREIGN KEY (`syndrome_id`)
    REFERENCES `mydb`.`syndrome` (`syndrome_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `affection`
    FOREIGN KEY (`gene_id`)
    REFERENCES `mydb`.`Gene_affected` (`gene_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
