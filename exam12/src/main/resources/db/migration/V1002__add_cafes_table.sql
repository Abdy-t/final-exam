use `exam12`;


CREATE TABLE `cafes`
(
    `id`           INT          NOT NULL AUTO_INCREMENT,
    `title`        VARCHAR(128) NOT NULL,
    `description`  VARCHAR(255),
    `rating`       FLOAT        NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `images`
(
    `id` INT NOT NULL AUTO_INCREMENT,
    `path` VARCHAR(255) NOT NULL,
    `cafe_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `cafe_fk` FOREIGN KEY (`cafe_id`) REFERENCES `cafes`(`id`)
);

CREATE TABLE `reviews`
(
    `id` INT NOT NULL AUTO_INCREMENT,
    `text` VARCHAR(255) NOT NULL,
    `date` VARCHAR(255) NOT NULL,
    `rating` FLOAT NOT NULL,
    `user_name` VARCHAR(255) NOT NULL,
    `user_id` INT NOT NULL,
    `cafe_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `user_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    CONSTRAINT `cafe_frk` FOREIGN KEY (`cafe_id`) REFERENCES `cafes`(`id`)
);