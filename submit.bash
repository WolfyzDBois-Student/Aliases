function submit() {
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "Erreur : Cette commande doit être exécutée dans un dépôt Git."
        return 1
    fi

    last_commit_message=$(git log -1 --pretty=%s)
    if [[ ! $last_commit_message =~ ^archi-[0-9]+$ ]]; then
        echo "Erreur : Le dernier commit doit être un tag commençant par 'archi-'."
        return 1
    fi


    last_submit_num=$(git log --oneline | grep -Eo 'submit-[0-9]+' | grep -Eo '[0-9]+' | sort -n | tail -1)
    if [ -z "$last_submit_num" ]; then
        next_submit_num=1  
    else
        next_submit_num=$((last_submit_num + 1))  
    fi

    new_message="submit-$next_submit_num"

    if ! git commit --amend -m "$new_message"; then
        echo "Erreur : Échec de la création du commit '$new_message'."
        return 1
    fi

    if ! git tag -a "$new_message" -m "$new_message"; then
        echo "Erreur : Échec de la création du tag '$new_message'."
        return 1
    fi

    if ! git push --follow-tags; then
        echo "Erreur : Échec du push des commits et des tags."
        return 1
    fi

    echo "Succès : Commit et tag '$new_message' créés et poussés avec succès."
}
