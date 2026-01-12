#!/bin/bash

create_generic_symlink() {
    source=$1
    target=$2
    echo_i ":: Creating symlink $source -> $target"
    if [ -z "$1" ]; then
        echo_e "::    Error, no argments given"
        return
    elif [ -z "$2" ]; then
        echo_e "::    Error, only source argument given"
        return
    else
        if [ -d "$2" ]; then
            echo_t "::    Removing already existing directory $2"
            rm -rf "$2"
        elif [ -f "$2" ]; then
            echo_t "::    Removing already existing file $2"
            rm "$2"
        elif [ -L "$2" ]; then
            echo_t "::    Removing already existing symlink $2"
            rm "$2"
        fi
        ln -s $1 $2
        echo_s "::    Done"
    fi
}

create_dotfiles_symlink() {
    source="$R_DOTCONFIG_DIR/$1"
    if [ $# -eq 2 ]; then
        target="$H_DOTCONFIG_DIR/$2"
    else 
        target="$H_DOTCONFIG_DIR/$1"
    fi
    create_generic_symlink "$source" "$target"
}
