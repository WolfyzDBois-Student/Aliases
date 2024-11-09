function archi() {
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "Erreur : Cette commande doit être exécutée dans un dépôt Git."
        return 1
    fi

    last_archi_num=$(git log --oneline | grep -Eo 'archi-[0-9]+' | grep -Eo '[0-9]+' | sort -n | tail -1)
    if [ -z "$last_archi_num" ]; then
        next_archi_num=1  
    else
        next_archi_num=$((last_archi_num + 1))  
    fi

    new_message="archi-$next_archi_num"

    if ! git add -A; then
        echo "Erreur : Échec de l'ajout des fichiers avec git add."
        return 1
    fi

    if ! git commit -m "$new_message"; then
        echo "Erreur : Échec de la création commit."
        return 1
    fi

    if ! git tag -a "$new_message" -m "$new_message"; then
        echo "Erreur : Échec de la création du tag."
        return 1
    fi

    if ! git push --follow-tags; then
        echo "Erreur : Échec du push des commits et des tags."
        return 1
    fi

    echo "Succès : Commit et tag '$new_message' créés et poussés avec succès."
}
