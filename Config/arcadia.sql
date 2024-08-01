CREATE DATABASE IF NOT EXISTS Arcadia
    DEFAULT CHARACTER SET = 'utf8mb4';

USE Arcadia;

CREATE TABLE Users(
    Id_User INT AUTO_INCREMENT PRIMARY KEY,
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
    Type_Habitat VARCHAR(50) NOT NULL
);

CREATE TABLE Image(
    Id_Image INT AUTO_INCREMENT PRIMARY KEY,
    Image_Data BLOB NOT NULL
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
    IsVisible BOOLEAN NOT NULL,
    Id_User INT,
    FOREIGN KEY(Id_User) REFERENCES Users(Id_User)
);

CREATE TABLE Zoo(
    Id_Zoo INT AUTO_INCREMENT PRIMARY KEY,
    Zoo_Address VARCHAR(50) NOT NULL,
    Telephone_Number VARCHAR(15) NOT NULL,
    Id_User INT NOT NULL,
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
    Id_User INT NOT NULL,
    Id_Animal INT NOT NULL,
    Id_Traitement INT NOT NULL,
    Id_Alimentation INT NOT NULL,
    FOREIGN KEY(Id_User) REFERENCES Users(Id_User),
    FOREIGN KEY(Id_Animal) REFERENCES Animal(Id_Animal),
    FOREIGN KEY(Id_Traitement) REFERENCES Soins_Animaux(Id_Traitement),
    FOREIGN KEY(Id_Alimentation) REFERENCES Alimentation_Animaux(Id_Alimentation)
);

