REPO_DIR=$1

echo "Installing Waybar..."
sudo pacman -S --needed waybar
cp -rv $REPO_DIR/dots/waybar ~/.config
echo "Installed Waybar!"
