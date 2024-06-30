packages=(
    "rustup"                 # rustup
    "pacman-contrib"         # pacman contrib duh
    "bluez"                  # bluetooth stuff
    "bluez-utils"            # bluetooth stuff more
    "curl"                   # curl
    "unzip"                  # unzippy boi
    "wezterm-git"            # default terminal
    "chromium"               # browser to try out
    "firefox"                # browser to try out
    "dunst"                  # notifications
    "starship"               # prompt because I'm a moron who loves the pretty
    "mpv"                    # command line media player
    "nautilus"               # file browser default
    "noto-fonts"             # fonts
    "otf-font-awesome"       # fonts
    "ttf-fira-sans"          # fonts
    "ttf-fira-code"          # fonts
    "ttf-firacode-nerd"      # fonts
    "figlet"                 # ascii art text thing
    "vlc"                    # media
    "eza"                    # exa but maintained
    "python-pip"             # pip
    "python-psutil"          # pip
    "python-rich"            # pip
    "python-click"           # pip
    "python-pywal"           # pip
    "python-gobject"         # pip
    "pavucontrol"            # mixer tui
    "tumbler"                # thumbnails
    "papirus-icon-theme"     # icons
    "breeze-icons"           # icons
    "polkit-gnome"           # polkit stuff
    "brightnessctl"          # laptop screen brightness
    "gum"                    # bubblegum but command line
    "man-pages"              # man pages duh
    "nm-connection-editor"   # network manager utility
    "gvfs"                   # virtual file system stuff
    "xdg-user-dirs"          # sets up user directories
    "xdg-desktop-portal-gtk" # stuff
    "networkmanager"         # network stuff
    "network-manager-applet" # tray applet
    "xarchiver"              # archiving/unarchiving stuff
    "zip"                    # archive stuff
    "fuse2"                  # fuse
    "gtk4"                   # gtk
    "libadwaita"             # no idea but needed
    "xdg-desktop-portal"     # xdg stuff
    "qalculate-gtk"          # calculator
    "imagemagick"            # imagemagic duh
    "guvcview"               # cam viewer
    "jq"                     # jq
    "rofi-wayland"           # rofi for wayland
    "fastfetch"              # for the pretties in the terminal
    "blueman"                # bluetooth related stuff
    "bibata-cursor-theme"    # cute cursor
    "trizen"                 # yay alternative
    "pacseek"                # pacman utility
    "yazi"                   # tui filemanager
    "stylua"                 # you know what it is
    "ripgrep"                # ripgrep is love
    "fd"                     # fd is life
    "wget"                   # curl alternative
    # "neovim-git"             # duh
    # "thunar-archive-plugin"  # archives for thunar
    # "vim"                    # just to make sure
    # "alacritty"              # fast terminal
    # "thunar"                 # file browser to try out
    # "mousepad"               # text editor,like notepad
)

echo -e "${YELLOW}"
figlet "General Packages"
echo -e "${RESET}"

install_packages "${packages[@]}"

echo -e "${YELLOW}"
figlet "Volta"
echo -e "${RESET}"

# missing is volta
curl -s "https://get.volta.sh" | bash
