Social Media Database Project
This project involves designing and implementing a relational database for a social media platform. The database stores information about users, friendships, posts, comments, likes, and notifications. It provides a structured way to manage user interactions and content within the platform.

Table of Contents
Project Overview
Database Schema
Getting Started
ER Diagram
Contributing
License
Project Overview
The social media database project aims to create a robust database schema that can efficiently handle user interactions and content management within the platform. It includes tables to store user profiles, friendships between users, posts created by users, comments on posts, likes on posts, and notifications for user activities.

Database Schema
The database schema consists of the following tables:

Users: Stores information about users, including their usernames, email addresses, passwords, bios, profile pictures, and creation timestamps.
Friendships: Tracks the relationships between users, including friendship status and creation timestamps.
Posts: Contains posts created by users, along with their content, media URLs, creation timestamps, and privacy settings.
Comments: Stores comments made by users on posts, including the content of the comments and their creation timestamps.
Likes: Tracks likes given by users on posts, including the timestamps of the likes.
Notifications: Records notifications for user activities, including the type of notification, related post/comment ID, read status, and creation timestamp.
Getting Started
To use this social media database project:

Clone the repository to your local machine.
Import the SQL script (social_media_database.sql) into your MySQL database management tool (e.g., MySQL Workbench).
Modify the script or database schema as needed to suit your specific requirements.
Start querying and interacting with the database using SQL commands or through your application.
ER Diagram
The Entity-Relationship (ER) diagram for the social media database visually represents the structure of the database, including entities, attributes, and relationships between them. Refer to the ER diagram section for a detailed illustration of the database schema.

Contributing
Contributions to the social media database project are welcome! If you have any suggestions, improvements, or bug fixes, feel free to open an issue or create a pull request on GitHub.

License
This social media database project is licensed under the MIT License.
