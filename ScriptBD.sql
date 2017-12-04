-- MySQL Workbench Forward Engineering
-- -----------------------------------------------------
-- Projeto: Vegs
-- Autora: 
-- Aline Dominique
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Database `vegs`
-- -----------------------------------------------------
DROP DATABASE IF EXISTS `vegs`;
CREATE DATABASE IF NOT EXISTS `vegs` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `vegs`;

-- -----------------------------------------------------
-- Table `Categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Categoria` ;

CREATE TABLE IF NOT EXISTS `Categoria` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`idCategoria`));

-- -----------------------------------------------------
-- Table `Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Usuario` ;

CREATE TABLE IF NOT EXISTS `Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(200) NOT NULL,
  `Email` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC));

-- -----------------------------------------------------
-- Table `Receita`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Receita` ;

CREATE TABLE IF NOT EXISTS `Receita` (
  `idReceita` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NOT NULL,
  `TempoPreparo` VARCHAR(100) NOT NULL,
  `Porcoes` VARCHAR(100) NOT NULL,
  `ModoPreparo` VARCHAR(3000) NOT NULL,
  `Dicas` VARCHAR(1000) NULL,
  `Foto` VARCHAR(5000) NULL,
  `idCategoria` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idReceita`),
  INDEX `fk_Receita_Categoria1_idx` (`idCategoria` ASC),
  INDEX `fk_Receita_Usuario1_idx` (`idUsuario` ASC),
  CONSTRAINT `fk_Receita_Categoria1`
    FOREIGN KEY (`idCategoria`)
    REFERENCES `Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Receita_Usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Usuario` (`idUsuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Table `Ingrediente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Ingrediente` ;

CREATE TABLE IF NOT EXISTS `Ingrediente` (
  `idIngrediente` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(200) NOT NULL,
  `Quantidade` VARCHAR(45) NOT NULL,
  `UnidMedida` VARCHAR(45) NOT NULL,
  `idReceita` INT NOT NULL,
  PRIMARY KEY (`idIngrediente`),
  INDEX `fk_Ingrediente_Receita1_idx` (`idReceita` ASC),
  CONSTRAINT `fk_Ingrediente_Receita1`
    FOREIGN KEY (`idReceita`)
    REFERENCES `Receita` (`idReceita`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Table `Favorito`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Favorito` ;

CREATE TABLE IF NOT EXISTS `Favorito` (
  `idFavorito` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  `idReceita` INT NOT NULL,
  INDEX `fk_Favorito_Usuario1_idx` (`idUsuario` ASC),
  INDEX `fk_Favorito_Receita1_idx` (`idReceita` ASC),
  PRIMARY KEY (`idFavorito`),
  CONSTRAINT `fk_Favorito_Usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Usuario` (`idUsuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Favorito_Receita1`
    FOREIGN KEY (`idReceita`)
    REFERENCES `Receita` (`idReceita`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
	
-- -----------------------------------------------------
-- Table `Foto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Foto` ;

CREATE TABLE IF NOT EXISTS `Foto` (
  `idFoto` INT NOT NULL,
  `Caminho` VARCHAR(5000) NULL,
  `idReceita` INT NOT NULL,
  PRIMARY KEY (`idFoto`),
  INDEX `fk_Foto_Receita1_idx` (`idReceita` ASC),
  CONSTRAINT `fk_Foto_Receita1`
    FOREIGN KEY (`idReceita`)
    REFERENCES `Receita` (`idReceita`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

