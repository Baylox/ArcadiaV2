-- Création des tables

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'employee', 'veterinarian') NOT NULL
);

CREATE TABLE habitats (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    image_url VARCHAR(255)
);

CREATE TABLE animals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    species VARCHAR(100) NOT NULL,
    image_url VARCHAR(255),
    habitat_id INT,
    FOREIGN KEY (habitat_id) REFERENCES habitats(id)
);

CREATE TABLE veterinary_reports (
    id INT AUTO_INCREMENT PRIMARY KEY,
    animal_id INT,
    status VARCHAR(50) NOT NULL,
    food_type VARCHAR(100) NOT NULL,
    food_quantity INT NOT NULL,
    visit_date DATE NOT NULL,
    details TEXT,
    FOREIGN KEY (animal_id) REFERENCES animals(id)
);

CREATE TABLE services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pseudo VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    is_approved BOOLEAN DEFAULT FALSE
);

CREATE TABLE feeding_records (
    id INT AUTO_INCREMENT PRIMARY KEY,
    animal_id INT,
    food_type VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    feeding_date DATETIME NOT NULL,
    FOREIGN KEY (animal_id) REFERENCES animals(id)
);

CREATE TABLE contact_requests (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    email VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Ajout de l'index pour optimiser les requêtes sur le statut des avis
CREATE INDEX idx_review_approval ON reviews(is_approved);

-- Ajout de l'index pour optimiser les requêtes sur les dates de visite vétérinaire
CREATE INDEX idx_vet_visit_date ON veterinary_reports(visit_date);

-- Ajout de l'index pour optimiser les requêtes sur les dates d'alimentation
CREATE INDEX idx_feeding_date ON feeding_records(feeding_date);