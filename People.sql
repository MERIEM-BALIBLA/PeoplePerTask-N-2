CREATE DATABASE IF NOT EXISTS People;

USE People;

CREATE TABLE User (
    User_ID INT AUTO_INCREMENT PRIMARY KEY ,
    User_Name varchar(100),
    Pass_word varchar(100),
    Email_Adress varchar(200) 
);

-- INSERT INTO User(User_Name, Pass_word, Email_Adress) 
-- VALUES 
--         ('MERIEM','200001','merrybalibla@gmail.com');
        

CREATE TABLE Testimonials(
    Testimonials_ID INT PRIMARY KEY AUTO_INCREMENT,
    Comment VARCHAR(225),
    User_ID INT,
    FOREIGN KEY (User_ID) REFERENCES User(User_ID)

);

-- INSERT INTO Testimonials (Comment, User_ID) 
-- VALUES 
--         ('HELLO WORLD',1);

CREATE TABLE Categories (
    Categorie_ID INT PRIMARY KEY AUTO_INCREMENT,
    Categorie_Name VARCHAR(100)
);

-- INSERT INTO Categories (Categorie_Name) 
-- VALUES
--         ('Mecanical'),
--         ('Electrical');

CREATE TABLE Sub_Categories (
    Sub_Categories_ID INT PRIMARY KEY AUTO_INCREMENT,
    Sub_Categories_Name VARCHAR(100),
    Categorie_ID INT,
    FOREIGN KEY (Categorie_ID) REFERENCES Categories(Categorie_ID)
);

-- INSERT INTO Sub_Categories (Sub_Categories_Name, Categorie_ID) 
-- VALUES
--         ('MEC DE BASE',1),
--         ('ELECRIQUE',2);

CREATE TABLE Project (
    Project_ID INT PRIMARY KEY AUTO_INCREMENT,
    Project_title VARCHAR(100),
    Description VARCHAR(225),
    Categorie_ID INT,
    FOREIGN KEY (Categorie_ID) REFERENCES Categories(Categorie_ID),
    Sub_Categories_ID INT,
    FOREIGN KEY (Sub_Categories_ID) REFERENCES Sub_Categories(Sub_Categories_ID),
    User_ID INT,
    FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);

-- INSERT INTO Project (Project_title, Description, Categorie_ID, Sub_Categories_ID, User_ID)
-- VALUES 
--         ('MAZE GAME','funny game lol', 1, 1, 1);

CREATE TABLE Freelencers(
    Freelencer_ID INT PRIMARY KEY AUTO_INCREMENT,
    Freelencer_Name VARCHAR(100),
    Skils VARCHAR(225),
    User_ID INT,
    FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);

-- INSERT INTO Freelencers(Freelencer_Name, Skils, User_ID)
-- VALUES
--         ('JACK SPPAROW', 'PIRATE', 1);

CREATE TABLE Offres(
    Offre_ID INT PRIMARY KEY AUTO_INCREMENT,
    Montant DECIMAL(10,2),
    Deadline DATE,
    Freelencer_ID INT,
    FOREIGN KEY (Freelencer_ID) REFERENCES Freelencers(Freelencer_ID),
    Project_ID INT,
    FOREIGN KEY (Project_ID) REFERENCES Project(Project_ID)
);

-- INSERT INTO Offres(Montant, Deadline, Freelencer_ID, Project_ID)
-- VALUES 
        