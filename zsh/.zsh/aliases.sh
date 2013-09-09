# Aliases:

# Silence which's errors:
alias which='which 2>/dev/null'

alias ll='ls -l --color=auto'

# Check for ack-grep (ack):
which ack-grep 2>/dev/null >/dev/null
if [[ $? -eq 0 ]]; then
    alias ack='ack-grep'
fi
