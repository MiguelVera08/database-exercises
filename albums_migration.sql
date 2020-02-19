CREATE DATABASE IF NOT EXISTS codeup_test_db;

USE codeup_test_db;

CREATE TABLE albums
(
	id INT UNSIGNED auto_increment,
	name VARCHAR(100) not null,
	artist VARCHAR(100) not null,
	release_date INT(4) not null,
	sales DECIMAL(10,2) not null,
	genre VARCHAR(100) not null,
	primary key (id)
);

