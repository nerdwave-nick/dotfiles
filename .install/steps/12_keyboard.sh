#!/bin/bash

echo -e "${GREEN}"
figlet "Keyboard"
echo -e "${NONE}"

echo "Not implemented yet"

# setkeyboard=0
# if [ "$setkeyboard" == "0" ] ;then

#     # Default layout and variants
#     keyboard_layout="us"


#     if gum confirm "Laptop keyboard preset?"; then
#         cp .install/templates/keyboard-laptop.conf ~/dotfiles-versions/$version/hypr/conf/keyboard.conf
#         echo "source = ~/dotfiles/hypr/conf/layouts/laptop.conf" >  ~/dotfiles-versions/$version/hypr/conf/layout.conf
#     elif [ $? -eq 130 ]; then
#         echo ":: Installation canceled."
#         exit 130
#     else
#         cp .install/templates/keyboard-default.conf ~/dotfiles-versions/$version/hypr/conf/keyboard.conf
#     fi
#     cp .install/templates/autostart.sh ~/dotfiles-versions/$version/qtile/autostart.sh

#     SEARCH="KEYBOARD_LAYOUT"
#     REPLACE="$keyboard_layout"
#     sed -i "s/$SEARCH/$REPLACE/g" ~/dotfiles-versions/$version/hypr/conf/keyboard.conf

#     SEARCH="KEYBOARD_VARIANT"
#     REPLACE="$keyboard_variant"
#     sed -i "s/$SEARCH/$REPLACE/g" ~/dotfiles-versions/$version/hypr/conf/keyboard.conf

#     SEARCH="KEYBOARD_LAYOUT"
#     REPLACE="$keyboard_layout"
#     sed -i "s/$SEARCH/$REPLACE/g" ~/dotfiles-versions/$version/qtile/autostart.sh

#     echo
#     echo ":: Keyboard setup complete."
#     echo
#     echo "PLEASE NOTE: You can update your keyboard layout later in ~/dotfiles/hypr/conf/keyboard.conf"

# fi 

