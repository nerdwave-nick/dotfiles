if sudo pacman -Qs yay > /dev/null ; then
    echo ":: yay is already installed!"
else
    echo -e "${GREEN}"
    figlet "yay"
    echo -e "${RESET}"
    echo ":: yay is not installed. Starting the installation!"
    install_pacman_packages "base-devel"
    temp_path=$PWD
    git clone https://aur.archlinux.org/yay-git.git ~/yay-git
    cd ~/yay-git
    makepkg -si
    cd $temp_path
    echo ":: yay has been installed successfully."
    rm -rf ~/yay-git
    echo ":: cleaned up"
fi
echo

