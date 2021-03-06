CREATE SCHEMA `boku_no_hero_academia` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE `boku_no_hero_academia`.`classrooms` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`));
  
CREATE TABLE `boku_no_hero_academia`.`quirks` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `boku_no_hero_academia`.`teachers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `birthday` DATE NULL,
  `classroom_id` INT NOT NULL,
  `quirk_id` INT NOT NULL,
  PRIMARY KEY (`id`));
  
ALTER TABLE `boku_no_hero_academia`.`teachers` 
ADD INDEX `fk_teachers_1_idx` (`classroom_id` ASC);
ALTER TABLE `boku_no_hero_academia`.`teachers` 
ADD CONSTRAINT `fk_teachers_1`
  FOREIGN KEY (`classroom_id`)
  REFERENCES `boku_no_hero_academia`.`classrooms` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
ALTER TABLE `boku_no_hero_academia`.`teachers` 
ADD INDEX `fk_teachers_2_idx` (`quirk_id` ASC);
ALTER TABLE `boku_no_hero_academia`.`teachers` 
ADD CONSTRAINT `fk_teachers_2`
  FOREIGN KEY (`quirk_id`)
  REFERENCES `boku_no_hero_academia`.`quirks` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


CREATE TABLE `boku_no_hero_academia`.`heros` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `image` VARCHAR(255) NULL,
  `birthday` DATE NULL,
  `quirk_id` INT(11) NOT NULL,
  `classroom_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`));


ALTER TABLE `boku_no_hero_academia`.`heros` 
ADD INDEX `fk_heros_1_idx` (`classroom_id` ASC);
ALTER TABLE `boku_no_hero_academia`.`heros` 
ADD CONSTRAINT `fk_heros_1`
  FOREIGN KEY (`classroom_id`)
  REFERENCES `boku_no_hero_academia`.`classrooms` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  

ALTER TABLE `boku_no_hero_academia`.`heros` 
ADD INDEX `fk_heros_2_idx` (`quirk_id` ASC);
ALTER TABLE `boku_no_hero_academia`.`heros` 
ADD CONSTRAINT `fk_heros_2`
  FOREIGN KEY (`quirk_id`)
  REFERENCES `boku_no_hero_academia`.`quirks` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE TABLE `boku_no_hero_academia`.`authorities` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `boku_no_hero_academia`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(512) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `users_username_UNIQUE` (`username` ASC));

  CREATE TABLE `boku_no_hero_academia`.`user_authorities` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `authority_id` INT NOT NULL,
  PRIMARY KEY (`id`));

  ALTER TABLE `boku_no_hero_academia`.`user_authorities`
    ADD INDEX `fk_user_authorities_authority_idx` (`authority_id` ASC);
  ALTER TABLE `boku_no_hero_academia`.`user_authorities`
    ADD INDEX `fk_user_authorities_user_idx` (`user_id` ASC);

 ALTER TABLE `boku_no_hero_academia`.`user_authorities`
    ADD CONSTRAINT `fk_user_authorities_authority`
	  FOREIGN KEY (`authority_id`)
	  REFERENCES `boku_no_hero_academia`.`authorities` (`id`)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION;
	 
ALTER TABLE `boku_no_hero_academia`.`user_authorities`
    ADD CONSTRAINT `fk_user_authorities_user`
      FOREIGN KEY (`user_id`)
      REFERENCES `boku_no_hero_academia`.`users` (`id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;
      
INSERT INTO `boku_no_hero_academia`.`authorities` (`name`) VALUES ('ADMIN');

ALTER TABLE `boku_no_hero_academia`.`heros` 
ADD COLUMN `power` INT(11) NOT NULL DEFAULT 1 AFTER `classroom_id`;

