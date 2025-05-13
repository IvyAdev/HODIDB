
CREATE DATABASE IF NOT EXISTS HodiAppDB;
USE HodiAppDB;

-- Table for storing roles information
CREATE TABLE Roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) UNIQUE NOT NULL
);

-- Table for storing users' information
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role_id INT,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (role_id) REFERENCES Roles(role_id) ON DELETE SET NULL
);

-- Table for storing activities performed by users
CREATE TABLE Activities (
    activity_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    activity_type VARCHAR(100) NOT NULL,
    activity_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    description TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Table for storing permissions related to roles
CREATE TABLE Permissions (
    permission_id INT AUTO_INCREMENT PRIMARY KEY,
    role_id INT,
    permission_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (role_id) REFERENCES Roles(role_id) ON DELETE CASCADE
);

-- Inserting sample data into Roles table
INSERT INTO Roles (role_name) 
VALUES 
('Admin'),
('User');

-- Inserting sample data into Users table
INSERT INTO Users (first_name, last_name, email, password, role_id)
VALUES 
('Ivy', 'Anyango', 'ivy.anyango@example.com', 'hashed_password_123', 1),
('John', 'Doe', 'john.doe@example.com', 'hashed_password_456', 2);

-- Inserting sample data into Activities table
INSERT INTO Activities (user_id, activity_type, description)
VALUES
(1, 'Profile Update', 'Updated profile picture'),
(2, 'Course Completion', 'Completed the Swahili beginner course');

-- Inserting sample data into Permissions table
INSERT INTO Permissions (role_id, permission_name)
VALUES
(1, 'Manage Users'),
(1, 'View All Activities'),
(2, 'View Own Activities');

-- Query to check all tables and data
SELECT * FROM Roles;
SELECT * FROM Users;
SELECT * FROM Activities;
SELECT * FROM Permissions;
