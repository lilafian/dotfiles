REPO_DIR=$1

echo "Installing Alacritty and configuration..."
sudo pacman -S --needed alacritty
cp -rv $REPO_DIR/dots/alacritty ~/.config
echo "Installed Alacritty!"
