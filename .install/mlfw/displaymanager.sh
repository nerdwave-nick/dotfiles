#!/bin/bash
# ------------------------------------------------------
# Disable display manager
# ------------------------------------------------------
disman=0
profile="Hyprland"
echo -e "${GREEN}"
figlet "Display Manager"
echo -e "${NONE}"
if [[ $profile == *"Hyprland"* ]]; then
    echo "IMPORTANT: Starting Hyprland works from tty (terminal) with command Hyprland (recommended)." 
    echo "or you can try the display manager SDDM (> 0.20.0 already installed) or the latest git version (yay -S sddm)."
    echo "Please check: https://wiki.hyprland.org/hyprland-wiki/pages/Getting-Started/Master-Tutorial/#launching-hyprland"
    echo "Login with other display managers could fail and could have negative side effects on some devices."
    echo "If you have issues with SDDM or other display managers, you can deactivate the display manager"
    echo "at any time with the Hyprland settings script (Start from Waybar or with SUPER+CTRL+S)."
    echo ""
fi

if [ ! -d ~/dotfiles ];then
    if [ -f /etc/systemd/system/display-manager.service ]; then
        disman=0
        echo "You have already installed a display manager on your system."
        echo "How do you want to proceed?"
        echo
        dmsel=$(gum choose "Keep current setup" "Deactivate current display manager" "Install sddm and theme")
    else
        disman=1
        echo "There is no display manager installed on your system."
        echo "After the installation/update of the dotfiles, you can start Hyprland with command Hyprland and Qtile with commmand Qtile (or startx)."
        echo "How do you want to proceed?"
        echo
        dmsel=$(gum choose "Keep current setup" "Install sddm and theme")
    fi
else
    if [ -f /etc/systemd/system/display-manager.service ]; then
        disman=0
        echo "You have already installed a display manager. If your display manager is working fine, you can keep the current setup."
        echo "How do you want to proceed?"
        echo
        dmsel=$(gum choose "Keep current setup" "Deactivate current display manager" "Install sddm and theme")
    else
        disman=1
        echo "There is no display manager installed on your system. You're starting Hyprland/Qtile with commands on tty."
        echo "How do you want to proceed?"
        echo
        dmsel=$(gum choose "Keep current setup" "Install sddm and theme")
    fi
fi

if [ -z "${dmsel}" ] ;then
    echo ":: Installation canceled."
    exit
fi
if [ "$dmsel" == "Install sddm and theme" ] ;then

    disman=0
    # Try to force the installation of sddm
    echo ":: Install sddm"
    yay -S --noconfirm sddm --ask 4

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
    sudo cp ../sddm/sddm.conf /etc/sddm.conf.d/
    echo ":: File /etc/sddm.conf.d/sddm.conf updated."

    # Download and install sugar candy theme if not exists
    if [ ! -d /usr/share/sddm/themes/sugar-candy ]; then
        if [ -f ~/Downloads/sddm-sugar-candy-master.zip ] ;then
            rm ~/Downloads/sddm-sugar-candy-master.zip
        fi
        wget -P ~/Downloads/ https://framagit.org/MarianArlt/sddm-sugar-candy/-/archive/master/sddm-sugar-candy-master.zip
        if [ -f ~/Downloads/sddm-sugar-candy-master.zip ] ;then
            unzip -o -q ~/Downloads/sddm-sugar-candy-master.zip -d ~/Downloads/
            if [ ! -d /usr/share/sddm/themes/sugar-candy ] ;then
                sudo mkdir -p /usr/share/sddm/themes/sugar-candy
            fi
            sudo cp -r ~/Downloads/sddm-sugar-candy-master/* /usr/share/sddm/themes/sugar-candy
            echo ":: SDDM Sugar Candy Theme installed"
        else
            echo "ERROR: Sugar Candy Download not found"
        fi
    fi    

    # Install background wallpaper for sddm
    if [ -f /usr/share/sddm/themes/sugar-candy/theme.conf ]; then
        sudo cp ../wallpapers/default.jpg /usr/share/sddm/themes/sugar-candy/Backgrounds/current_wallpaper.jpg
        echo ":: Default wallpaper copied into /usr/share/sddm/themes/sugar-candy/Backgrounds/"
        sudo cp ../sddm/theme.conf /usr/share/sddm/themes/sugar-candy/
        sudo sed -i 's/CURRENTWALLPAPER/'"current_wallpaper.jpg"'/' /usr/share/sddm/themes/sugar-candy/theme.conf
        echo ":: File theme.conf updated in /usr/share/sddm/themes/sugar-candy/"
    fi

elif [ "$dmsel" == "Deactivate current display manager" ] ;then

    sudo rm /etc/systemd/system/display-manager.service
    echo ":: Current display manager deactivated."
    disman=1

elif [ "$dmsel" == "Keep current setup" ] ;then
    echo ":: sddm setup skipped."
else
    echo ":: sddm setup skipped."
fi
# ------------------------------------------------------
# Install tty login and issue
# ------------------------------------------------------

if [ $disman == 1 ]; then
echo -e "${GREEN}"
figlet "TTY issue"
echo -e "${NONE}"
    if gum confirm "Do you want to install the custom tty login issue?" ;then
        sudo cp ../login/issue /etc/issue
        echo "Custom tty login issue installed successfully."
    elif [ $? -eq 130 ]; then
        exit 130
    else
        echo "Setup tty login skipped."
    fi
    echo ""
fi
