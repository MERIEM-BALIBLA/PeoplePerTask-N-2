-- challenge 5
-- SELECT COUNT(Project_ID), Categorie_ID
-- FROM Project GROUP BY Categorie_ID

-- challenge 6
-- SELECT  Project_title, Descriptions FROM project
-- WHERE LENGTH(Descriptions) = (SELECT MAX(LENGTH(Descriptions)) FROM project);

-- challenge 7
 SELECT * FROM user
 WHERE Email_Adress LIKE '%@gmail.com';


-- SELECT Project.Project_title, project.Descriptions, categories.Categorie_ID, categories.Categorie_Name
-- FROM project, categories;

-- SELECT Project_title, Descriptions
-- FROM project
-- JOIN categories ON project.Categorie_ID = categories.Categorie_ID;

-- challenge 8
SELECT Project_title, Descriptions, categories.Categorie_ID 
FROM project
JOIN categories ON project.Categorie_ID = categories.Categorie_ID;


-- challenge 9
CREATE VIEW IF NOT EXISTS Info AS
SELECT Project_title, User.User_Name
FROM project
JOIN User ON Project.User_ID = User.User_ID;

