-- CREATE DATABASE cravings_2;
use cravings_2;

-- DROP TABLES // Drop the Main Table first then the subtype then the type
DROP TABLE IF EXISTS Beverage;
DROP TABLE IF EXISTS BeverageSubType;
DROP TABLE IF EXISTS BeverageType;
DROP TABLE IF EXISTS RiceMeal;
DROP TABLE IF EXISTS RiceMealSubType;
DROP TABLE IF EXISTS RiceMealType;
DROP TABLE IF EXISTS Snack;
DROP TABLE IF EXISTS SnackSubType;
DROP TABLE IF EXISTS SnackType;

-- CREATE TABLES
CREATE TABLE IF NOT EXISTS `BeverageType` (
  `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `BeverageSubType` (
  `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `beverage_type_id` int NOT NULL,
  CONSTRAINT `FK_BeverageType_BeverageSubType_id` FOREIGN KEY (`beverage_type_id`) REFERENCES `BeverageType` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `Beverage` (
  `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `beverage_type_id` int NOT NULL,
  `beverage_sub_type_id` int NULL,
  `stall_number` int DEFAULT NULL,
  CONSTRAINT FK_BeverageType_Beverage_id FOREIGN KEY (beverage_type_id) REFERENCES BeverageType (id),
  CONSTRAINT FK_BeverageSubType_Beverage_id FOREIGN KEY (beverage_sub_type_id) REFERENCES BeverageSubType (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `RiceMealType` (
  `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `RiceMealSubType` (
  `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `rice_meal_type_id` int NOT NULL,
  CONSTRAINT FK_RiceMealType_RiceMealSubType_id FOREIGN KEY (rice_meal_type_id) REFERENCES RiceMealType (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `RiceMeal` (
  `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `rice_meal_type_id` int NOT NULL,
  `rice_meal_sub_type_id` int NOT NULL,
  `stall_number` int DEFAULT NULL,
  CONSTRAINT FK_RiceMealType_RiceMeal_id FOREIGN KEY (rice_meal_type_id) REFERENCES RiceMealType (id),
  CONSTRAINT FK_RiceMealSubType_RiceMeal_id FOREIGN KEY (rice_meal_sub_type_id) REFERENCES RiceMealSubType (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `SnackType` (
  `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `SnackSubType` (
  `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `snack_type_id` int NOT NULL,
   CONSTRAINT FK_SnackType_SnackSubType_id FOREIGN KEY (snack_type_id) REFERENCES SnackType (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Snack` (
  `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `snack_type_id` int NOT NULL,
  `snack_sub_type_id` int NULL,
  `stall_number` int DEFAULT NULL,
  CONSTRAINT FK_SnackType_Snack_id FOREIGN KEY (snack_type_id) REFERENCES SnackType (id),
  CONSTRAINT FK_SnackSubType_Snack_id FOREIGN KEY (snack_sub_type_id) REFERENCES SnackSubType (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;