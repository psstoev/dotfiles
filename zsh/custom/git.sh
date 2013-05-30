git_status() {
    # Ideas and some code stolen from here:
    # http://sebastiancelis.com/2009/11/16/zsh-prompt-git-users/

    # Save the status:
    local git_st="$(git status 2>/dev/null)"
    local -a gst
    gst=(${(f)git_st})

    local branch=''
    if [[ $gst[1] =~ 'Not currently on any branch.' ]]; then
      branch=''
    else
      branch="${gst[1][(w)4]}";
    fi

    local stats=''
    if [[ $gst[2] =~ 'Your branch is' ]]; then
      if [[ $gst[2] =~ 'ahead' ]]; then
        stats='>'
      elif [[ $gst[2] =~ 'diverged' ]]; then
        stats='|/'
      else
        stats='<'
      fi
    fi

    if [[ ! $git_st =~ 'nothing to commit' ]]; then
      stats+='+'
    fi

    if [[ $git_st =~ 'Untracked files' ]]; then
      stats+='?'
    fi

    # Set the GIT_BRANCH variable accordingly:
    if [[ -n $branch ]]; then
      if [[ -n $stats ]]; then
        export GIT_STATUS=" %F{yellow}(${branch}:${stats})%f"
      else
        export GIT_STATUS=" %F{yellow}(${branch})%f"
      fi
    else
        export GIT_STATUS=''
    fi
}

# Check for git repo when zsh starts:
git_status
