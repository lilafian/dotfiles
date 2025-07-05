REPO_DIR=$1

echo "Installing Zsh and configuration..."
sudo pacman -S --needed zsh
if ! [ -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
cp -v $REPO_DIR/dots/.zshrc ~

echo "Checking for DrvSes..."
if [ -f "/usr/bin/drvses" ]; then
    echo "DrvSes found! Installing integration to default lilafDots theme..."
    update_zsh_drvses_integration
    echo "Installed DrvSes-Zsh integration!"
fi

echo "Installed Zsh and configuration!"
