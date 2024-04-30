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

create_file_symlink() {
  echo "Attempting to create symlink for file $DOTFILES_DIR/$1 to $2"
  if [ -f $2 ]; then
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

# fastfetch
create_dir_symlink dotconfig/fastfetch ~/.config/fastfetch

# kitty
create_dir_symlink dotconfig/kitty ~/.config/kitty

# awesome wm
create_dir_symlink dotconfig/awesome ~/.config/awesome

# picom
create_dir_symlink dotconfig/picom ~/.config/picom

# fish
create_dir_symlink dotconfig/fish ~/.config/fish

# oh my fish
create_dir_symlink dotconfig/omf ~/.config/omf
 
# starship
create_file_symlink dotconfig/starship/starship.toml ~/.config/starship.toml

# bashrc
create_file_symlink dotconfig/bashrc ~/.bashrc