CREATE TABLE Posseder(
    Id_User INT,
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

-- Injections de données
INSERT INTO `Role` (`Label`, `Type_User`) VALUES
('Administrateur', 'Admin'),
('Vétérinaire', 'Staff'),
('Employé', 'Staff');

-- Insertion de données d'alimentation des animaux
INSERT INTO `Alimentation_Animaux` (`Nom_Nourriture`, `Quantite_Nourriture`, `Date_Alimentation`, `Commentaire_Veterinaire`) VALUES
('Viande', 50.0, '2024-01-01 10:00:00', 'Les lions ont bien mangé.'),
('Herbe', 200.0, '2024-01-01 11:00:00', 'Les éléphants ont apprécié.'),
('Poisson', 30.0, '2024-01-01 12:00:00', 'Les pingouins ont bien mangé.'),
('Insectes', 10.0, '2024-01-01 13:00:00', 'Les grenouilles ont bien mangé.'),
('Fruits', 100.0, '2024-01-01 14:00:00', 'Les singes ont bien mangé.');

-- Insertion de soins des animaux
INSERT INTO `Soins_Animaux` (`Description_Soin`, `Date_Soin`) VALUES
('Vaccination annuelle', '2024-01-02 10:00:00'),
('Vérification dentaire', '2024-01-03 11:00:00'),
('Analyse sanguine', '2024-01-04 12:00:00'),
('Traitement antiparasitaire', '2024-01-05 13:00:00'),
('Brossage des poils', '2024-01-06 14:00:00');

-- Insertion des habitats
INSERT INTO `Habitat` (`Nom`, `Description`, `Type_Habitat`) VALUES
('Jungle', 'Un habitat dense avec une végétation luxuriante.', 'Jungle'),
('Marais', 'Un habitat humide avec des eaux stagnantes.', 'Marais'),
('Savane', 'Un habitat ouvert avec des herbes hautes.', 'Savane');

-- Insertion des images
INSERT INTO `Image` (`Image_Data`) VALUES
('...'),  -- Assuming binary data for the image
('...'),
('...'),
('...'),
('...');

-- Insertion des espèces
INSERT INTO `Espece` (`Type_Espece`, `Evaluation_Extinction`, `Traits_Caracteristiques`) VALUES
('Lion', 'Vulnérable', 'Grand carnivore'),
('Tigre', 'En danger', 'Félin puissant'),
('Éléphant', 'Menacé', 'Grand herbivore'),
('Crocodile', 'Non menacé', 'Grand reptile'),
('Girafe', 'Non menacé', 'Grand herbivore avec un long cou'),
('Zèbre', 'Non menacé', 'Rayures distinctes'),
('Guépard', 'Vulnérable', 'Le plus rapide'),
('Rhinocéros', 'Critiquement menacé', 'Grand herbivore avec une corne'),
('Gorille', 'En danger', 'Grand primate'),
('Léopard', 'Quasi menacé', 'Félin tacheté');

-- Insertion des races
INSERT INTO `Race` (`Label`, `Description`, `Habitat_Naturel`) VALUES
('Lion d\'Afrique', 'Grand lion d\'Afrique', 'Savane'),
('Tigre du Bengale', 'Grand tigre du Bengale', 'Jungle'),
('Éléphant d\'Afrique', 'Grand éléphant d\'Afrique', 'Savane'),
('Crocodile du Nil', 'Grand crocodile du Nil', 'Marais'),
('Girafe de Masaï', 'Girafe avec des taches distinctes', 'Savane'),
('Zèbre de Grévy', 'Grand zèbre avec de fines rayures', 'Savane'),
('Guépard d\'Afrique', 'Le plus rapide des guépards', 'Savane'),
('Rhinocéros blanc', 'Grand rhinocéros blanc', 'Savane'),
('Gorille de montagne', 'Grand primate des montagnes', 'Montagne'),
('Léopard d\'Afrique', 'Félin tacheté d\'Afrique', 'Savane');

-- Insertion des services
INSERT INTO `Service` (`Nom`, `Description_Service`) VALUES
('Visite guidée', 'Une visite guidée par un expert du zoo.'),
('Nourrissage des animaux', 'Participation au nourrissage des animaux.'),
('Séance photo', 'Une séance photo avec les animaux.'),
('Atelier pédagogique', 'Un atelier éducatif pour les enfants.'),
('Rencontre avec le vétérinaire', 'Rencontre avec le vétérinaire du zoo.');

-- Insertion des horaires
INSERT INTO `Horaire` (`Jour_Semaine`, `Heure_Debut`, `Heure_Fin`) VALUES
('Lundi', '09:00:00', '17:00:00'),
('Mardi', '09:00:00', '17:00:00'),
('Mercredi', '09:00:00', '17:00:00'),
('Jeudi', '09:00:00', '17:00:00'),
('Vendredi', '09:00:00', '17:00:00'),
('Samedi', '10:00:00', '18:00:00'),
('Dimanche', '10:00:00', '18:00:00');

-- Insertion des avis
INSERT INTO `Avis` (`Pseudo`, `Commentaire`, `Status_Avis`, `IsVisible`, `Id_User`) VALUES
('Christian69Lyon', 'Le zoo Arcadia est incroyable! Les animaux sont bien entretenus et les habitats sont magnifiques.', 'approuvé', TRUE, 1),
('PierreM', 'Une expérience formidable pour toute la famille. Nous avons adoré la diversité des animaux.', 'approuvé', TRUE, 2),
('Patatoes', 'Les guides sont très informés et passionnés. Nous avons appris beaucoup de choses nouvelles.', 'approuvé', TRUE, 3);

-- Insertion des zoos
INSERT INTO `Zoo` (`Zoo_Address`, `Telephone_Number`, `Id_User`) VALUES
('12 Rue des Innovateurs, 35000 Rennes, France', '0699887766', 1);

-- Insertion des animaux
INSERT INTO `Animal` (`Prenom`, `Etat`, `Sexe`, `Description_Animal`, `Dob_Animal`, `Id_Image`, `Id_Habitat`) VALUES
('Simba', 'En bonne santé', 'Mâle', 'Lion courageux et fort', '2015-05-15', 1, 1),
('Nala', 'En bonne santé', 'Femelle', 'Lionne agile et intelligente', '2016-08-21', 2, 1),
('Kaa', 'En bonne santé', 'Mâle', 'Serpent constricteur', '2018-01-30', 3, 2),
('Baloo', 'En bonne santé', 'Mâle', 'Ours aimant le miel', '2012-11-03', 4, 2),
('Dumbo', 'En bonne santé', 'Mâle', 'Éléphant aux grandes oreilles', '2019-03-27', 5, 3);

-- Insertion des rapports
INSERT INTO `Rapport` (`Date_Rapport`, `Details`, `Type`, `Id_User`, `Id_Animal`, `Id_Traitement`, `Id_Alimentation`) VALUES
('2024-01-10', 'Le lion Simba a reçu sa vaccination annuelle.', 'Soin', 1, 1, 1, 1),
('2024-01-11', 'L\'éléphant Dumbo a mangé 50kg de fruits.', 'Alimentation', 1, 5, 2, 5);

-- Insertion des possessions
INSERT INTO `Posseder` (`Id_User`, `Id_Role`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Insertion des appartenances
INSERT INTO `Appartenir` (`Id_Animal`, `Id_Espece`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3);

-- Insertion des déclinaisons
INSERT INTO `Decliner` (`Id_Espece`, `Id_Race`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Insertion des planifications
INSERT INTO `Planifier` (`Id_Service`, `Id_Horaire`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Contraintes supplémentaires
ALTER TABLE Avis ADD CONSTRAINT fk_id_user_avis FOREIGN KEY (Id_User) REFERENCES Users(Id_User);
ALTER TABLE Zoo ADD CONSTRAINT fk_id_user_zoo FOREIGN KEY (Id_User) REFERENCES Users(Id_User);
ALTER TABLE Animal ADD CONSTRAINT fk_id_image_animal FOREIGN KEY (Id_Image) REFERENCES Image(Id_Image);
ALTER TABLE Animal ADD CONSTRAINT fk_id_habitat_animal FOREIGN KEY (Id_Habitat) REFERENCES Habitat(Id_Habitat);
ALTER TABLE Rapport ADD CONSTRAINT fk_id_user_rapport FOREIGN KEY (Id_User) REFERENCES Users(Id_User);
ALTER TABLE Rapport ADD CONSTRAINT fk_id_animal_rapport FOREIGN KEY (Id_Animal) REFERENCES Animal(Id_Animal);
ALTER TABLE Rapport ADD CONSTRAINT fk_id_traitement_rapport FOREIGN KEY (Id_Traitement) REFERENCES Soins_Animaux(Id_Traitement);
ALTER TABLE Rapport ADD CONSTRAINT fk_id_alimentation_rapport FOREIGN KEY (Id_Alimentation) REFERENCES Alimentation_Animaux(Id_Alimentation);
ALTER TABLE Posseder ADD CONSTRAINT fk_id_user_posseder FOREIGN KEY (Id_User) REFERENCES Users(Id_User);
ALTER TABLE Posseder ADD CONSTRAINT fk_id_role_posseder FOREIGN KEY (Id_Role) REFERENCES Role(Id_Role);
ALTER TABLE Appartenir ADD CONSTRAINT fk_id_animal_appartenir FOREIGN KEY (Id_Animal) REFERENCES Animal(Id_Animal);
ALTER TABLE Appartenir ADD CONSTRAINT fk_id_espece_appartenir FOREIGN KEY (Id_Espece) REFERENCES Espece(Id_Espece);
ALTER TABLE Decliner ADD CONSTRAINT fk_id_espece_decliner FOREIGN KEY (Id_Espece) REFERENCES Espece(Id_Espece);
ALTER TABLE Decliner ADD CONSTRAINT fk_id_race_decliner FOREIGN KEY (Id_Race) REFERENCES Race(Id_Race);
ALTER TABLE Planifier ADD CONSTRAINT fk_id_service_planifier FOREIGN KEY (Id_Service) REFERENCES Service(Id_Service);
ALTER TABLE Planifier ADD CONSTRAINT fk_id_horaire_planifier FOREIGN KEY (Id_Horaire) REFERENCES Horaire(Id_Horaire);

