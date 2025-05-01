# ------------------------------------------------------
# Install required packages
# ------------------------------------------------------
echo -e "${BLUE}"
figlet "Packages"
echo -e "${RESET}"
echo "Do you want to check for new packages only (faster installation)"
echo "or do you want to reinstall all packages again? (more robust and can help to fix issues)"
echo
if gum confirm "How do you want to proceed?" --affirmative "New packages only" --negative "Force reinstallation"; then
    export force_install=0
elif [ $? -eq 130 ]; then
    echo_e ":: Installation canceled."
    exit 130
else
    FORCE_INSTALL="1"
fi
if [[ "$FORCE_INSTALL" == "1" ]]; then
    echo_s ":: Installing all packages forcefully"
else
    echo_s ":: Installing new packages only"
fi
