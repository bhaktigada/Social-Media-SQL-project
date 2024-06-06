-- create database
create database social_media;

-- use database
use social_media;

-- create tables
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    bio TEXT,
    profile_picture VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Friendships (
    friendship_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    friend_id INT,
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (friend_id) REFERENCES Users(user_id)
);

CREATE TABLE Posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    content TEXT,
    media_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    privacy VARCHAR(10),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Comments (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT,
    user_id INT,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Likes (
    like_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT,
    user_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Notifications (
    notification_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    type VARCHAR(20),
    related_id INT,
    read_status BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


-- create trigger
DELIMITER //
CREATE TRIGGER AfterLikeInsert
AFTER INSERT ON Likes
FOR EACH ROW
BEGIN
    INSERT INTO Notifications (user_id, type, related_id)
    VALUES (NEW.user_id, 'like', NEW.post_id);
END//
DELIMITER ;


-- Insert =data
INSERT INTO Users (username, email, password, bio, profile_picture)
VALUES 
('Ram Varma', 'ramvarma100@gmail.com', 'RamVarma100100', 'Passionate Enterpreneur', 'rma_varma.jpg'),
('Shruti Sharma', 'sharmash34@gmail.com', 'SSShrutiSharma', 'Vlogger by profession, Exploring world', 'shruti.jpg');

-- Insert Friendship
INSERT INTO Friendships (user_id, friend_id, status)
VALUES (1, 2, 'pending');

INSERT INTO Posts (user_id, content, media_url, privacy)
VALUES (1, 'This is a post content', 'post_media.jpg', 'public');

INSERT INTO Comments (post_id, user_id, content)
VALUES (1, 2, 'Nice post!');

INSERT INTO Likes (post_id, user_id)
VALUES (1, 2);


-- update friendship status
UPDATE Friendships
SET status = 'accepted'
WHERE user_id = 1 AND friend_id = 2;



-- create a procedure
DELIMITER //
CREATE PROCEDURE GetUserFeed(IN userId INT)
BEGIN
    SELECT Posts.post_id, Posts.content, Posts.media_url, Posts.created_at, Users.username
    FROM Posts
    JOIN Users ON Posts.user_id = Users.user_id
    WHERE Posts.user_id = userId
    ORDER BY Posts.created_at DESC;
END //
DELIMITER ;


-- call procedure
CALL GetUserFeed(1);






