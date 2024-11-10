function submit() {
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo -e "\033[0;31mError: This command must be executed in a Git repository.\033[0m"
        return 1
    fi

    last_tag=$(git describe --tags --abbrev=0)
    if [[ ! $last_tag =~ ^archi-[0-9]{4}$ ]]; then
        echo -e "\033[0;31mError: The last tag must start with 'archi-' and have four digits.\033[0m"
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
        echo -e "\033[0;31mError: Failed to create tag '$new_message'.\033[0m"
        return 1
    fi

    if ! git push --follow-tags; then
        echo -e "\033[0;31mErreur : Échec du push des commits et des tags.\033[0m"
        return 1
    fi

    echo -e "\033[0;32mSuccess: New tag '$new_message' created and pushed successfully.\033[0m"
}