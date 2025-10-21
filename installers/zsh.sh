REPO_DIR=$1

echo " -- [zsh]: installing zsh"
sudo pacman -S --needed zsh
echo " -- [zsh]: installing oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo " -- [zsh]: copying .zshrc to ~"
cp -rv $REPO_DIR/dots/zsh/.zshrc ~/.zshrc
rm ~/.zshrc.pre-oh-my-zsh
