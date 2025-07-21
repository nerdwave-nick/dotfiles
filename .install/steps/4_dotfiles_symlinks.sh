#!/bin/bash

echo -e "${GREEN}"
figlet "Linking..."
echo -e "${NONE}"

create_generic_symlink "$R_DOTCONFIG_DIR/starship.toml" "$HOME/.config/starship.toml"
create_generic_symlink "$R_DOTCONFIG_DIR/tmux.conf" "$HOME/.tmux.conf"
create_generic_symlink "$R_DOTCONFIG_DIR/electron-flags.conf" "$HOME/.config/electron-flags.conf"

create_dotfiles_symlink fastfetch
create_dotfiles_symlink fish
create_dotfiles_symlink ghostty
create_dotfiles_symlink lazygit
# needs extra cases
if grep -Fxq "source = $R_DOTCONFIG_DIR/hypr/custom.conf" "$HOME/.config/hypr/hyprland.conf"; then
    echo_c "Custom config already exists, skipping" $PURPLE
else
    echo_c "Adding custom config to hyprland.conf" $PURPLE
fi
