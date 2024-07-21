import Route from "./Route.js";

//Définir les routes
export const allRoutes = [
    new Route("/", "Accueil", "/Public/pages/home.html"),
    new Route("/services", "Services", "/Public//pages/services.html"),
    new Route("/avis", "Avis", "/Public//pages/avis.html"),
    new Route("/connexion", "Connexion", "/Public//pages/connexion.html"),
];

export const websiteName = "Arcadia";