REPO_DIR=$1

echo "Installing Hyprland and configuration..."
sudo pacman -S --needed hyprland hyprshot hyprpicker hyprpaper hyprlock hypridle
cp -rv $REPO_DIR/dots/hypr ~/.config
echo "Installed Hyprland!"
