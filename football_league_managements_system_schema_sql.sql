-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema football_league_managements_system
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema football_league_managements_system
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `football_league_managements_system` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `football_league_managements_system` ;

-- -----------------------------------------------------
-- Table `football_league_managements_system`.`coach`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `football_league_managements_system`.`coach` (
  `coach_name` VARCHAR(200) NOT NULL,
  `coach_nationality` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`coach_name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `football_league_managements_system`.`stadium`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `football_league_managements_system`.`stadium` (
  `stadium_name` VARCHAR(200) NOT NULL,
  `stadium_city` VARCHAR(200) NOT NULL,
  `stadium_capacity` INT NOT NULL,
  PRIMARY KEY (`stadium_name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `football_league_managements_system`.`player`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `football_league_managements_system`.`player` (
  `player_name` VARCHAR(200) NOT NULL,
  `player_nationality` VARCHAR(200) NOT NULL,
  `player_position` VARCHAR(200) NOT NULL,
  `team_name` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`player_name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `football_league_managements_system`.`team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `football_league_managements_system`.`team` (
  `team_name` VARCHAR(200) NOT NULL,
  `coach_name` VARCHAR(200) NULL,
  `stadium_name` VARCHAR(200) NULL,
  `player_name` VARCHAR(200) NULL,
  PRIMARY KEY (`team_name`),
  INDEX `fk_team_coach_idx` (`coach_name` ASC) VISIBLE,
  INDEX `fk_team_stadium1_idx` (`stadium_name` ASC) VISIBLE,
  INDEX `fk_team_player1_idx` (`player_name` ASC) VISIBLE,
  CONSTRAINT `fk_team_coach`
    FOREIGN KEY (`coach_name`)
    REFERENCES `football_league_managements_system`.`coach` (`coach_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_team_stadium1`
    FOREIGN KEY (`stadium_name`)
    REFERENCES `football_league_managements_system`.`stadium` (`stadium_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_team_player1`
    FOREIGN KEY (`player_name`)
    REFERENCES `football_league_managements_system`.`player` (`player_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;