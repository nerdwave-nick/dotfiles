#!/bin/bash

# Remove Rofi Calc
if [[ $(_is_installed_pacman "rofi-calc") == 0 ]]; then
    sudo pacman --noconfirm -Rns rofi-calc
    echo_s ":: rofi-calc removed"
    echo
fi

# Remove Rofi
if [[ $(_is_installed_pacman "rofi") == 0 ]]; then
    sudo pacman --noconfirm -Rns rofi
    echo_s ":: rofi removed"
    echo
fi

# Remove Swayidle
if [[ $(_is_installed_pacman "swayidle") == 0 ]]; then
    sudo pacman --noconfirm -Rns swayidle
    echo_s ":: swayidle removed"
    echo
fi

# Remove Swaylock
if [[ $(_is_installed "swaylock-effects-git") == 0 ]]; then
    yay --noconfirm -Rns swaylock-effects-git
    echo_s ":: swaylock removed"
    echo
fi

# Remove rofi-lbonn-wayland
if [[ $(_is_installed "rofi-lbonn-wayland") == 0 ]]; then
    yay --noconfirm -Rns rofi-lbonn-wayland
    echo_s ":: rofi-lbonn-wayland removed"
    echo
fi

# Remove hypridle-bin
if [[ $(_is_installed "hypridle-git") == 0 ]]; then
    yay --noconfirm -Rns hypridle-git
    if [ -f /usr/lib/debug/usr/bin/hypridle.debug ] ;then
        sudo rm /usr/lib/debug/usr/bin/hypridle.debug
        echo ":: /usr/lib/debug/usr/bin/hypridle.debug removed"
    fi
    echo_s ":: hypridle-git uninstalled."
    echo_s ":: hypridle can now be installed."
    echo 
fi

# Remove hyprlock-bin
if [[ $(_is_installed "hyprlock-git") == 0 ]]; then
    yay --noconfirm -Rns hyprlock-git
    if [ -f /usr/lib/debug/usr/bin/hyprlock.debug ] ;then
        sudo rm /usr/lib/debug/usr/bin/hyprlock.debug
        echo ":: /usr/lib/debug/usr/bin/hyprlock.debug removed"
    fi
    echo_s ":: hyprlock-git uninstalled."
    echo_s ":: hyprlock can now be installed."
    echo
fi

