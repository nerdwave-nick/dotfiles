#!/bin/bash

_is_installed_yay() {
    package="$1"
    check="$(yay -Qs --color always "${package}" | grep "local" | grep "\." | grep "${package} ")"
    if [ -n "${check}" ]; then
        echo 0 #'0' means 'true' in Bash
        return #true
    fi
    echo 1 #'1' means 'false' in Bash
    return #false
}
_is_installed_pacman() {
    package="$1"
    check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "\." | grep "${package} ")"
    if [ -n "${check}" ]; then
        echo 0 #'0' means 'true' in Bash
        return #true
    fi
    echo 1 #'1' means 'false' in Bash
    return #false
}

# installs the array of packages given
# example:
#
# array_of_packages=("a" "b" "c")
# install_packages array_of_packages
install_packages() {
    to_install=()
    if [[ "$FORCE_INSTALL" == "1" ]]; then
        for var in "$@"; do
            to_install+=("${var}")
        done
    else
        for var in "$@"; do
            if [[ $(_is_installed_yay "${var}") == 0 ]]; then
                echo ":: ${var} is already installed."
                continue
            fi
            to_install+=("${var}")
        done
    fi

    if [[ "${to_install[@]}" == "" ]]; then
        return
    fi
    yay --noconfirm -S "${to_install[@]}"
}

# installs the array of packages given, but
# ensures that pacman is used
# example:
#
# array_of_packages=("a" "b" "c")
# install_pacman_packages array_of_packages
install_pacman_packages() {
    to_install=()
    if [[ "$FORCE_INSTALL" == "1" ]]; then
        for var in "$@"; do
            to_install+=("${var}")
        done
    else
        for var in "$@"; do
            if [[ $(_is_installed_pacman "${var}") == 0 ]]; then
                echo ":: ${var} is already installed."
                continue
            fi
            to_install+=("${var}")
        done
    fi

    if [[ "${to_install[@]}" == "" ]]; then
        return
    fi
    sudo pacman --noconfirm -S "${to_install[@]}"
}

is_installed() {
    if command -v $1 > /dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}
