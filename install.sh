#!/bin/bash

# Create the symlinks:
DIRS=`find * -maxdepth 0 -type d`

for config_dir in $DIRS; do
  stow $config_dir;
done
