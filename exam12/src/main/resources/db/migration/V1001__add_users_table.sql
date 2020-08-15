use `exam12`;


CREATE TABLE `users`
(
    `id`        int auto_increment NOT NULL,
    `name`      varchar(128)       NOT NULL,
    `email`     varchar(128)       NOT NULL,
    `password`  varchar(128)       NOT NULL,
    `enabled`   boolean            NOT NULL default true,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `email_unique` (`email` ASC)
);

CREATE TABLE `user_role`
(
    `user_id` int(11) NOT NULL,
    `roles`   varchar(255) DEFAULT NULL,
    KEY `FKj345gk1bovqvfame88rcx7yyx` (`user_id`),
    CONSTRAINT `FKj345gk1bovqvfame88rcx7yyx` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);