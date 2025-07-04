REPO_DIR=$1

echo "Installing Fuzzel and configuration..."
sudo pacman -S --needed fuzzel
cp -rv $REPO_DIR/dots/fuzzel ~/.config
echo "Installed Fuzzel!"
