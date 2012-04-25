# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/plamen/.zshrc'
# End of lines added by compinstall

# Custom configuration:

source "${HOME}/.zsh/init.sh"

# Custom environment variables:
export EDITOR=${HOME}/.emacs.d/run-emacs.sh
# PATH stuff:
export PATH=$PATH:/opt/gnu/emacs/bin # Emacs
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

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
