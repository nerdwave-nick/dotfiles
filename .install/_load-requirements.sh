# to ensure that the relative paths are correct
BASE_PATH="$(realpath "$(dirname "$0")")"
cd "$BASE_PATH" || exit

source ./lib/colors.sh
source ./lib/dir_variables.sh
source ./lib/symlinks.sh
source ./lib/install_packages.sh
source ./lib/exists.sh

sudo pacman -Sy

packages=()
if ! exists "rsync"; then
    packages+="rsync "
fi
if ! exists "gum"; then
    packages+="gum "
fi
if ! exists "figlet"; then
    packages+="figlet "
fi
if ! exists "python"; then
    packages+="python "
fi
if [ ${#packages[@]} -gt 0 ]; then
    echo_n "Installing required packages..."
    install_pacman_packages "${packages[@]}"
fi

clear
set_color $BWHITE
figlet -n "Nerdwave"
reset_color
echo -e "${BBLUE}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${RESET}"
echo
