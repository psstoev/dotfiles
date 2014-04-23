#!/bin/bash

# Create the symlinks:
DIRS=`find * -maxdepth 0 -type d | grep -v '^_'`

for config_dir in $DIRS; do
  stow $config_dir;
done

# Add ruby-build:
RBENV_PLUGINS_DIR="$HOME/.rbenv/plugins"
RUBY_BUILD_DIR="$RBENV_PLUGINS_DIR/ruby-build"

if [ ! -L $RUBY_BUILD_DIR ]; then
  mkdir -p $RBENV_PLUGINS_DIR && ln -s $HOME/dotfiles/_ruby-build $RUBY_BUILD_DIR
fi
