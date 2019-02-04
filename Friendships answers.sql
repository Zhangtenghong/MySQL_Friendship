SELECT users.first_name, users.last_name, users2.first_name as friend_first_name, users2.last_name as friend_last_name 
FROM users
LEFT JOIN friendships ON users.id = friendships.friend_1_id
LEFT JOIN users as users2 ON users2.id = friendships.friend_2_id;

-- Return all users who are friends with Kermit, make sure their names are displayed in results
SELECT users.first_name, users.last_name, users2.first_name as friend_first_name, users2.last_name as friend_last_name 
FROM users
LEFT JOIN friendships ON users.id = friendships.friend_1_id
LEFT JOIN users as users2 ON users2.id = friendships.friend_2_id
WHERE users.first_name='Kermit';

-- Return the count of all friendships 
SELECT Count(*) as count_friendships
FROM users
JOIN friendships ON users.id = friendships.friend_1_id
JOIN users as users2 ON users2.id = friendships.friend_2_id;

-- Find out who has the most friends and return the count of their friends.
SELECT Count(*) as count_friendships, users.first_name, users.last_name
FROM users
JOIN friendships ON users.id = friendships.friend_1_id
JOIN users as users2 ON users2.id = friendships.friend_2_id
GROUP BY users.id;


-- Return the friends of Eli in alphabetical order
SELECT users.first_name, users2.first_name as friend_first_name, users2.last_name as friend_last_name 
FROM users
LEFT JOIN friendships ON users.id = friendships.friend_1_id
LEFT JOIN users as users2 ON users2.id = friendships.friend_2_id
WHERE users.first_name='Eli';

-- Remove Marky Mark from Eli’s friends. 
DELETE FROM friendships
WHERE friend_1_id=2 and friend_2_id=5;

-- Return all friendships, displaying just the first and last name of both friends 
SELECT users.first_name as first_name, users.last_name as last_name 
FROM users
JOIN friendships ON users.id = friendships.friend_1_id
JOIN users as users2 ON users2.id = friendships.friend_2_id;

-- Create a new user and make them friends with Eli Byers, Kermit The Frog, and Marky Mark 
INSERT INTO users(first_name, last_name)
VALUES('Tenghong', 'Zhang');

INSERT INTO friendships(friend_1_id, friend_2_id)
VALUES(7,2);

INSERT INTO friendships(friend_1_id, friend_2_id)
VALUES(7,4);

INSERT INTO friendships(friend_1_id, friend_2_id)
VALUES(7,5);