-- Créer la base de données (si ce n'est pas déjà fait)
CREATE DATABASE IF NOT EXISTS Arcadia;

-- Utiliser la base de données
USE Arcadia;

-- Créeation des tables
CREATE TABLE Users(
   Id_User VARCHAR(50) PRIMARY KEY,
   Email_User VARCHAR(50) NOT NULL,
   Password_User VARCHAR(50) NOT NULL,
   Name_User VARCHAR(50) NOT NULL,
   Firstname_User VARCHAR(50) NOT NULL,
   Dob_User DATE
);

CREATE TABLE Role(
   Id_Role INT AUTO_INCREMENT PRIMARY KEY,
   Label VARCHAR(50),
   Type_User VARCHAR(50) 
);

CREATE TABLE Alimentation_Animaux(
   Id_Alimentation INT AUTO_INCREMENT PRIMARY KEY,
   Nom_Nourriture TEXT NOT NULL,
   Quantite_Nourriture DECIMAL(15,4) NOT NULL,
   Date_Alimentation DATETIME NOT NULL,
   Commentaire_Veterinaire TEXT
);

CREATE TABLE Soins_Animaux(
   Id_Traitement INT AUTO_INCREMENT PRIMARY KEY,
   Description_Soin VARCHAR(50) NOT NULL,
   Date_Soin DATETIME NOT NULL
);

CREATE TABLE Habitat(
   Id_Habitat INT AUTO_INCREMENT PRIMARY KEY,
   Nom VARCHAR(50) NOT NULL,
   Description TEXT,
   Type_Habitat VARCHAR(6) NOT NULL
);

CREATE TABLE Image(
   Id_Image INT AUTO_INCREMENT PRIMARY KEY,
   Image_Date DATETIME NOT NULL
);

CREATE TABLE Espece(
   Id_Espece INT AUTO_INCREMENT PRIMARY KEY,
   Type_Espece VARCHAR(50) NOT NULL,
   Evaluation_Extinction VARCHAR(50),
   Traits_Caracteristiques TEXT
);

CREATE TABLE Race(
   Id_Race INT AUTO_INCREMENT PRIMARY KEY,
   Label VARCHAR(50),
   Description TEXT,
   Habitat_Naturel VARCHAR(50)
);

CREATE TABLE Service(
   Id_Service INT AUTO_INCREMENT PRIMARY KEY,
   Nom VARCHAR(50),
   Description_Service TEXT
);

CREATE TABLE Horaire(
   Id_Horaire INT AUTO_INCREMENT PRIMARY KEY,
   Jour_Semaine VARCHAR(10) NOT NULL,
   Heure_Debut TIME NOT NULL,
   Heure_Fin TIME NOT NULL
);

CREATE TABLE Avis(
   Id_Avis INT AUTO_INCREMENT PRIMARY KEY,
   Pseudo VARCHAR(50),
   Commentaire TEXT,
   Status_Avis VARCHAR(50) NOT NULL,
   IsVisible BOOLEAN NOT NULL
);

CREATE TABLE Zoo(
   Id_Zoo INT AUTO_INCREMENT PRIMARY KEY,
   Zoo_Address VARCHAR(50) NOT NULL,
   Telephone_Number VARCHAR(15) NOT NULL,
   Id_User VARCHAR(50) NOT NULL,
   FOREIGN KEY(Id_User) REFERENCES Users(Id_User)
);

CREATE TABLE Animal(
   Id_Animal INT AUTO_INCREMENT PRIMARY KEY,
   Prenom VARCHAR(50) NOT NULL,
   Etat VARCHAR(50) NOT NULL,
   Sexe VARCHAR(7) NOT NULL,
   Description_Animal TEXT,
   Dob_Animal DATE NOT NULL,
   Id_Image INT NOT NULL,
   Id_Habitat INT NOT NULL,
   FOREIGN KEY(Id_Image) REFERENCES Image(Id_Image),
   FOREIGN KEY(Id_Habitat) REFERENCES Habitat(Id_Habitat)
);

CREATE TABLE Rapport(
   Id_Rapport INT AUTO_INCREMENT PRIMARY KEY,
   Date_Rapport DATE NOT NULL,
   Details TEXT,
   Type VARCHAR(12),
   Id_User VARCHAR(50) NOT NULL,
   Id_Animal INT NOT NULL,
   Id_Traitement INT NOT NULL,
   Id_Alimentation INT NOT NULL,
   FOREIGN KEY(Id_User) REFERENCES Users(Id_User),
   FOREIGN KEY(Id_Animal) REFERENCES Animal(Id_Animal),
   FOREIGN KEY(Id_Traitement) REFERENCES Soins_Animaux(Id_Traitement),
   FOREIGN KEY(Id_Alimentation) REFERENCES Alimentation_Animaux(Id_Alimentation)
);

CREATE TABLE Posseder(
   Id_User VARCHAR(50),
   Id_Role INT,
   PRIMARY KEY(Id_User, Id_Role),
   FOREIGN KEY(Id_User) REFERENCES Users(Id_User),
   FOREIGN KEY(Id_Role) REFERENCES Role(Id_Role)
);

CREATE TABLE Appartenir(
   Id_Animal INT,
   Id_Espece INT,
   PRIMARY KEY(Id_Animal, Id_Espece),
   FOREIGN KEY(Id_Animal) REFERENCES Animal(Id_Animal),
   FOREIGN KEY(Id_Espece) REFERENCES Espece(Id_Espece)
);

CREATE TABLE Decliner(
   Id_Espece INT,
   Id_Race INT,
   PRIMARY KEY(Id_Espece, Id_Race),
   FOREIGN KEY(Id_Espece) REFERENCES Espece(Id_Espece),
   FOREIGN KEY(Id_Race) REFERENCES Race(Id_Race)
);

CREATE TABLE Planifier(
   Id_Service INT,
   Id_Horaire INT,
   PRIMARY KEY(Id_Service, Id_Horaire),
   FOREIGN KEY(Id_Service) REFERENCES Service(Id_Service),
   FOREIGN KEY(Id_Horaire) REFERENCES Horaire(Id_Horaire)
);

-- Insertion dans la table Role
INSERT INTO `Role` (`Label`, `Type_User`) VALUES
('Administrateur', 'admin'),
('Veterinaire', 'vet'),
('Employe', 'employee'),
('Guide', 'guide'),
('Gardien', 'gardien');

-- Insertion dans la table Alimentation_Animaux
INSERT INTO `Alimentation_Animaux` (`Nom_Nourriture`, `Quantite_Nourriture`, `Date_Alimentation`, `Commentaire_Veterinaire`) VALUES
('Herbe', 5.5, '2024-01-01 12:00:00', 'Bonne qualité'),
('Viande', 3.2, '2024-01-02 14:00:00', 'Provenance vérifiée'),
('Fruits', 2.5, '2024-01-03 10:30:00', 'Frais'),
('Poisson', 4.0, '2024-01-04 11:00:00', 'Bien conservé'),
('Légumes', 3.7, '2024-01-05 09:00:00', 'Bien lavé');

-- Insertion dans la table Soins_Animaux
INSERT INTO `Soins_Animaux` (`Description_Soin`, `Date_Soin`) VALUES
('Vaccination', '2024-01-03 10:00:00'),
('Examen de routine', '2024-01-04 11:00:00'),
('Détartrage des dents', '2024-01-05 12:00:00'),
('Bain médicalisé', '2024-01-06 09:00:00'),
('Analyse sanguine', '2024-01-07 08:00:00');

-- Insertion dans la table Habitat
INSERT INTO `Habitat` (`Nom`, `Description`, `Type_Habitat`) VALUES
('Savane', 'Habitat pour animaux de savane', 'extérieur'),
('Aquarium', 'Habitat pour animaux aquatiques', 'intérieur'),
('Jungle', 'Habitat pour animaux de la jungle', 'extérieur'),
('Marais', 'Habitat pour animaux des marais', 'extérieur'),
('Désert', 'Habitat pour animaux du désert', 'extérieur');

-- Insertion dans la table Image
INSERT INTO `Image` (`Image_Date`) VALUES
('2024-01-05 15:00:00'),
('2024-01-06 16:00:00'),
('2024-01-07 17:00:00'),
('2024-01-08 18:00:00'),
('2024-01-09 19:00:00');

-- Insertion dans la table Espece
INSERT INTO `Espece` (`Type_Espece`, `Evaluation_Extinction`, `Traits_Caracteristiques`) VALUES
('Lion', 'Vulnérable', 'Grand carnivore'),
('Dauphin', 'Non menacé', 'Mammifère marin intelligent'),
('Tigre', 'En danger', 'Félin puissant'),
('Éléphant', 'Menacé', 'Grand herbivore'),
('Crocodile', 'Non menacé', 'Grand reptile');

-- Insertion dans la table Race
INSERT INTO `Race` (`Label`, `Description`, `Habitat_Naturel`) VALUES
('Lion d\'Afrique', 'Grand lion d\'Afrique', 'Savane'),
('Dauphin à gros nez', 'Dauphin avec un nez proéminent', 'Océan'),
('Tigre du Bengale', 'Grand tigre du Bengale', 'Jungle'),
('Éléphant d\'Afrique', 'Grand éléphant d\'Afrique', 'Savane'),
('Crocodile du Nil', 'Grand crocodile du Nil', 'Marais');

