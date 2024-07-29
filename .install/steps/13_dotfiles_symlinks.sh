#!/bin/bash

echo -e "${GREEN}"
figlet "Linking..."
echo -e "${NONE}"

create_generic_symlink "$R_DOTCONFIG_DIR/bashrc" "$HOME/.bashrc"

create_dotfiles_symlink alacritty
create_dotfiles_symlink dunst
create_dotfiles_symlink eww
create_dotfiles_symlink fastfetch
create_dotfiles_symlink fish
create_dotfiles_symlink gtk
create_dotfiles_symlink hypr
create_dotfiles_symlink kitty
create_dotfiles_symlink nvim
create_dotfiles_symlink rofi
create_dotfiles_symlink sddm
create_dotfiles_symlink starship
create_dotfiles_symlink swappy
create_dotfiles_symlink vim
create_dotfiles_symlink wal
create_dotfiles_symlink waybar
create_dotfiles_symlink wezterm
create_dotfiles_symlink wlogout
create_dotfiles_symlink yazi
