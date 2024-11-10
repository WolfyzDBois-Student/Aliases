function create () {
    if [[ -z "$1" ]]; then
        echo -e "\033[0;31mError: Please provide a link to clone.\033[0m"
        return 1
    fi

    echo -e "\033[0;34mClonage du dépôt depuis le lien : $1\033[0m"
    git clone "$1"
    if [[ $? -ne 0 ]]; then
        echo -e "\033[0;31mError: Cloning failed.\033[0m"
        return 1
    fi

    local repo_name=$(basename "$1" .git)
    echo -e "\033[0;34mRepository folder name: $repo_name\033[0m"

    if [[ ! -d "$repo_name" ]]; then
        echo -e "\033[0;31mError: The folder $repo_name does not exist.\033[0m"
        return 1
    fi

    cd "$repo_name" || return 1
    echo -e "\033[0;34mNavigated to the $repo_name folder.\033[0m"

    echo "Welcome in the project $repo_name !" >README
    echo -e "\033[0;34mREADME file created.\033[0m"

    cat <<EOL >.gitignore
bin/
obj/
.idea/
*~
*.DotSettings.user
*.txt
*.json
EOL
    echo -e "\033[0;34m.gitignore file created.\033[0m"

    echo -e "\033[0;32mThe repository has been cloned and README and .gitignore files have been created.\033[0m"
    git status
}