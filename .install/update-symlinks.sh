#!/bin/bash

# to ensure that the relative paths are correct
BASE_PATH="$(realpath "$(dirname "$0")")"
cd "$BASE_PATH" || exit

source ./lib/colors.sh
source ./lib/dir_variables.sh
source ./lib/symlinks.sh
source ./lib/exists.sh

echo -e "${GREEN}"
figlet "Linking..."
echo -e "${NONE}"

create_generic_symlink "$R_DOTCONFIG_DIR/bashrc" "$HOME/.bashrc"
create_generic_symlink "$R_DOTCONFIG_DIR/starship/starship.toml" "$HOME/.config/starship.toml"
create_generic_symlink "$R_DOTCONFIG_DIR/electron-flags.conf" "$HOME/.config/electron-flags.conf"

create_dotfiles_symlink dunst
create_dotfiles_symlink fastfetch
create_dotfiles_symlink fish
create_dotfiles_symlink gtk/gtk-3.0 gtk-3.0
create_dotfiles_symlink gtk/gtk-4.0 gtk-4.0
create_dotfiles_symlink kitty
create_dotfiles_symlink lazygit
create_dotfiles_symlink niri
create_dotfiles_symlink nvim
create_dotfiles_symlink starship
create_dotfiles_symlink swaylock
create_dotfiles_symlink vim
create_dotfiles_symlink wireplumber
create_dotfiles_symlink yazi
create_dotfiles_symlink vesktop
