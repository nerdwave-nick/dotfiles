hyprpaper&
selected_wallpaper="$(cat ~/.cache/current_wallpaper)"
if [[ -f "$selected_wallpaper" ]]; then 
    hyprctl hyprpaper preload "$selected_wallpaper" >/dev/null
    hyprctl hyprpaper wallpaper ",$selected_wallpaper" >/dev/null
fi
