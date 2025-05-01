packages=(
    "hyprland"                      # hyprland duh
    "hyprpaper"                     # wallpaper utility
    "hyprlock"                      # lock screen thingy
    "hypridle"                      # idle manager thingy
    "xdg-desktop-portal-hyprland"   # to allow screensharing n shit
    "waybar"                        # top bar thingy
    "grim"                          # screenshot
    "slurp"                         # screen region selection for grim
    "swappy"                        # screenshot editor
    "cliphist"                      # clipboard history
    "wlogout"                       # logout menu
    "nwg-look"                      # gtk settings editor
    "ags"                           # widget shit
    "hyprshade"                     # shaders on screen stuff c:
)

echo -e "${PURPLE}"
figlet "Hyprland Packages"
echo -e "${RESET}"
install_packages "${packages[@]}"
