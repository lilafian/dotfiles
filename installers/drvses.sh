echo "Installing DrvSes..."
sudo pacman -S --needed git
git clone https://github.com/lilafian/drvses --depth 1
sh drvses/install.sh
rm -rf drvses
echo "Installed DrvSes!"
