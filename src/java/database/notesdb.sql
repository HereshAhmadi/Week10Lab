DROP SCHEMA IF EXISTS `notesdb`;
CREATE SCHEMA IF NOT EXISTS `notesdb` DEFAULT CHARACTER SET latin1;
USE `notesdb`;

CREATE TABLE IF NOT EXISTS `notesdb`.`role` (
  `role_id` INT(11) NOT NULL,
  `role_name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`role_id`));

INSERT INTO `notesdb`.`role`(`role_id`,`role_name`)
VALUES
(1, 'system admin'),
(2, 'regular user');
COMMIT;

CREATE TABLE IF NOT EXISTS `notesdb`.`user` (
  `email` VARCHAR(40) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `first_name` VARCHAR(20),
  `last_name` VARCHAR(20),
  `active` TINYINT(1) NOT NULL DEFAULT '1',
  `role` INT(11) NOT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `fk_user_role`
    FOREIGN KEY (`role`)
    REFERENCES `notesdb`.`role` (`role_id`)
);

INSERT INTO `notesdb`.`user`(`email`,`password`,`first_name`,`last_name`,`role`)
VALUES
('sait.cprg.352+admin@gmail.com','password', 'Admin', null,1),
('sait.cprg.352+anne@gmail.com','password','Anne','Teak',2),
('sait.cprg.352+matilda@gmail.com','password','Matilda','Keybroke',2),
('sait.cprg.352+jerry@gmail.com','password','Jerry','Atrick',2),
('sait.cprg.352+anita@gmail.com','password','Anita','Knapp',2),
('sait.cprg.352+billy@gmail.com','password','Billy','Maizear',2),
('sait.cprg.352+patty@gmail.com','password','Patrick','O''Furniture',2);
COMMIT;

CREATE TABLE `notesdb`.`note` (
  `note_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `contents` varchar(20000) CHARACTER SET utf8 NOT NULL,
  `owner` varchar(40) NOT NULL,
  PRIMARY KEY (`note_id`),
  KEY `FK_Note_User` (`owner`),
  CONSTRAINT `FK_Note_User`
    FOREIGN KEY (`owner`)
    REFERENCES `notesdb`.`user` (`email`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO `notesdb`.`note`(`title`,`contents`,`owner`)
VALUES
('Quote #1', 'Writing is nature''s way of letting you know how sloppy your thinking is.', 'sait.cprg.352+anne@gmail.com'),
('Another Quote', '"Java is to JavaScript as ham is to hamster." -  Jeremy Keith', 'sait.cprg.352+anne@gmail.com' ),
('Matilda''s Note', 'I do not want Anne reading this note. She stole my broccoli casserole recipe 8 years ago and claimed it was hers.','sait.cprg.352+matilda@gmail.com');
COMMIT;