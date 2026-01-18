starship init fish | source
zoxide init fish --cmd=cd | source

if test -f "$HOME/google-cloud-sdk/path.fish.inc"
    source "$HOME/google-cloud-sdk/path.fish.inc"
end

set fish_greeting

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# Created by `pipx` on 2026-01-16 11:09:41
set PATH $PATH /home/nerdwave/.local/bin
