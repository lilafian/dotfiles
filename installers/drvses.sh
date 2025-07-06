echo "Installing DrvSes..."
sudo pacman -S --needed git
git clone https://github.com/lilafian/drvses --depth 1
cd drvses
sh install.sh
cd ..
rm -rf drvses
echo "Installed DrvSes!"
