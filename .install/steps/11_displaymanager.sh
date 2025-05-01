# ------------------------------------------------------
# Disable display manager
# ------------------------------------------------------
disman=0
echo -e "${GREEN}"
figlet "Display Manager"
echo -e "${NONE}"

echo "IMPORTANT: Starting Hyprland works from tty (terminal) with command Hyprland (recommended)."
echo "or you can try the display manager SDDM (> 0.20.0 already installed) or the latest git version (yay -S sddm)."
echo "Please check: https://wiki.hyprland.org/hyprland-wiki/pages/Getting-Started/Master-Tutorial/#launching-hyprland"
echo "Login with other display managers could fail and could have negative side effects on some devices."
echo "If you have issues with SDDM or other display managers, you can deactivate the display manager"
echo "at any time with the Hyprland settings script (Start from Waybar or with SUPER+CTRL+S)."
echo ""

if [ -f /etc/systemd/system/display-manager.service ]; then
    disman=0
    echo "You have already installed a display manager. If your display manager is working fine, you can keep the current setup."
    echo "How do you want to proceed?"
    echo
    dmsel=$(gum choose "Keep current setup" "Deactivate current display manager" "Install sddm and theme")
else
    disman=1
    echo "There is no display manager installed on your system. You're starting Hyprland with commands on tty."
    echo "How do you want to proceed?"
    echo
    dmsel=$(gum choose "Keep current setup" "Install sddm and theme")
fi

if [ -z "${dmsel}" ]; then
    echo ":: Installation canceled."
    exit
fi

if [ "$dmsel" == "Install sddm and theme" ]; then

    # Try to force the installation of sddm
    echo ":: Install sddm"
    yay -S --noconfirm sddm --ask 4
    yay -S --noconfirm --needed sddm qt5-graphicaleffects qt5-quickcontrols2 qt5-svg --ask 4

    # Enable sddm
    if [ -f /etc/systemd/system/display-manager.service ]; then
        sudo rm /etc/systemd/system/display-manager.service
    fi
    sudo systemctl enable sddm.service

    # Create sddm.conf.d folder
    if [ ! -d /etc/sddm.conf.d/ ]; then
        sudo mkdir /etc/sddm.conf.d
        echo ":: Folder /etc/sddm.conf.d created."
    fi

    # Copy sddm.conf
    sudo cp "${R_DOTCONFIG_DIR}/sddm/sddm.conf" "/etc/sddm.conf.d/"
    echo_s ":: File /etc/sddm.conf.d/sddm.conf updated."

    # Download and install sugar candy theme if not exists
    if [ ! -d /usr/share/sddm/themes/sugar-candy ]; then
        if [ -f ~/Downloads/sddm-sugar-candy-master.zip ]; then
            rm ~/Downloads/sddm-sugar-candy-master.zip
        fi
        wget -P ~/Downloads/ https://framagit.org/MarianArlt/sddm-sugar-candy/-/archive/master/sddm-sugar-candy-master.zip
        if [ -f ~/Downloads/sddm-sugar-candy-master.zip ]; then
            unzip -o -q ~/Downloads/sddm-sugar-candy-master.zip -d ~/Downloads/
            if [ ! -d /usr/share/sddm/themes/sugar-candy ]; then
                sudo mkdir -p /usr/share/sddm/themes/sugar-candy
            fi
            sudo cp -r ~/Downloads/sddm-sugar-candy-master/* /usr/share/sddm/themes/sugar-candy
            echo_s ":: SDDM Sugar Candy Theme installed"
        else
            echo_e "ERROR: Sugar Candy Download not found"
        fi
    fi

    # Install background wallpaper for sddm
    if [ -f /usr/share/sddm/themes/sugar-candy/theme.conf ]; then
        sudo cp "${R_WALLPAPERS_DIR}/cherry_blossoms.jpg" /usr/share/sddm/themes/sugar-candy/Backgrounds/current_wallpaper.jpg
        echo_s ":: Default wallpaper copied into /usr/share/sddm/themes/sugar-candy/Backgrounds/"
        sudo cp "${R_DOTCONFIG_DIR}/sddm/theme.conf" /usr/share/sddm/themes/sugar-candy/
        sudo sed -i 's/CURRENTWALLPAPER/'"current_wallpaper.jpg"'/' /usr/share/sddm/themes/sugar-candy/theme.conf
        echo_s ":: File theme.conf updated in /usr/share/sddm/themes/sugar-candy/"
    fi

elif [ "$dmsel" == "Deactivate current display manager" ]; then

    sudo rm /etc/systemd/system/display-manager.service
    echo_s ":: Current display manager deactivated."

elif [ "$dmsel" == "Keep current setup" ]; then
    echo ":: sddm setup skipped."
else
    echo ":: sddm setup skipped."
fi
