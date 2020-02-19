USE codeup_test_db;

SELECT name from albums
WHERE artist = 'Pink Floyd';

SELECT release_date from albums
WHERE name = 'Sgt. Pepper''s Lonely Hearts Club Band';

SELECT genre from albums
WHERE name = 'Nevermind';

SELECT name from albums
WHERE release_date BETWEEN 1989 AND 2000;

SELECT name from albums
WHERE sales < 20;

SELECT name from albums
WHERE genre = 'Rock';