#!/bin/bash

# to ensure that the relative paths are correct
BASE_PATH="$(realpath "$(dirname "$0")")"
cd "$BASE_PATH" || exit

source ./lib/colors.sh
source ./lib/dir_variables.sh
source ./lib/symlinks.sh
source ./lib/install_packages.sh
source ./lib/exists.sh

source ./steps/0_install_requirements.sh
clear

echo -e "${BPURPLE}"
figlet "Nerdwave"
echo -e "${BBLUE}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "${RESET}"

source ./steps/1_config_pacman.sh
source ./steps/3_install_yay.sh
source ./steps/4_update_system.sh
source ./steps/5_preparations.sh
source ./steps/6_setup_installation.sh
source ./steps/7_remove_deprecated.sh
source ./steps/8_general_packages.sh
source ./steps/9_hyprland_packages.sh
source ./steps/10_wallpaper.sh
source ./steps/11_displaymanager.sh
source ./steps/12_keyboard.sh
# this one symlinks the dotfiles
source ./steps/13_dotfiles_symlinks.sh
# set up settings and program
# source ./steps/14_settings.sh
# source ./steps/15_apps.sh
source ./steps/16_gtk.sh
source ./steps/17_cleanup.sh
source ./steps/18_diagnosis.sh
source ./steps/19_reboot.sh

sleep 3
