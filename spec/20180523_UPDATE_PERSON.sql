ALTER TABLE `moveup`.`person`
ADD COLUMN `address2` VARCHAR(255)  NOT NULL DEFAULT "" AFTER `address`,
ADD COLUMN `address3` VARCHAR(255)  NOT NULL DEFAULT "" AFTER `address2`;