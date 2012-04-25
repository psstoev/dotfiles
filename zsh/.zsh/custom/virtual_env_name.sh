virtual_env_name() {
  # Check for active virtualenv (seems an ugly way, but it's fine for now):
  if [[ -n $VIRTUAL_ENV ]]; then
    export VIRTUAL_ENV_NAME="%F{yellow}(`echo $VIRTUAL_ENV | awk '{gsub(/\/.*\//, "", $1); print $1}'`)%f"
  else
    export VIRTUAL_ENV_NAME=''
  fi
}

# Check for virtualenv when zsh starts:
virtual_env_name
