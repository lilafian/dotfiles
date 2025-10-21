REPO_DIR=$1

echo " -- [zsh]: installing zsh packages"
sudo pacman -S --needed zsh zoxide
echo " -- [zsh]: installing oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo " -- [zsh]: copying .zshrc to ~"
cp -rv $REPO_DIR/dots/zsh/.zshrc ~/.zshrc
rm ~/.zshrc.pre-oh-my-zsh
echo " -- [zsh]: changing user default shell to zsh"
sudo usermod --shell /bin/zsh $USER
