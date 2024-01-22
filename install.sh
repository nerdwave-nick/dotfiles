#!/bin/env bash

SCRIPT_PATH="${BASH_SOURCE:-$0}"
ABS_SCRIPT_PATH="$(realpath "${SCRIPT_PATH}")"
DOTFILES_DIR="$(dirname "${ABS_SCRIPT_PATH}")"

create_dir_symlink() {
  echo "Attempting to create symlink for $DOTFILES_DIR/$1 to $2"
  if [ -d $2 ]; then
    echo "$2 already exists, skipping"
    return
  fi
  ln -s $DOTFILES_DIR/$1 $2
}

######################################################################################

# wezterm
create_dir_symlink dotconfig/wezterm ~/.config/wezterm

# nvim
create_dir_symlink dotconfig/nvim ~/.config/nvim

