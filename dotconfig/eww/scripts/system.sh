#!/bin/bash

sleep 0.3
# $HOME/dotfiles/eww/ml4w-sidebar/launch.sh

if [[ "$1" == "reboot" ]]; then
	"$HOME"/.config/hypr/scripts/reboot.sh
elif [[ "$1" == "shutdown" ]]; then
	"$HOME"/.config/hypr/scripts/shutdown.sh
elif [[ "$1" == "lock" ]]; then
	"$HOME"/.config/hypr/scripts/lock.sh
elif [[ "$1" == "suspend" ]]; then
	"$HOME"/.config/hypr/scripts/suspend.sh
elif [[ "$1" == "logout" ]]; then
	"$HOME"/.config/hypr/scripts/exit.sh
fi
