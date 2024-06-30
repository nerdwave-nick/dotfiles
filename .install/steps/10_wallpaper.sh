echo -e "${PINK}"
figlet "Wallpapers"
echo -e "${RESET}"

# Cache file holding the current wallpaper
cache_file="$HOME/.cache/current_wallpaper"
rasi_file="$HOME/.cache/current_wallpaper.rasi"

# Create cache file 
if [ ! -f $cache_file ] ;then
    touch $cache_file
    echo "${R_WALLPAPERS_DIR}/shaded_landscape.jpg" > "$cache_file"
fi

# Create rasi file
if [ ! -f $rasi_file ] ;then
    touch $rasi_file
    echo "* { current-image: url(\"${R_WALLPAPERS_DIR}/shaded_landscape.jpg\", height); }" > "$rasi_file"
fi

