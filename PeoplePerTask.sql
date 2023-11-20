CREATE DATABASE PeoplePerTask;

USE PeoplePerTask;
-- Création de la table User
CREATE TABLE IF NOT EXISTS User (
    User_ID INT AUTO_INCREMENT PRIMARY KEY,
    User_Name VARCHAR(100),
    Pass_word VARCHAR(100),
    Email_Adress VARCHAR(200)
);

-- Insertion de données dans la table User
INSERT INTO User (User_Name, Pass_word, Email_Adress)
VALUES 
    ('MERIEM', '200001', 'merrybalibla@gmail.com'),
    ('CHYPPO', '200001', 'CHYPPOuser@gmail.com');

-- Création de la table Testimonials
CREATE TABLE IF NOT EXISTS Testimonials (
    Testimonials_ID INT PRIMARY KEY AUTO_INCREMENT,
    Comment VARCHAR(225),
    User_ID INT,
    FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);

-- Insertion de données dans la table Testimonials
INSERT INTO Testimonials (Comment, User_ID)
VALUES 
    ('HELLO WORLD', 1);

CREATE TABLE IF NOT EXISTS Categories (
    Categorie_ID INT PRIMARY KEY AUTO_INCREMENT,
    Categorie_Name VARCHAR(100)
);

INSERT INTO Categories (Categorie_Name) 
VALUES
        ('Programming'),
        ('Mecanical'),
        ('Electrical');

CREATE TABLE IF NOT EXISTS Sub_Categories (
    Sub_Categories_ID INT PRIMARY KEY AUTO_INCREMENT,
    Sub_Categories_Name VARCHAR(100),
    Categorie_ID INT,
    FOREIGN KEY (Categorie_ID) REFERENCES Categories(Categorie_ID)
);

INSERT INTO Sub_Categories (Sub_Categories_Name, Categorie_ID) 
VALUES
        ('MEC DE BASE',1),
        ('ELECRIQUE',2),
		('RDM',3),
		('Mec de solide',4),
		('Leader',5);
SELECT * FROM Sub_Categories LIMIT 5;

CREATE TABLE IF NOT EXISTS Project (
    Project_ID INT PRIMARY KEY AUTO_INCREMENT,
    Project_title VARCHAR(100),
    Descriptions VARCHAR(225),
    Categorie_ID INT,
    FOREIGN KEY (Categorie_ID) REFERENCES Categories(Categorie_ID),
    Sub_Categories_ID INT,
    FOREIGN KEY (Sub_Categories_ID) REFERENCES Sub_Categories(Sub_Categories_ID),
    User_ID INT,
    FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);

INSERT INTO Project (Project_title, Descriptions, Categorie_ID, Sub_Categories_ID, User_ID)
VALUES 
        ('MAZE GAME','funny game lol', 1, 1, 1),
		('COnnectFOUR','NOne', 2, 2, 2);

CREATE TABLE IF NOT EXISTS Freelencers(
    Freelencer_ID INT PRIMARY KEY AUTO_INCREMENT,
    Freelencer_Name VARCHAR(100),
    Skils VARCHAR(225),
    User_ID INT,
    FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);

INSERT INTO Freelencers(Freelencer_Name, Skils, User_ID)
VALUES
        ('JACK SPPAROW', 'PIRATE', 1);

CREATE TABLE IF NOT EXISTS Offres(
    Offre_ID INT PRIMARY KEY AUTO_INCREMENT,
    Montant DECIMAL(10,2),
    Deadline DATE,
    Freelencer_ID INT,
    FOREIGN KEY (Freelencer_ID) REFERENCES Freelencers(Freelencer_ID),
    Project_ID INT,
    FOREIGN KEY (Project_ID) REFERENCES Project(Project_ID)
);
-- SELECT DISTINCT Project_ID, Project_title, Descriptions FROM Project LIMIT 2;
-- Challenge: Retrieve usernames and email addresses of all users from the 'Utilisateurs' table.
-- SELECT User_Name,Email_Adress FROM User

-- Challenge: Fetch project titles and descriptions from the 'Projets' table where the project category is 'Programming'.
-- SELECT Project_title, Descriptions
-- FROM Project
-- JOIN Categories ON Project.Categorie_ID = Categories.Categorie_ID
-- WHERE Categories.Categorie_Name = 'Programming';
-- LIMIT 1

-- Challenge: Count the total number of testimonials in the 'Témoignages' table.
-- SELECT COUNT(*)
-- FROM Testimonials

-- Challenge: Retrieve distinct categories available in the 'Catégories' table.
-- SELECT DISTINCT Categorie_Name FROM categories

