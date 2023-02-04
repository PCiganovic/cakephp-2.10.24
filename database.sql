use cake_db;
CREATE TABLE `products` (
                            `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
                            `name` varchar(255) DEFAULT NULL,
                            `description` varchar(255) DEFAULT NULL,
                            `created` datetime DEFAULT NULL,
                            `modified` datetime DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE posts (
                       id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                       title VARCHAR(50),
                       body TEXT,
                       created DATETIME DEFAULT NULL,
                       modified DATETIME DEFAULT NULL
);

INSERT INTO posts (title, body, created)
VALUES ('The title', 'This is the post body.', NOW());
INSERT INTO posts (title, body, created)
VALUES ('A title once again', 'And the post body follows.', NOW());
INSERT INTO posts (title, body, created)
VALUES ('Title strikes back', 'This is really exciting! Not.', NOW());


/* set delimiter */
DELIMITER $$

/* remove procedure if exists... */
DROP PROCEDURE IF EXISTS insert_it $$

/* create procedure */
CREATE PROCEDURE insert_it ()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE varmax INT DEFAULT 123;
    DECLARE unixtime INT DEFAULT 688366892;

    WHILE i <= varmax DO
            INSERT INTO cake_db.products (id, name, description, created, modified) VALUES (i, concat('NR ' , i, ' item name'), concat('this is my description for item ', i ) , from_unixtime(unixtime), from_unixtime(unixtime));
            SET i = i + 1;
            SET unixtime = unixtime + 183;
        END WHILE;

END $$

/* reset delimiter back to normal */
DELIMITER ;

/* call procedure */
CALL insert_it();