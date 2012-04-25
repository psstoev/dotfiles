# Load zshuery stuff:
source ${HOME}/.zsh/zshuery/zshuery.sh
load_defaults
load_aliases
load_correction
load_completion ${HOME}/.zsh/zshuery/completion

# I had to set it again, beacause of some strange bug in Ubuntu
setopt autocd beep

# Aliases:
alias ll='ls -l --color=auto'
# Check for ack-grep (ack):
which ack-grep 2>/dev/null >/dev/null
if [[ $? -eq 0 ]]; then
    alias ack='ack-grep'
fi

# Custom functions:
source ${HOME}/.zsh/custom/git.sh

# Check for git repo when zsh starts:
git_branch
