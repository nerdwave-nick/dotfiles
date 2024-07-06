#!/bin/bash

REPO_DIR="$(realpath "$(dirname "$(realpath "${BASH_SOURCE:-$0}")")/../../")"
export REPO_DIR
export R_DOTCONFIG_DIR="${REPO_DIR}/dotconfig"
export R_SCRIPTS_DIR="${REPO_DIR}/scripts"
export R_WALLPAPERS_DIR="${REPO_DIR}/wallpapers"
export R_SETTINGS_DIR="${REPO_DIR}/.settings"
export R_INSTALL_DIR="${REPO_DIR}/.install"
export H_DOTCONFIG_DIR="${HOME}/.config"
