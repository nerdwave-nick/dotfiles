if gum confirm "Install Nerdwave Dotfiles?"; then
    echo_s ":: Installation started."
elif [ $? -eq 130 ]; then
    echo_e ":: Installation canceled."
    exit 130
else
    echo_e ":: Installation canceled."
    exit
fi

# echo -e "${PURPLE}"
# figlet "Packages"
# echo -e "${NONE}"

# echo "Do you want to check for new packages only (faster installation)"
# echo "or do you want to reinstall all packages again? (more robust and can help to fix issues)"
# echo
# if gum confirm "How do you want to proceed?" --affirmative "New packages only" --negative "Force reinstallation"; then
#     FORCE_INSTALL=0
# elif [ $? -eq 130 ]; then
#     echo ":: Installation canceled."
#     exit 130
# else
#     FORCE_INSTALL=1
# fi
