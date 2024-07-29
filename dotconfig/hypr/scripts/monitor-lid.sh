#!/bin/env bash

monitors="$(hyprctl monitors)"
if [[ "$monitors" =~ "\sDP-[0-9]+" || "$monitors" =~ "ID 1" ]]; then
  if [[ $1 == "open" ]]; then
    hyprctl keyword monitor "eDP-1,1920x1080,2560x0,1"
  else
    hyprctl keyword monitor "eDP-1,disable"
  fi
else 
  echo "$monitors didn't work"
fi
