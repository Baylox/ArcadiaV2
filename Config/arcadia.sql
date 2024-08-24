CREATE DATABASE zoo_db;

USE zoo_db;

-- Table des utilisateurs
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'employee', 'vet') NOT NULL
);

-- Table des habitats
CREATE TABLE habitats (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- Table des animaux
CREATE TABLE animals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    species VARCHAR(255) NOT NULL,
    habitat_id INT,
    FOREIGN KEY (habitat_id) REFERENCES habitats(id) ON DELETE SET NULL
);

-- Table des comptes rendus des vétérinaires
CREATE TABLE vet_reports (
    id INT AUTO_INCREMENT PRIMARY KEY,
    animal_id INT,
    vet_id INT,
    status TEXT NOT NULL,
    food_type VARCHAR(255),
    food_quantity DECIMAL(5, 2),
    visit_date DATE NOT NULL,
    FOREIGN KEY (animal_id) REFERENCES animals(id) ON DELETE CASCADE,
    FOREIGN KEY (vet_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Table des services
CREATE TABLE services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- Table des avis
CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pseudo VARCHAR(255),
    review TEXT,
    is_approved BOOLEAN DEFAULT FALSE
);

-- Table des statistiques de visites
CREATE TABLE visits (
    id INT AUTO_INCREMENT PRIMARY KEY,
    animal_id INT,
    visit_count INT DEFAULT 1,
    FOREIGN KEY (animal_id) REFERENCES animals(id) ON DELETE CASCADE
);
