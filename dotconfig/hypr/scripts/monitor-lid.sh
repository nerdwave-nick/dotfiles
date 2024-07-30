#!/bin/env bash

monitors="$(hyprctl monitors)"
if [[ "$monitors" =~ "\sDP-[0-9]+" || "$monitors" =~ "ID 1" ]]; then
  state="$(cat /proc/acpi/button/lid/LID/state | sed -n -e 's/^.*state:\s*//p')"
  if [[ "$state" == "open" ]]; then
    echo ":: enabling internal monitor due to laptop lid state: $state"
    hyprctl keyword monitor "eDP-1,1920x1080,2560x0,1" > /dev/null
  else
    echo ":: disabling internal monitor due to laptop lid state: $state"
    hyprctl keyword monitor "eDP-1,disable" > /dev/null
  fi
else 
  echo "$monitors didn't work"
fi
