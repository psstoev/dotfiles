# Custom aliases:
source ${HOME}/.zsh/aliases.sh

# Load zshuery stuff:
source ${HOME}/.zsh/zshuery/zshuery.sh
load_defaults
load_aliases
#load_correction
#load_completion ${HOME}/.zsh/zshuery/completion
load_completion ${HOME}/.zsh/completion

# I had to set it again, beacause of some strange bug in Ubuntu
setopt autocd beep

# Custom environment variables:
source ${HOME}/.zsh/variables.sh

# Customized functions:
source ${HOME}/.zsh/functions.sh

# Edit long command with $EDITOR:
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# Custom functions:
for i in ${HOME}/.zsh/custom/*; do
    source $i
done

eval $(keychain --eval --agents ssh -Q --quiet id_rsa)

# Initialize rbenv:
eval "$(rbenv init -)"
