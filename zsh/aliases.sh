# Aliases:

# Silence which's errors:
alias which='which 2>/dev/null'

alias ll='ls -l --color=auto'

# Check for ack-grep (ack):
which ack-grep 2>/dev/null >/dev/null
if [[ $? -eq 0 ]]; then
    alias ack='ack-grep'
fi

# Emacs client:
alias emacsclient='/opt/gnu/bin/emacsclient -c -a "" -q'

# Steal aliases from Veselin:

# Git
alias g="git"

alias gb="git branch"
alias gbd="git branch -D"

alias gl="git log --graph --pretty=format':%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset'"
alias gpr="git pull --rebase"

alias ga="git add"
alias gaa="git add -A"

alias gc="git commit"
alias gcm="git commit -m"

alias gr="git rebase"
alias gra="git rebase --abort"
alias grc="git rebase --continue"

alias grh="git reset HEAD --hard"
alias grs="git reset HEAD\^ --soft"

alias gcf="git clean -f"
alias gcd="git clean -d"

alias gs="git stash"
alias gsp="git stash pop"

alias gd="git diff"
alias gdc="git diff --cached"

alias gst="git status"
alias gco="git checkout"

function gci () {
  git commit -m "$*"
}

# Ruby
alias ree="RUBY_HEAP_MIN_SLOTS=1000000 RUBY_HEAP_SLOTS_INCREMENT=1000000 RUBY_HEAP_SLOTS_GROWTH_FACTOR=1 RUBY_GC_MALLOC_LIMIT=1000000000 RUBY_HEAP_FREE_MIN=500000"
alias b="bundle"
alias be="bundle exec"

alias cuke="clear && be cucumber --drb"
alias spec="clear && be rspec --drb"

alias spj="be specjour"
alias spjs="be specjour spec"
alias spjf="be specjour features"

alias rdm="rake db:migrate"
alias rdmr="rake db:migrate:reset"
alias rdtp="rake db:test:prepare"

alias rgm="rails g migration"

alias spr="ree be spork rspec"
alias spc="ree be spork cucumber"

# Projects
alias lookk="cd ~/code/work/garmz/"
alias garmz="cd ~/code/work/garmz/"

# End of the theft.