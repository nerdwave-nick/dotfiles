#!/bin/bash
scrot -z /tmp/screenshot.png
magick /tmp/screenshot.png -scale 10% -gaussian-blur 0x2 -resize 1000% /tmp/screenshotblur.png
# xset dpms force off
physlock -l
i3lock --nofork -i /tmp/screenshotblur.png
physlock -L
rm /tmp/screenshot.png
rm /tmp/screenshotblur.png
