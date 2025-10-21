REPO_DIR=$1

echo " -- [alacritty]: installing alacritty package"
sudo pacman -S --needed alacritty
echo " -- [alacritty]: copying alacritty configuration to ~/.config"
cp -rv $REPO_DIR/dots/alacritty ~/.config
