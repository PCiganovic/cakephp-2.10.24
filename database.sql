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
                       category_id INT NOT NULL,
                       title VARCHAR(50),
                       body TEXT,
                       author_id INT NOT NULL ,
                       created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                       modified_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO posts (title, category_id, body, author_id, created_at)
VALUES ('The title number one', 1, 'Sed efficitur libero sit amet tortor condimentum, vel aliquam nisl egestas.
Curabitur et eleifend lectus. Nam facilisis odio sit amet aliquet ultrices. Maecenas finibus pellentesque tortor
facilisis porta. In tellus libero, pellentesque sed convallis cursus, elementum sed velit. Vivamus nec metus eros.
Phasellus faucibus sem risus, quis tristique tortor semper nec. Proin tristique ac nibh id commodo. Vivamus
consectetur tortor nec ornare vestibulum.', 1,  NOW());
INSERT INTO posts (title, category_id, body, author_id, created_at)
VALUES ('The title number two', 1, 'Sed efficitur libero sit amet tortor condimentum, vel aliquam nisl egestas.
Curabitur et eleifend lectus. Nam facilisis odio sit amet aliquet ultrices. Maecenas finibus pellentesque tortor
facilisis porta. In tellus libero, pellentesque sed convallis cursus, elementum sed velit. Vivamus nec metus eros.
Phasellus faucibus sem risus, quis tristique tortor semper nec. Proin tristique ac nibh id commodo. Vivamus
consectetur tortor nec ornare vestibulum.', 2,  NOW());
INSERT INTO posts (title, category_id, body, author_id, created_at)
VALUES ('The title number three', 1, 'Sed efficitur libero sit amet tortor condimentum, vel aliquam nisl egestas.
Curabitur et eleifend lectus. Nam facilisis odio sit amet aliquet ultrices. Maecenas finibus pellentesque tortor
facilisis porta. In tellus libero, pellentesque sed convallis cursus, elementum sed velit. Vivamus nec metus eros.
Phasellus faucibus sem risus, quis tristique tortor semper nec. Proin tristique ac nibh id commodo. Vivamus
consectetur tortor nec ornare vestibulum.', 3,  NOW());
INSERT INTO posts (title, category_id, body, author_id, created_at)
VALUES ('The title number four', 2, 'Sed efficitur libero sit amet tortor condimentum, vel aliquam nisl egestas.
Curabitur et eleifend lectus. Nam facilisis odio sit amet aliquet ultrices. Maecenas finibus pellentesque tortor
facilisis porta. In tellus libero, pellentesque sed convallis cursus, elementum sed velit. Vivamus nec metus eros.
Phasellus faucibus sem risus, quis tristique tortor semper nec. Proin tristique ac nibh id commodo. Vivamus
consectetur tortor nec ornare vestibulum.', 1,  NOW());
INSERT INTO posts (title, category_id, body, author_id, created_at)
VALUES ('The title number five', 3, 'Sed efficitur libero sit amet tortor condimentum, vel aliquam nisl egestas.
Curabitur et eleifend lectus. Nam facilisis odio sit amet aliquet ultrices. Maecenas finibus pellentesque tortor
facilisis porta. In tellus libero, pellentesque sed convallis cursus, elementum sed velit. Vivamus nec metus eros.
Phasellus faucibus sem risus, quis tristique tortor semper nec. Proin tristique ac nibh id commodo. Vivamus
consectetur tortor nec ornare vestibulum.', 2,  NOW());
INSERT INTO posts (title, category_id, body, author_id, created_at)
VALUES ('The title number six', 4, 'Sed efficitur libero sit amet tortor condimentum, vel aliquam nisl egestas.
Curabitur et eleifend lectus. Nam facilisis odio sit amet aliquet ultrices. Maecenas finibus pellentesque tortor
facilisis porta. In tellus libero, pellentesque sed convallis cursus, elementum sed velit. Vivamus nec metus eros.
Phasellus faucibus sem risus, quis tristique tortor semper nec. Proin tristique ac nibh id commodo. Vivamus
consectetur tortor nec ornare vestibulum.', 3,  NOW());

CREATE TABLE categories (
                         id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                         name VARCHAR(50),
                         created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                         modified_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO categories (name, created_at)
VALUES ('category 1',NOW());
INSERT INTO categories (name, created_at)
VALUES ('category 2',NOW());
INSERT INTO categories (name, created_at)
VALUES ('category 3',NOW());
INSERT INTO categories (name, created_at)
VALUES ('category 4',NOW());

CREATE TABLE authors (
                         id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                         first_name VARCHAR(50),
                         last_name VARCHAR(50),
                         email VARCHAR(70),
                         created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                         modified_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO authors (first_name, last_name, email,created_at)
    VALUES ('Pavle','Ciganovic', 'pavle@example.org',NOW());
INSERT INTO authors (first_name, last_name, email,created_at)
    VALUES ('Aida','Dolic', 'aida@example.org',NOW());
INSERT INTO authors (first_name, last_name, email,created_at)
    VALUES ('Luka','Ciganovic', 'luka@example.org',NOW());
INSERT INTO authors (first_name, last_name, email,created_at)
    VALUES ('Ivano','Dolic', 'ivano@example.org',NOW());

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