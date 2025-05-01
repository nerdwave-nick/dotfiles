if gum confirm "Install Nerdwave Dotfiles?"; then
    echo_s ":: Installation started."
elif [ $? -eq 130 ]; then
    echo_e ":: Installation canceled."
    exit 130
else
    echo_e ":: Installation canceled."
    exit
fi
echo
