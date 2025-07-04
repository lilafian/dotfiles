REPO_DIR=$1

echo "Installing Vesktop and configuration..."
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/vesktop-bin.git --depth=1
cd vesktop-bin
makepkg -si
cd ..
rm -rf vesktop-bin

cp -rv $REPO_DIR/vesktop ~/.config

echo "Installed Vesktop!"
