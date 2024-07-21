CREATE TABLE Users(
   Id_User VARCHAR(50),
   Email_User VARCHAR(50),
   Password_User VARCHAR(50),
   Name_User VARCHAR(50) NOT NULL,
   Firstname_User VARCHAR(50) NOT NULL,
   Dob_User VARCHAR(50),
   PRIMARY KEY(Id_User)
);

CREATE TABLE role(
   Id_role COUNTER,
   label VARCHAR(50),
   Type_User VARCHAR(50),
   PRIMARY KEY(Id_role)
);

CREATE TABLE alimentation_animaux(
   Id_alimentation INT,
   nom_nourriture TEXT NOT NULL,
   quantite_nourriture DECIMAL(15,4) NOT NULL,
   date_alimentation DATETIME NOT NULL,
   commentaire_veterinaire TEXT,
   PRIMARY KEY(Id_alimentation)
);

CREATE TABLE soins_animaux(
   Id_traitement INT,
   Description_soin VARCHAR(50) NOT NULL,
   Date_soin DATETIME NOT NULL,
   PRIMARY KEY(Id_traitement)
);

CREATE TABLE habitat(
   Id_habitat INT,
   nom VARCHAR(50) NOT NULL,
   description TEXT,
   type_habitat VARCHAR(6) NOT NULL,
   PRIMARY KEY(Id_habitat)
);

CREATE TABLE image(
   Id_image INT,
   image_date INT,
   PRIMARY KEY(Id_image)
);

CREATE TABLE espece(
   Id_espece INT,
   type_espece VARCHAR(50) NOT NULL,
   evaluation_extinction VARCHAR(50),
   traits_cacteristiques TEXT,
   PRIMARY KEY(Id_espece)
);

CREATE TABLE race(
   Id_race INT,
   label VARCHAR(50),
   description TEXT,
   habitat_naturel VARCHAR(50),
   PRIMARY KEY(Id_race)
);

CREATE TABLE service(
   Id_service COUNTER,
   nom VARCHAR(50),
   description_service VARCHAR(50),
   PRIMARY KEY(Id_service)
);

CREATE TABLE horaire(
   Id_horaire INT,
   jour_semaine DATE NOT NULL,
   heure_debut TIME NOT NULL,
   heure_fin TIME NOT NULL,
   PRIMARY KEY(Id_horaire)
);

CREATE TABLE avis(
   Id_avis INT,
   pseudo VARCHAR(50),
   commentaire VARCHAR(50),
   status_avis VARCHAR(50) NOT NULL,
   isVisible LOGICAL NOT NULL,
   PRIMARY KEY(Id_avis)
);

CREATE TABLE Zoo(
   Id_Zoo INT,
   Zoo_Adress VARCHAR(50) NOT NULL,
   Telephone_Number VARCHAR(15) NOT NULL,
   Id_User VARCHAR(50) NOT NULL,
   PRIMARY KEY(Id_Zoo),
   FOREIGN KEY(Id_User) REFERENCES Users(Id_User)
);

CREATE TABLE animal(
   Id_animal INT,
   prenom VARCHAR(50) NOT NULL,
   etat VARCHAR(50) NOT NULL,
   sexe VARCHAR(7) NOT NULL,
   Description_animal VARCHAR(50),
   Dob_animal DATE NOT NULL,
   Id_image INT NOT NULL,
   Id_habitat INT NOT NULL,
   PRIMARY KEY(Id_animal),
   FOREIGN KEY(Id_image) REFERENCES image(Id_image),
   FOREIGN KEY(Id_habitat) REFERENCES habitat(Id_habitat)
);

CREATE TABLE rapport(
   Id_rapport INT,
   date_rapport DATE NOT NULL,
   details TEXT,
   type VARCHAR(12),
   Id_User VARCHAR(50) NOT NULL,
   Id_animal INT NOT NULL,
   Id_traitement INT NOT NULL,
   Id_alimentation INT NOT NULL,
   PRIMARY KEY(Id_rapport),
   FOREIGN KEY(Id_User) REFERENCES Users(Id_User),
   FOREIGN KEY(Id_animal) REFERENCES animal(Id_animal),
   FOREIGN KEY(Id_traitement) REFERENCES soins_animaux(Id_traitement),
   FOREIGN KEY(Id_alimentation) REFERENCES alimentation_animaux(Id_alimentation)
);

CREATE TABLE posseder(
   Id_User VARCHAR(50),
   Id_role INT,
   PRIMARY KEY(Id_User, Id_role),
   FOREIGN KEY(Id_User) REFERENCES Users(Id_User),
   FOREIGN KEY(Id_role) REFERENCES role(Id_role)
);

CREATE TABLE appartenir(
   Id_animal INT,
   Id_espece INT,
   PRIMARY KEY(Id_animal, Id_espece),
   FOREIGN KEY(Id_animal) REFERENCES animal(Id_animal),
   FOREIGN KEY(Id_espece) REFERENCES espece(Id_espece)
);

CREATE TABLE décliner(
   Id_espece INT,
   Id_race INT,
   PRIMARY KEY(Id_espece, Id_race),
   FOREIGN KEY(Id_espece) REFERENCES espece(Id_espece),
   FOREIGN KEY(Id_race) REFERENCES race(Id_race)
);

CREATE TABLE planifier(
   Id_service INT,
   Id_horaire INT,
   PRIMARY KEY(Id_service, Id_horaire),
   FOREIGN KEY(Id_service) REFERENCES service(Id_service),
   FOREIGN KEY(Id_horaire) REFERENCES horaire(Id_horaire)
);
