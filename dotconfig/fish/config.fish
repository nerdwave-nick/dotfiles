starship init fish | source
zoxide init fish | source

if test -f "$HOME/google-cloud-sdk/path.fish.inc"
    source "$HOME/google-cloud-sdk/path.fish.inc"
end

set fish_greeting

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
set -gx EDITOR "nvim"
set -gx SUDO_EDITOR "$EDITOR"
