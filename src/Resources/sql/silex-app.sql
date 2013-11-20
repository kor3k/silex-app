SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `school` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `school` ;

-- -----------------------------------------------------
-- Table `school`.`class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`class` (
  `id_class` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_class`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`student` (
  `id_student` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `id_class` INT UNSIGNED NULL,
  PRIMARY KEY (`id_student`),
  INDEX `student_id_class_idx` (`id_class` ASC),
  CONSTRAINT `student_id_class`
    FOREIGN KEY (`id_class`)
    REFERENCES `school`.`class` (`id_class`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`student_contact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`student_contact` (
  `id_student` INT UNSIGNED NOT NULL,
  `email` VARCHAR(255) NULL,
  `phone` VARCHAR(255) NULL,
  `address` VARCHAR(255) NULL,
  PRIMARY KEY (`id_student`),
  CONSTRAINT `student_contact_id_student`
    FOREIGN KEY (`id_student`)
    REFERENCES `school`.`student` (`id_student`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`teacher` (
  `id_teacher` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_teacher`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`tie_class_teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`tie_class_teacher` (
  `id_class` INT UNSIGNED NOT NULL,
  `id_teacher` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_class`, `id_teacher`),
  INDEX `tie_class_teacher_id_teacher_idx` (`id_teacher` ASC),
  CONSTRAINT `tie_class_teacher_id_class`
    FOREIGN KEY (`id_class`)
    REFERENCES `school`.`class` (`id_class`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `tie_class_teacher_id_teacher`
    FOREIGN KEY (`id_teacher`)
    REFERENCES `school`.`teacher` (`id_teacher`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
