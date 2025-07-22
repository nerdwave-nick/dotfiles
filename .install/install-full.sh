#!/bin/bash

source ./_load-requirements.sh

source ./steps/1_config_pacman.sh
source ./steps/2_remove_deprecated.sh
source ./steps/3_general_packages.sh
source ./steps/4_dotfiles_symlinks.sh
source ./steps/5_reboot.sh
