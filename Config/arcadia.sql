-- Insertion des données dans les tables

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
('Jungle', 'Habitat pour animaux de la jungle', 'extérieur'),
('Marais', 'Habitat pour animaux des marais', 'extérieur');

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
('Tigre', 'En danger', 'Félin puissant'),
('Éléphant', 'Menacé', 'Grand herbivore'),
('Crocodile', 'Non menacé', 'Grand reptile'),
('Girafe', 'Non menacé', 'Grand herbivore avec un long cou');

-- Insertion dans la table Race
INSERT INTO `Race` (`Label`, `Description`, `Habitat_Naturel`) VALUES
('Lion d\'Afrique', 'Grand lion d\'Afrique', 'Savane'),
('Tigre du Bengale', 'Grand tigre du Bengale', 'Jungle'),
('Éléphant d\'Afrique', 'Grand éléphant d\'Afrique', 'Savane'),
('Crocodile du Nil', 'Grand crocodile du Nil', 'Marais'),
('Girafe de Masaï', 'Girafe avec des taches distinctes', 'Savane');

-- Insertion dans la table Service
INSERT INTO `Service` (`Nom`, `Description_Service`) VALUES
('Visite guidée', 'Visite guidée du zoo'),
('Atelier pour enfants', 'Atelier éducatif pour enfants'),
('Spectacle de fauves', 'Spectacle avec des lions et des tigres'),
('Nourrissage des animaux', 'Participation au nourrissage des animaux'),
('Rencontre avec les soigneurs', 'Discussion avec les soigneurs du zoo');

-- Insertion dans la table Horaire
INSERT INTO `Horaire` (`Jour_Semaine`, `Heure_Debut`, `Heure_Fin`) VALUES
('Lundi', '09:00:00', '17:00:00'),
('Mardi', '09:00:00', '17:00:00'),
('Mercredi', '09:00:00', '17:00:00'),
('Jeudi', '09:00:00', '17:00:00'),
('Vendredi', '09:00:00', '17:00:00');

-- Insertion dans la table Avis
INSERT INTO `Avis` (`Pseudo`, `Commentaire`, `Status_Avis`, `IsVisible`) VALUES
('user1', 'Super zoo!', 'Approuvé', 1),
('user2', 'Très intéressant!', 'Approuvé', 1),
('user3', 'Les enfants ont adoré!', 'Approuvé', 1),
('user4', 'Bien entretenu', 'Approuvé', 1),
('user5', 'Personnel accueillant', 'Approuvé', 1);

-- Insertion dans la table Zoo
INSERT INTO `Zoo` (`Zoo_Address`, `Telephone_Number`, `Id_User`) VALUES
('123 Zoo Lane', '0123456789', 'user1'),
('456 Safari Road', '0987654321', 'user2'),
('789 Jungle Path', '0234567891', 'user3'),
('101 Desert Way', '0345678912', 'user4'),
('202 Wetland Drive', '0456789123', 'user5');

-- Insertion dans la table Animal
INSERT INTO `Animal` (`Prenom`, `Etat`, `Sexe`, `Description_Animal`, `Dob_Animal`, `Id_Image`, `Id_Habitat`) VALUES
('Simba', 'Bonne santé', 'Mâle', 'Lion adulte', '2015-06-01', 1, 1),
('Shera', 'Bonne santé', 'Femelle', 'Tigre adulte', '2016-03-11', 2, 2),
('Dumbo', 'Bonne santé', 'Mâle', 'Éléphant jeune', '2014-07-21', 3, 1),
('Croc', 'Bonne santé', 'Mâle', 'Crocodile adulte', '2013-11-30', 4, 3),
('Twiga', 'Bonne santé', 'Femelle', 'Girafe adulte', '2012-04-15', 5, 1);

-- Insertion dans la table Rapport
INSERT INTO `Rapport` (`Date_Rapport`, `Details`, `Type`, `Id_User`, `Id_Animal`, `Id_Traitement`, `Id_Alimentation`) VALUES
('2024-01-07', 'Vaccination annuelle', 'Santé', 'user1', 1, 1, 1),
('2024-01-08', 'Examen de routine', 'Santé', 'user2', 2, 2, 2),
('2024-01-09', 'Détartrage des dents', 'Santé', 'user3', 3, 3, 3),
('2024-01-10', 'Bain médicalisé', 'Santé', 'user4', 4, 4, 4),
('2024-01-11', 'Analyse sanguine', 'Santé', 'user5', 5, 5, 5);

-- Insertion dans la table Posseder
INSERT INTO `Posseder` (`Id_User`, `Id_Role`) VALUES
('user1', 1),
('user2', 2),
('user3', 3),
('user4', 4),
('user5', 5);

-- Insertion dans la table Appartenir
INSERT INTO `Appartenir` (`Id_Animal`, `Id_Espece`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Insertion dans la table Decliner
INSERT INTO `Decliner` (`Id_Espece`, `Id_Race`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Insertion dans la table Planifier
INSERT INTO `Planifier` (`Id_Service`, `Id_Horaire`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
