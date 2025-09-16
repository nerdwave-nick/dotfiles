#!/bin/bash

figlet -f drpepper "Linking..."

if gum confirm "Overwrite starship config?"; then
    create_generic_symlink "$R_DOTCONFIG_DIR/starship.toml" "$HOME/.config/starship.toml"
fi
if gum confirm "Overwrite tmux config?"; then
    create_generic_symlink "$R_DOTCONFIG_DIR/tmux.conf" "$HOME/.tmux.conf"
fi
if gum confirm "Overwrite electron-flags?"; then
    create_generic_symlink "$R_DOTCONFIG_DIR/electron-flags.conf" "$HOME/.config/electron-flags.conf"
fi
if gum confirm "Overwrite tmux config?"; then
    create_generic_symlink "$R_DOTCONFIG_DIR/tmux.conf" "$HOME/.tmux.conf"
fi

if gum confirm "Overwrite fastfetch config?"; then
    create_dotfiles_symlink fastfetch
fi
if gum confirm "Overwrite fish config?"; then
    create_dotfiles_symlink fish
fi
if gum confirm "Overwrite ghostty config?"; then
    create_dotfiles_symlink ghostty
fi
if gum confirm "Overwrite fontconfig config?"; then
    create_dotfiles_symlink fontconfig 
fi
if gum confirm "Overwrite lazygit config?"; then
    create_dotfiles_symlink lazygit
fi
if gum confirm "Overwrite waybar config?"; then
    create_dotfiles_symlink waybar
fi

# needs extra cases
if gum confirm "Add hyprland config?"; then
    if grep -Fxq "source = $R_DOTCONFIG_DIR/hypr/custom.conf" "$HOME/.config/hypr/hyprland.conf"; then
        echo_c "Custom config already exists, skipping" $PURPLE
    else
        echo_c "Adding custom config to hyprland.conf" $PURPLE
        create_generic_symlink "$R_DOTCONFIG_DIR/hypr/monitors.conf" "$HOME/.config/hypr/monitors.conf"
        echo_c "Adding custom config to hyprland.conf" $PURPLE
        echo "source = $R_DOTCONFIG_DIR/hypr/custom.conf" >> "$HOME/.config/hypr/hyprland.conf"
        hyprctl reload
        echo_s "Custom hyprland config added"
    fi
fi
