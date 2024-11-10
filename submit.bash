function submit() {
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "Erreur : Cette commande doit être exécutée dans un dépôt Git."
        return 1
    fi

    last_tag=$(git describe --tags --abbrev=0)
    if [[ ! $last_tag =~ ^archi-[0-9]{4}$ ]]; then
        echo "Erreur : Le dernier tag doit commencer par 'archi-' et avoir quatre chiffres."
        return 1
    fi
    
    last_submit_num=$(git tag | grep -Eo '^submit-[0-9]{4}' | grep -Eo '[0-9]{4}' | sort -n | tail -1)
    if [ -z "$last_submit_num" ]; then
        next_submit_num=1
    else
        next_submit_num=$((10#$last_submit_num + 1))
    fi

    new_message=$(printf "submit-%04d" "$next_submit_num")

    if ! git tag -ma "$new_message" -m "$new_message"; then
        echo "Erreur : Échec de la création du tag '$new_message'."
        return 1
    fi

    if ! git push --follow-tags; then
        echo "Erreur : Échec du push des commits et des tags."
        return 1
    fi

    echo "Succès : Commit et tag '$new_message' créés et poussés avec succès."
}