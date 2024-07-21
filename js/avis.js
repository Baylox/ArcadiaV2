document.addEventListener('DOMContentLoaded', () => {
    const reviewForm = document.getElementById('reviewForm');
    const csrfToken = document.getElementById('csrfToken').value; // Ajout du Token contre attq CRSRF

    reviewForm.addEventListener('submit', function(event) {
        event.preventDefault();

        // Récupération des valeurs du formulaire
        const pseudo = document.getElementById('pseudo').value;
        const commentaire = document.getElementById('commentaire').value;

        // Validation des entrées
        if (!pseudo || !commentaire) {
            alert('Tous les champs sont obligatoires.');
            return;
        }

        // Envoi des données au serveur via Fetch API
        fetch('process_review.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ pseudo: pseudo, commentaire: commentaire, csrfToken: csrfToken })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // Ajouter le nouvel avis à la liste des avis
                const reviewsList = document.getElementById('reviewsList');
                const reviewCard = document.createElement('div');
                reviewCard.className = 'col-md-4 carte-avis';
                reviewCard.innerHTML = `
                    <div class="card">
                        <div class="card-body carte-corps">
                            <h5 class="card-title carte-titre">${pseudo}</h5>
                            <p class="card-text carte-texte">"${commentaire}"</p>
                        </div>
                    </div>
                `;
                reviewsList.appendChild(reviewCard);

                // Réinitialisation du form
                reviewForm.reset();
            } else {
                alert('Une erreur est survenue lors de l\'enregistrement de votre avis.');
            }
        })
        .catch(error => console.error('Erreur:', error));
    });
});

