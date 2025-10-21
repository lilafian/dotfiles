echo " -- [yay]: installing base-devel"
sudo pacman -S --needed base-devel
echo " -- [yay]: installing yay-bin"
git clone https://aur.archlinux.org/yay-bin.git
makepkg -si -D yay-bin
echo " -- [yay]: cleaning up"
rm -rf yay-bin
