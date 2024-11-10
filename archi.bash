function archi() {
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo -e "\033[0;31mError: This command must be executed in a Git repository.\033[0m"
        return 1
    fi

    if ! git add -A; then
        echo -e "\033[0;31mError: Failed to add files with git add.\033[0m"
        return 1
    fi

    last_archi_num=$(git tag | grep -Eo '^archi-[0-9]{4}' | grep -Eo '[0-9]{4}' | sort -n | tail -1)
    if [ -z "$last_archi_num" ]; then
        next_archi_num=1
    else
        next_archi_num=$((10#$last_archi_num + 1))
    fi

    new_message=$(printf "archi-%04d" "$next_archi_num")

    if ! git commit -m "$new_message"; then
        echo -e "\033[0;31mError: Failed to create commit.\033[0m"
        return 1
    fi

    if ! git tag -ma "$new_message" -m "$new_message"; then
        echo -e "\033[0;31mError: Failed to create tag'$new_message'.\033[0m"
        return 1
    fi

    if ! git push --follow-tags; then
        echo -e "\033[0;31mError: Failed to push commits and tags.\033[0m"
        return 1
    fi

    echo -e "\033[0;32mSuccess: Commit and tag '$new_message' created and pushed successfully.\033[0m"
}