function push() {
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo -e "\033[0;31mError: This command must be executed in a Git repository.\033[0m"
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
        echo -e "\033[0;31mError: Failed to add files with git add.\033[0m"
        return 1
    fi

    if ! git commit -m "$new_message"; then
        echo -e "\033[0;31mError: Failed to create commit.\033[0m"
        return 1
    fi

    if ! git push; then
        echo -e "\033[0;31mError: Push to remote repository failed.\033[0m"
        return 1
    fi

   echo -e "\033[0;32mSuccess: Commit '$new_message' created and pushed successfully.\033[0m"
}