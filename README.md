# Nerdwave Dotfiles

A rather simple collection of config files to set up neovim and wezterm the way I like them. 

Core of this config is a sessionizer for wezterm and lean nvim setup with lsp, telescope, harpoon and lazygit.
Keybinds are often reasonable, but some are based on dvorak, so be mindful of that. Like others, I am standing on the shoulders of giants, and a lot of this was inspired by my [colleague mvezer](https://github.com/mvezer/dotfiles), with the sessionizer being based on a [tmux plugin by ThePrimaegen](https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer), and specifically [this implementation by keturiosakys](https://github.com/wez/wezterm/discussions/4796). The wezterm statusbar is based on [these dotfiles by ghostx31](https://github.com/ghostx31/dotfiles/tree/main). Those are the big inspirations, but there were of course more. Thank all of you for publicly displaying your wonderful dotfiles. 

## Requirements
- [neovim](https://github.com/neovim/neovim) as the core editor
- [wezterm](https://wezfurlong.org/wezterm/index.html) as the core multiplexer and terminal emulator
- [lazygit](https://github.com/jesseduffield/lazygit) for the git workflow in nvim
- [nvm](https://github.com/nvm-sh/nvm) as a dependency for some parts
- [rust](https://forge.rust-lang.org/infra/other-installation-methods.html) best installed via rustup
- [ripgrep](https://github.com/BurntSushi/ripgrep) for telescope
- [fd](https://github.com/sharkdp/fd) for the sessionizer
- [fira code](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode) as the font of choice

Some might be missing, so be sure to check. 

## Installation
There's a very simple install script in this repository, which just symlinks the dotfiles. 


### Todo
leader y for yanking into system clipboard
recheck all plugins

