#!/bin/env bash

monitors="$(hyprctl monitors)"
if [[ "$monitors" =~ "\sDP-[0-9]+" || "$monitors" =~ "ID 1" ]]; then
  state="$(cat /proc/acpi/button/lid/LID/state | sed -n -e 's/^.*state:\s*//p')"
  if [[ "$state" == "open" ]]; then
    notify-send "Laptop opened, enabling internal monitor"
    hyprctl keyword monitor "eDP-1,1920x1080,2560x0,1" > /dev/null
  else
    notify-send "Laptop closed, disabling internal monitor"
    hyprctl keyword monitor "eDP-1,disable" > /dev/null
  fi
else 
  notify-send "$monitors didn't work"
fi
