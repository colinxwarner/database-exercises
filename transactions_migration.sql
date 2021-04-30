use bank_db;

DROP TABLE IF EXISTS transactions;

CREATE TABLE transactions (
                              id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
                              date DATE,
                              description VARCHAR (100),
                              memo TEXT,
                              amount DECIMAL (8,2) NOT NULL,
                              transaction_successful TINYINT
);

INSERT INTO transactions (date, amount, description)
VALUES (2021-05-30, 1000.00, 'food')
       (2021-04-13, 500.45, 'cake');