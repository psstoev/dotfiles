# Customize zsh's functions:

# Draw the prompt:
precmd() {
    # Check for active virtualenv:
    virtual_env_name
    # check for git repo info:
    git_status
    PROMPT="${VIRTUAL_ENV_NAME}%F{green}%B%n%b%f@%F{green}%B%m%b%f %F{blue}%B%~%b%f${GIT_STATUS}$ "
}
