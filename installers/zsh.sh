REPO_DIR=$1

echo "Installing Zsh and configuration..."
sudo pacman -S --needed zsh zoxide fortune-mod cowsay
if ! [ -d ~/.oh-my-zsh ]; then
    echo "Run 'exit' on the next page to continue!" | less
    sh -c "$(curl -fsSl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
cp -v $REPO_DIR/dots/.zshrc ~

echo "Checking for DrvSes..."
if [ -f "/usr/bin/drvses" ]; then
    echo "DrvSes found! Installing integration to default lilafDots theme..."
    zsh -c "update_zsh_drvses_integration"
    echo "Installed DrvSes-Zsh integration!"
fi

echo "Installed Zsh and configuration!"
