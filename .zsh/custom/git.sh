git_branch() {
    # Check for git repo:
    BRANCH=$(git status 2>/dev/null | ack "# On branch (\w+)" --output "\$1")

    if [[ -n $BRANCH ]]; then
        export GIT_BRANCH="%F{red}(git: ${BRANCH})%f"
    else
        export GIT_BRANCH=''
    fi
}
