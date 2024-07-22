<?php
namespace App\Config;

use PDO;
use PDOException;

class Database {
    private $host = 'localhost';
    private $username = 'root';
    private $password = '';
    private $connexion;

    public function __construct() {
        try {
            $this->connexion = new PDO("mysql:host=$this->host", $this->username, $this->password);
            $this->connexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $error) {
            die("Erreur de connexion à la base de données: " . $error->getMessage());
        }
    }
        public function getConnexion() {
            return $this->connexion;
        }
    public function setupDatabase() {
        try {
            $sql = file_get_contents('arcadia.sql');
            $this->connexion->exec($sql);
            echo "La base de données et les tables ont été créées avec succès!";
        } catch (PDOException $error) {
            die("Erreur lors de la création de la base de données: " . $error->getMessage());
        }
    }
}


$database = new Database();
$database->setupDatabase();
