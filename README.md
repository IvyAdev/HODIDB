# HODIDB

## Description

The **HodiAppDB SQL Project** is designed to manage user roles, activities, and permissions in a simple application. 
The database includes four primary tables:

* **Roles**: Stores the roles that users can have.
* **Users**: Contains users' personal information, login credentials, and associated roles.
* **Activities**: Logs activities performed by users.
* **Permissions**: Defines permissions granted to each role.

The project demonstrates how to create tables, insert sample data, and query the database using SQL.

## How to Run/Set Up the Project

### Requirements:

* MySQL (or any compatible SQL database system)

### Setup Instructions:

1. **Clone the Repository:**
   To clone the repository to your local machine, run:

   
   git clone https://github.com/IvyAdev/HODIDB.git
  

2. **Import the SQL File:**

   * Open your SQL editor or MySQL Workbench.
   * Run the SQL commands by sourcing the `HODIDB.sql` file:
    
     source path/to/HODIDB.sql;
    

3. **Running SQL Queries:**
   Once you've imported the database, you can interact with the tables. Here are a few basic queries you can use:

   1. **Check all roles:**

    
      SELECT * FROM Roles;
     

   2. **Check all users:**

     
      SELECT * FROM Users;
      

   3. **Check all activities:**

      
      SELECT * FROM Activities;
     

   4. **Check all permissions:**

      
      SELECT * FROM Permissions;
     

### Screenshot to ERD

![Entity-Relationship Diagram of Application Schema](https://github.com/user-attachments/assets/aa473faa-c869-432d-89cc-25ccb32c1065)


## Repo Contents

This repository contains:

* **HODIDB.sql**: A well-commented SQL file containing:

  * Creation of the `Roles`, `Users`, `Activities`, and `Permissions` tables.
  * Insertion of sample data into each table.
  * Queries to check the inserted data.

## Database Structure

The database consists of the following tables:

### **Roles Table:**

Stores information about user roles.


CREATE TABLE Roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) UNIQUE NOT NULL
);


### **Users Table:**

Stores user information such as name, email, password, and the role assigned to them.


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


### **Activities Table:**

Stores activities performed by users.


CREATE TABLE Activities (
    activity_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    activity_type VARCHAR(100) NOT NULL,
    activity_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    description TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);


### **Permissions Table:**

Stores permissions associated with each role.


CREATE TABLE Permissions (
    permission_id INT AUTO_INCREMENT PRIMARY KEY,
    role_id INT,
    permission_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (role_id) REFERENCES Roles(role_id) ON DELETE CASCADE
);


## Example Queries

Once the database is set up, you can execute the following queries:

1. **Select all records from the Roles table:**

  
   SELECT * FROM Roles;
   

2. **Insert a new user :**

   
   INSERT INTO Users (first_name, last_name, email, password, role_id)
   VALUES ('Wambui', 'Mwaura', 'wambui.mwaura@example.com', 'hashed_password_789', 2);
   ```

3. **Update an existing user's information:**

   
   UPDATE Users
   SET password = 'new_hashed_password_123'
   WHERE email = 'ivy.steph@example.com';
  

4. **Delete a user:**

  
   DELETE FROM Users
   WHERE email = 'wambui.mwaura@example.com';
   

## Sample Data Inserted

Here is some sample data inserted into the tables:

### **Roles:**

* Admin
* User

### **Users:**

* Wambui Mwaura (`wambui.mwaura@example.com`) - User
* Mwangi Njoroge (`mwangi.njoroge@example.com`) - Admin

### **Activities:**

* Wambui updated her profile picture.
* Mwangi completed the advanced Swahili course.

### **Permissions:**

* Admin can manage users and view all activities.
* User can only view their own activities.

## Credits

* **Project by:** Ivy Anyango


