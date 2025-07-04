REPO_DIR=$1

echo "Installing Zsh and configuration..."
sudo pacman -S --needed zsh
if ! [ -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
cp -v $REPO_DIR/dots/.zshrc ~
