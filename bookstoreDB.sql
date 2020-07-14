CREATE DATABASE `Bookstore`;
USE Bookstore;

CREATE TABLE `bookstore`.`students` (
  `StudentID` INT NOT NULL,
  `Name` VARCHAR(50) NOT NULL,
  `Age` TINYINT(100) NULL,
  `Gender` BIT(1) NULL,
  PRIMARY KEY (`SborrowstudentID`));

CREATE TABLE `bookstore`.`books` (
  `BookID` INT NOT NULL,
  `Name` VARCHAR(50) NOT NULL,
  `TotalPage` INT NULL,
  `Type` VARCHAR(10) NULL,
  `Quantity` INT NOT NULL,
  PRIMARY KEY (`BookID`));

CREATE TABLE `bookstore`.`borrows` (
  `BorrowID` INT NOT NULL AUTO_INCREMENT,
  `StudentID` INT NOT NULL,
  `BookID` INT NOT NULL,
  PRIMARY KEY (`BorrowID`),
  CONSTRAINT `BorrowStudent`
    FOREIGN KEY (`StudentID`)
    REFERENCES `bookstore`.`students` (`StudentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `BorrowBook`
    FOREIGN KEY (`BookID`)
    REFERENCES `bookstore`.`books` (`BookID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

ALTER TABLE `bookstore`.`borrows` 
ADD COLUMN `Quantity` INT NOT NULL AFTER `BookID`;