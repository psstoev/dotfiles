[ -z "$PS1" ] && return

# append to the history file, don't overwrite it
shopt -s histappend
# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

chroot_sep=
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
    chroot_sep=" "
fi

# Set a colored prompt wit git information:
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=true

PS1='${debian_chroot:+($debian_chroot)}${chroot_sep}\[\033[01;36m\]\w\[\033[00m\]\[\033[01;35m\]$(__git_ps1 " (%s)")\[\033[00m\]\n\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Add an "alert" alias for long running commands.  Use like so: $ sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Fakeroot:
FAKEROOT="$HOME/.local"
PATH="$FAKEROOT/bin:$HOME/code/bin:$PATH"

# Enable core dumps:
ulimit -c unlimited

# rbenv && ndenv:
PATH="$HOME/.rbenv/bin:$HOME/.ndenv/bin:$PATH"
eval "$(rbenv init -)"
eval "$(ndenv init -)"

# Export variables:
export GOROOT=$HOME/.local/share/umake/go/go-lang
export GOPATH=$HOME/code

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -z "$TMUX" ]; then
  # we're not in a tmux session

  if [ ! -z "$SSH_TTY" ]; then
    # We logged in via SSH

    # if ssh auth variable is missing
    if [ -z "$SSH_AUTH_SOCK" ]; then
      export SSH_AUTH_SOCK="$HOME/.ssh/.auth_socket"
    fi

    # if socket is available create the new auth session
    if [ ! -S "$SSH_AUTH_SOCK" ]; then
      `ssh-agent -a $SSH_AUTH_SOCK` &gt; /dev/null 2>&1
      echo $SSH_AGENT_PID > $HOME/.ssh/.auth_pid
    fi

    # if agent isn't defined, recreate it from pid file
    if [ -z $SSH_AGENT_PID ]; then
      export SSH_AGENT_PID=`cat $HOME/.ssh/.auth_pid`
    fi

    # Add all default keys to ssh auth
    ssh-add 2>/dev/null

    # start tmux
    tmux attach
  fi
fi
