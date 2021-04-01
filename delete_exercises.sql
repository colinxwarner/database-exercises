USE codeup_test_db;

DELETE FROM albums
WHERE release_date > 1991;


DELETE FROM albums
WHERE genre LIKE '%disco%';


DELETE FROM albums
WHERE artist LIKE '%Whitney%';