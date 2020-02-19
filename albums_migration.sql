CREATE DATABASE IF NOT EXISTS  codeup_test_db;

USE codeup_test_db;

CREATE TABLE IF NOT EXISTS albums (

    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    artist VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    release_date INT(4) NOT NULL,
    sales DECIMAL(10,2) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);