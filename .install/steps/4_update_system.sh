echo -e "${GREEN}"
figlet "System Update"
echo -e "${RESET}"
echo "It's important that your system is up-to-date before you proceed."
echo 
if gum confirm "Do you want to update your system with yay now?" ;then
    echo_s ":: Update started"
    yay
elif [ $? -eq 130 ]; then
    echo_e ":: Installation canceled."
    exit 130
else
    echo_e ":: System update skipped"
fi
echo
