CREATE DATABASE IF NOT EXISTS design_test_db;
USE design_test_db;
DROP TABLE IF EXISTS quote_topic;
DROP TABLE IF EXISTS quotes;
DROP TABLE IF EXISTS topics;
DROP TABLE IF EXISTS authors;

CREATE TABLE quotes (
                        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                        author_first_name VARCHAR(50) DEFAULT 'NONE',
                        author_last_name  VARCHAR(100) NOT NULL,
                        content TEXT NOT NULL,
                        PRIMARY KEY (id)
);

CREATE TABLE authors (
                         id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                         first_name VARCHAR(50),
                         last_name  VARCHAR(100) NOT NULL,
                         PRIMARY KEY (id)
);

ALTER TABLE quotes DROP COLUMN author_first_name;
ALTER TABLE quotes DROP COLUMN author_last_name;
ALTER TABLE quotes ADD COLUMN author_id INT UNSIGNED NOT NULL;
ALTER TABLE quotes ADD FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE NO ACTION ON UPDATE CASCADE;

SELECT * FROM quotes;

SELECT * FROM authors;

INSERT INTO authors(first_name, last_name) VALUES
('Casey', 'Edwards'),
('Justin', 'Reich');

INSERT INTO quotes(content, author_id) VALUES
((SELECT id FROM authors WHERE first_name = 'Casey' and last_name = 'Edwards'), 'Quack'),
((SELECT id FROM authors WHERE first_name = 'Justin' and last_name = 'Reich'), 'If you have the bandwidth');

CREATE TABLE topics (
                        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                        name VARCHAR(255),
                        PRIMARY KEY (id)
);

CREATE TABLE quote_topic (
                             quote_id INTEGER UNSIGNED NOT NULL,
                             topic_id INTEGER UNSIGNED NOT NULL,
                             FOREIGN KEY (quote_id) REFERENCES quotes(id),
                             FOREIGN KEY (topic_id) REFERENCES topics(id)
);

