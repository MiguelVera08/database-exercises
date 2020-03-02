CREATE DATABASE IF NOT EXISTS codeup_test_db;

DROP TABLE IF EXISTS albums;

USE codeup_test_db;

CREATE TABLE IF NOT EXISTS albums
(
	id INT UNSIGNED auto_increment,
    artist VARCHAR(100) not null,
	name VARCHAR(100) not null,
	release_date INT(4) not null,
	sales DECIMAL(10,2) not null,
	genre VARCHAR(100) not null,
	primary key (id)
);
