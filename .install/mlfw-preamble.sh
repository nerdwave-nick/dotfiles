# Set installation mode
mode="live"
if [ ! -z $1 ]; then
    mode="dev"
    echo "IMPORTANT: DEV MODE ACTIVATED. "
    echo "Existing dotfiles folder will not be modified."
    echo "Symbolic links will not be created."
fi
echo -e "${GREEN}"

