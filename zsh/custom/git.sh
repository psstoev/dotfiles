git_branch() {
    # Check for git repo:
    BRANCH=$(git status 2>/dev/null | grep "# On branch" | awk '{ print $4; }')

    # Set the GIT_BRANCH variable accordingly:
    if [[ -n $BRANCH ]]; then
        export GIT_BRANCH=" %F{red}(${BRANCH})%f"
    else
        export GIT_BRANCH=''
    fi
}

# Check for git repo when zsh starts:
git_branch
