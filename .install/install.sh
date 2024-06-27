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
source ~/.cargo/env
source ./mlfw/volta.sh
source ./mlfw/paralleldownloads.sh
source ./mlfw/yay.sh
source ./mlfw/updatesystem.sh
source ./mlfw/backup.sh
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
source .install/packages/hyprland-packages.sh
source .install/install-packages.sh
source .install/wallpapers.sh
source .install/displaymanager.sh
source .install/restore.sh
source .install/keyboard.sh
source .install/init-pywal.sh
source .install/dotfiles.sh
source .install/gtk.sh
source .install/bashrc.sh
source .install/diagnostics.sh
source .install/reboot.sh
sleep 3
