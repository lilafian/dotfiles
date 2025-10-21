echo " -- [fonts]: installing nerd-fonts package..."
sudo pacman -S --needed nerd-fonts
if [ $? != "0" ]; then
    exit 1
fi
