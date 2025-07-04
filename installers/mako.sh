REPO_DIR=$1

echo "Installing Mako and configuration..."
sudo pacman -S --needed mako
cp -rv $REPO_DIR/dots/mako ~/.config
echo "Installed Mako!"
