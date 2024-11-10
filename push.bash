function push() {
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "Erreur : Cette commande doit être exécutée dans un dépôt Git."
        return 1
    fi

    last_push_num=$(git log --oneline | grep -Eo 'push-[0-9]{4}' | grep -Eo '[0-9]{4}' | sort -n | tail -1)
    if [ -z "$last_push_num" ]; then
        next_push_num=1
    else
        next_push_num=$((10#$last_push_num + 1))
    fi

    new_message=$(printf "push-%04d" "$next_push_num")

    if ! git add -A; then
        echo "Erreur : Échec de l'ajout des fichiers avec git add."
        return 1
    fi

    if ! git commit -m "$new_message"; then
        echo "Erreur : Échec de la création du commit."
        return 1
    fi

    if ! git push; then
        echo "Erreur : Échec du push vers le dépôt distant."
        return 1
    fi

    echo "Succès : Commit '$new_message' créé et poussé avec succès."
}