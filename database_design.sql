Design User table
CREATE TABLE IF NOT EXISTS users
(
    id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
    email    VARCHAR(60),
    password VARCHAR(255),
    PRIMARY KEY (id),
    CONSTRAINT uc_email UNIQUE (email)
);
-- Users create ads with a title and description and category.
CREATE TABLE IF NOT EXISTS ads
(
    id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title       VARCHAR(40),
    description VARCHAR(255),
    user_id     INT,
    FOREIGN KEY (user_id) REFERENCES users (id),
    PRIMARY KEY (id)
);
-- categories
CREATE TABLE IF NOT EXISTS categories
(
    id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    category    VARCHAR(20),
    PRIMARY KEY (id)
);
-- category_ads
CREATE TABLE IF NOT EXISTS category_ads
(
    category_id INT,
    ads_id     INT,
    FOREIGN KEY (category_id) REFERENCES categories (id),
    FOREIGN KEY (ads_id) REFERENCES ads (id)
);
# 1) For a given ad, what is the email address of the user that created it?
SELECT email FROM ads
JOIN users ON users.id = ads.user_id;
# 2) For a given ad, what category, or categories, does it belong to?
SELECT category FROM ads AS a
JOIN category_ads AS ca ON a.id = ca.ads_id
JOIN categories AS cat ON ca.category_id = cat.id;
# 3) For a given category, show all the ads that are in that category.
SELECT title FROM categories AS cat
                         JOIN category_ads AS ca ON cat.id = ca.category_id
                         JOIN ads ON ca.ads_id = ads.id;
# 4) For a given user, show all the ads they have posted.
SELECT title, description FROM users
JOIN ads ON users.id = ads.user_id
WHERE users.id = 5;
# Answers
CREATE TABLE IF NOT EXISTS answers
(
    id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
    txt     TEXT,
    correct CHAR, -- (R/W)
    question_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (question_id) REFERENCES questions (id)
);
# Question
CREATE TABLE IF NOT EXISTS questions
(
    id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
    txt     TEXT,
    PRIMARY KEY (id),
    response CHAR(20),
    quiz_id INT,
    FOREIGN KEY (quiz_id) REFERENCES quizzes (id)
);
# Quizzes
CREATE TABLE IF NOT EXISTS quizzes
(
    id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title    VARCHAR(40),
    subject VARCHAR(20),
    PRIMARY KEY (id)
);
# Users
CREATE TABLE IF NOT EXISTS users
(
    id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
    role     CHAR NOT NULL, -- 'A' is admin, 'S' is Student
    username VARCHAR(20) NOT NULL ,
    password varchar(255) NOT NULL,
    PRIMARY KEY (id)
);
# Results
CREATE TABLE IF NOT EXISTS Results
(
    id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
    score    FLOAT,
    users_id INT,
    quizzes_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (users_id) REFERENCES users (id),
    FOREIGN KEY (quizzes_id) REFERENCES quizzes (id)
);
SELECT COUNT(*) AS 'Number of students that have taken' FROM (
SELECT DISTINCT users_id
FROM Results
JOIN quizzes AS q ON q.id = Results.quizzes_id AND q.id = 5) AS t1;