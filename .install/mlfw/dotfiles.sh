#!/bin/bash
# ------------------------------------------------------
# Install dotfiles
# ------------------------------------------------------

dsymlink_dotfiles() {
    name="$1"
    existing_path="~/.config/${name}"
    source_path="~/dotfiles/dotconfig/${name}/"
    target="~/.config"
    _installSymLink "${name}" "${existing_path}" "${source_path}" "${target}"
}

fsymlink_dotfiles() {
    name="$1"
    existing_path="$1";
    source_path="$2";
    target="$3";
    _installSymLink "${name}" "${existing_path}" "${source_path}" "${target}"
}

fsymlink_dotfiles ~/.config/starship.toml ~/dotfiles/dotconfig/starship/starship.toml ~/.config/starship.toml

dsymlink_dotfiles fastfetch
dsymlink_dotfiles fish
dsymlink_dotfiles kitty
dsymlink_dotfiles nvim
dsymlink_dotfiles rofi
dsymlink_dotfiles vim 
dsymlink_dotfiles wezterm
dsymlink_dotfiles yazi

dsymlink_dotfiles dunst
dsymlink_dotfiles hypr
dsymlink_dotfiles waybar
dsymlink_dotfiles swaylock
dsymlink_dotfiles wlogout
dsymlink_dotfiles swappy
dsymlink_dotfiles eww

echo ":: Symbolic links created."
echo

