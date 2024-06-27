#!/bin/bash
yay --noconfirm -S rustup
echo -e ":: Rustup installed"
rustup install toolchain stable
echo -e ":: Rustup stable toolchain installed"
