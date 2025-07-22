clear
# to ensure that the relative paths are correct
BASE_PATH="$(realpath "$(dirname "$0")")"
cd "$BASE_PATH" || exit

source ./lib/colors.sh
source ./lib/dir_variables.sh
source ./lib/symlinks.sh
source ./lib/install_packages.sh
source ./lib/exists.sh


packages=()
if ! exists "gum"; then
    packages+=("gum")
fi
if ! exists "figlet"; then
    packages+=("figlet")
    packages+=("figlet-fonts")
fi
if [ ${#packages[@]} -gt 0 ]; then
    sudo pacman -Sy
    echo_n "Installing required packages..."
    install_packages "${packages[@]}"
fi

clear
set_color $BWHITE
figlet -f doom "Nerdwave"
reset_color
echo -e "${BBLUE}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${RESET}"
echo
