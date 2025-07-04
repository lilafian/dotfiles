echo "Installing Zen..."
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/zen-browser-bin.git --depth=1
cd zen-browser-bin
makepkg -si
cd ..
rm -rf zen-browser-bin
