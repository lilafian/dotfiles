SYNC_LIMINE=$1

WALLPAPER_NAME=$(cd ~/.local/share/lilafdots/wallpapers; sh ~/.config/hypr/fzf_ubzg.sh | cut -c48-) # YOU HAVE TO CUT 47 CHARACTERS BECAUSE OF UEBERZUGPP IDK WHY

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

if [[ "$SYNC_LIMINE" == "1" ]]; then
    echo "Enter your password to sync with the bootloader (disable in hyprland.conf)"
    USERHOMENOTROOT=$HOME
    sudo cp "$USERHOMENOTROOT/.local/share/lilafdots/wallpapers/$WALLPAPER_NAME" /boot/limine-wall.png
fi
