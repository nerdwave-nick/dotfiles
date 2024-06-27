#!/bin/bash
source mlfw/include/colors.sh
source mlfw/include/library.sh
clear

source mlfw-preamble.sh

echo -e "${GREEN}"
cat <<"EOF"

  _   _              _
 | \ | |            | |
 |  \| | ___ _ __ __| |_      ____ ___   _____
 | . ` |/ _ \ '__/ _` \ \ /\ / / _` \ \ / / _ \
 | |\  |  __/ | | (_| |\ V  V / (_| |\ V /  __/
 |_| \_|\___|_|  \__,_| \_/\_/ \__,_| \_/ \___|


EOF
echo -e "${NONE}"

echo ""
source ./mlfw/required.sh
source ./mlfw/rustup.sh
#source ~/.cargo/env
source ./mlfw/volta.sh
source ./mlfw/paralleldownloads.sh
source ./mlfw/yay.sh
source ./mlfw/updatesystem.sh
# source ./mlfw/backup.sh
source ./mlfw/installer.sh
source ./mlfw/remove.sh

echo -e "${GREEN}"
figlet "General"
echo -e "${NONE}"

source ./mlfw/packages/general.sh
source ./mlfw/install-packages.sh

source ./mlfw/check-thinkpad.sh
if [[ -n "$isThinkpad" ]]; then
	echo -e "${GREEN}"
	figlet "ThinkPad E16 G2"
	echo -e "${NONE}"
	source ./mlfw/packages/lenovo-tp-e16-g2.sh
	source ./mlfw/install-packages.sh
fi

echo -e "${GREEN}"
figlet "Hyprland"
echo -e "${NONE}"
source ./mlfw/packages/hyprland.sh
source ./mlfw/install-packages.sh
source ./mlfw/wallpaper.sh
source ./mlfw/displaymanager.sh
# source ./mlfw/restore.sh
source ./mlfw/keyboard.sh
source ./mlfw/init-pywal.sh
source ./mlfw/dotfiles.sh
source ./mlfw/gtk.sh
source ./mlfw/bashrc.sh
source ./mlfw/diagnostics.sh
source ./mlfw/reboot.sh
sleep 3
