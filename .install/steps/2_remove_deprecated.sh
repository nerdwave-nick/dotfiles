# Remove hypridle-bin
deprecated_packages=""
rem_deprecated_pkg() {
    if [[ $(_is_installed_yay "${1}") == 0 ]]; then
        deprecated_packages+="${1} "
        echo_s "${1} - uninstalling"
    else
        echo_n "${1} - not installed"
    fi
}

echo_c "Removing deprecated packages" $PURPLE

rem_deprecated_pkg "alacritty"
rem_deprecated_pkg "zoom"
rem_deprecated_pkg "localsend-bin" 
rem_deprecated_pkg "1password-beta" 
rem_deprecated_pkg "1password-cli" 
rem_deprecated_pkg "chromium" 
rem_deprecated_pkg "kdenlive" 
rem_deprecated_pkg "spotify"
rem_deprecated_pkg "signal-desktop"

if [ -z "${deprecated_packages}" ]; then
    echo_s "No deprecated packages left"
else 
    yay --noconfirm -Rns "$deprecated_packages" 
fi
