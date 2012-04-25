# Customize zsh's functions:

# Check for interesting directories:
chpwd() {
    git_branch
}

# Draw the prompt:
precmd() {
    export PROMPT="
%F{green}%B%n%b%f@%F{green}%B%m%b%f %F{blue}%B%~%b%f ${GIT_BRANCH}
→  "
}
