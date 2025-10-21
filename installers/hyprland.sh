REPO_DIR=$1

echo " -- [hyprland]: installing hyprland packages"
sudo pacman -S --needed hyprland hyprpaper hyprshot
echo " -- [hyprland]: copying hyprland and hyprpaper configuration to ~/.config"
mkdir -pv ~/.config/hypr
cp -rv $REPO_DIR/dots/hypr/hyprland.conf ~/.config/hypr
cp -rv $REPO_DIR/dots/hypr/hyprpaper.conf ~/.config/hypr

echo " -- [hyprland]: installing fuzzel package"
sudo pacman -S --needed fuzzel
echo " -- [hyprland]: copying fuzzel configuration to ~/.config"
cp -rv $REPO_DIR/dots/hypr/fuzzel ~/.config

echo " -- [hyprland]: installing mako package"
sudo pacman -S --needed mako
echo " -- [hyprland]: copying mako configuration to ~/.config"
cp -rv $REPO_DIR/dots/hypr/mako ~/.config
