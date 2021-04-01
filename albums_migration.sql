USE codeup_test_db;

DROP TABLE IF EXISTS albums;

CREATE TABLE albums (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    artist VARCHAR(128) NOT NULL,
    name VARCHAR(128),
    release_date SMALLINT UNSIGNED,
    sales FLOAT(6, 2),
    genre VARCHAR(128),
    PRIMARY KEY(id)
);