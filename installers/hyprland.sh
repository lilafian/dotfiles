REPO_DIR=$1

echo "Installing Hyprland and configuration..."
sudo pacman -S --needed hyprland hyprshot hyprpicker hyprpaper hyprlock hypridle fzf git base-devel
git clone https://aur.archlinux.org/ueberzugpp.git
cd ueberzugpp
makepkg -si
cd ..
rm -rf ueberzugpp
git clone https://aur.archlinux.org/wlogout.git
cd wlogout
makepkg -si
cd ..
rm -rf wlogout
cp -rv $REPO_DIR/dots/hypr ~/.config
echo "Installed Hyprland!"
