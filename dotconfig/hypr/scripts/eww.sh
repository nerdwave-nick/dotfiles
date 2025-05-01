#!/usr/bin/env bash
#   _____      ____      __
#  / _ \ \ /\ / /\ \ /\ / /
# |  __/\ V  V /  \ V  V / 
#  \___| \_/\_/    \_/\_/  
#                          

notify-send "aa"
if [[ ! $(pidof eww) ]]; then
	echo "pidof eww resulted in no"
	notify-send "Heyy"
	eww daemon
	notify-send "pid?: $(pidof eww)"
fi
