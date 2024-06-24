#!/bin/bash
scrot /tmp/screenshot.png
magick /tmp/screenshot.png -scale 10% -gaussian-blur 0x2 -resize 1000% /tmp/screenshotblur.png
i3lock -i /tmp/screenshotblur.png
rm /tmp/screenshot.png
rm /tmp/screenshotblur.png
