echo_c "Installing rustup" $PURPLE
rustupPackages=(
    "rustup"                 # rustup
)
if [[ $(_is_installed_yay "rustup") == 1 ]]; then
    install_packages "${rustupPackages[@]}"
    rustup default stable
    echo_s "rustup installed"
else
    echo_n "rustup already installed"
fi

echo_c "Installing packages" $PURPLE
packages=(
    "ttf-fira-sans"          # fonts
    "ttf-fira-code"          # fonts
    "ttf-firacode-nerd"      # fonts
    "ttf-dm-mono-git"        # fonts
    "ttf-nerd-fonts-symbols" # fonts

    "zen-browser-bin"        # browser
    "obsidian-bin"           # markdown editor

    "ghostty"                # terminal
    "starship"               # prompt because I'm a moron who loves the pretty
    "eza"                    # exa but maintained
    "bat"                    # cat alternative

    "stylua"                 # you know what it is
    "ripgrep"                # ripgrep is love
    "fd"                     # fd is life
    "fzf"                    # my love, my life, my fuzzy finder
    "lazygit"                # i'm too dumb to use git without
    "vim"                    # just to make sure
)
install_packages "${packages[@]}"
echo_s "Packages installed"

# missing is volta
echo_c "Installing volta" $PURPLE
if  ! is_installed volta; then
    curl -s "https://get.volta.sh" | bash
    volta install node@latest
    echo_s "volta installed"
else
    echo_n "volta already installed"
fi

