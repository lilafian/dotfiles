REPO_DIR=$1

echo "Installing default wallpapers..."
mkdir -p ~/.local/share/lilafdots
cp -rv $REPO_DIR/dots/wallpapers ~/.local/share/lilafdots
echo "Installed default wallpapers!"
