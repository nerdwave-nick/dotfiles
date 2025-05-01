echo -e "${GREEN}"
figlet "Preparation"
echo -e "${RESET}"
if [ -d "$H_DOTCONFIG_DIR" ]; then
    echo ":: $H_DOTCONFIG_DIR folder already exists."
else
    mkdir "$H_DOTCONFIG_DIR"
    echo ":: $H_DOTCONFIG_DIR folder created."
fi
echo

