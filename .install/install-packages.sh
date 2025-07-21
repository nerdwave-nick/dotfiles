#!/bin/bash

# to ensure that the relative paths are correct
BASE_PATH="$(realpath "$(dirname "$0")")"
cd "$BASE_PATH" || exit

source ./lib/print.sh
source ./lib/colors.sh
source ./lib/dir_variables.sh
source ./lib/symlinks.sh
source ./lib/install_packages.sh
source ./lib/exists.sh

source ./steps/0_install_requirements.sh
clear
