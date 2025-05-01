echo -e "${RED}"
figlet "System check"
echo -e "${RESET}"

cmd_exists(){
    package="$1";
    if ! type "$package" > /dev/null 2>&1; then
        echo_e ":: $package doesn't exists"
    else
        echo ":: $package exists"
    fi
}
dir_exists(){
    if [[ -d "$1" ]]; then
        echo ":: $1 exists"
    else 
        echo_e ":: $1 exists"
    fi
}

echo "The system check will test that essential packages and "
echo "execution commands are available now on your system."
echo 
if gum confirm "Do you want to run a short system check?" ;then

    dir_exists "$HOME/dotfiles"
    cmd_exists "rofi" "rofi-wayland"
    cmd_exists "dunst" "dunst"
    cmd_exists "waybar" "waybar"
    cmd_exists "hyprpaper" "hyprpaper"
    cmd_exists "hyprlock" "hyprpaper"
    cmd_exists "hypridle" "hyprpaper"
    cmd_exists "wal" "python-pywal"
    cmd_exists "gum" "gum"
    cmd_exists "wlogout" "wlogout"
    cmd_exists "eww" "eww"
    cmd_exists "magick" "imagemagick"

elif [ $? -eq 130 ]; then
    exit 130
else
    echo ":: System check skipped"
fi
echo ""

