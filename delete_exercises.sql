USE codeup_test_db;
# Albums released after 1991
# Albums with the genre 'disco'
# Albums by 'Whitney Houston' (...or maybe an artist of your choice)
# Make sure to put appropriate captions before each SELECT.
#                                                       Convert the SELECT statements to DELETE.
#     Use the MySQL command line client to make sure your records really were removed.
DELETE from albums where release_date > 1991;
DELETE from albums where genre = 'disco';
DELETE from albums where artist = 'Whitney Houston';
# Insert 4 new users into the database. One should
# have a NULL role. The other three should be authors.
# INSERT INTO users (name, email, role_id) VALUES
# ('joe', 'joe@example.com', 2),
# ('sally', 'sally@example.com', 2),
# ('adam', 'adam@example.com', 2),
# ('mike', 'mike@example.com', null);
# SELECT department FROM join_test_db;