echo " -- [pre_install]: confirming config dir exists..."
mkdir -pv ~/.config

echo " -- [pre_install]: updating system..."
sudo pacman -Syu

echo " -- [pre_install]: installing git..."
sudo pacman -S --needed git
