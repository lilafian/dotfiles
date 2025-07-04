WALLPAPER_NAME=$(cd ~/.local/share/lilafdots/wallpapers; fzf --preview "catimg -w 90 {}")

if [ -z "$WALLPAPER_NAME" ]; then
    exit
fi


WALLPAPER_FILE="~/.local/share/lilafdots/wallpapers/$WALLPAPER_NAME"

echo "# Autogenerated by wallpaper.sh
preload = $WALLPAPER_FILE
wallpaper = ,$WALLPAPER_FILE
" > ~/.config/hypr/hyprpaper.conf

pkill hyprpaper
nohup hyprpaper > /dev/null 2>&1 &
disown
sleep 0.001
