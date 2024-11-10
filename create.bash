function create () {
    if [[ -z "$1" ]]; then
        echo "Erreur : Veuillez fournir un lien pour cloner."
        return 1
    fi

    echo "Clonage du dépôt depuis le lien : $1"
    git clone "$1"
    if [[ $? -ne 0 ]]; then
        echo "Erreur : Échec du clonage."
        return 1
    fi

    local repo_name=$(basename "$1" .git)
    echo "Nom du dossier du dépôt : $repo_name"

    if [[ ! -d "$repo_name" ]]; then
        echo "Erreur : Le dossier $repo_name n'existe pas."
        return 1
    fi

    cd "$repo_name" || return 1
    echo "Navigué dans le dossier $repo_name."

    echo "Bienvenue dans le projet $repo_name !" >README
    echo "Fichier README créé."

    cat <<EOL >.gitignore
bin/
obj/
.idea/
*~
*.DotSettings.user
*.txt
*.json
EOL
    echo "Fichier .gitignore créé."

    echo "Le dépôt a été cloné et les fichiers README et .gitignore ont été créés."
    git status
}
