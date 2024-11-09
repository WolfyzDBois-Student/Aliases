
function push() {
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "Erreur : Cette commande doit être exécutée dans un dépôt Git."
        return 1
    fi

    if ! git add -A; then
        echo "Erreur : Échec de l'ajout des fichiers avec git add."
        return 1
    fi

    if ! git commit -m "tempory message for commit"; then
        echo "Erreur : Échec de la création du commit temporaire."
        return 1
    fi

    commit_id=$(git rev-parse --short HEAD)
    if [ -z "$commit_id" ]; then
        echo "Erreur : Impossible de récupérer l'ID du commit."
        return 1
    fi

    if ! git commit --amend -m "$commit_id"; then
        echo "Erreur : Échec de la modification du message du commit."
        return 1
    fi

    if ! git push; then
        echo "Erreur : Échec du push vers le dépôt distant."
        return 1
    fi

    echo "Succès : Commit '$commit_id' créé et poussé avec succès."
}


