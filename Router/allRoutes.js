import Route from "./Route.js";

//Définir les routes
export const allRoutes = [
    new Route("/", "Accueil", "/pages/home.html"),
    new Route("/services", "Services", "/pages/services.html"),
    new Route("/avis", "Avis", "/pages/avis.html"),
    new Route("/connexion", "Connexion", "/pages/connexion.html"),
];

export const websiteName = "Arcadia";