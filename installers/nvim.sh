REPO_DIR=$1

echo " -- [nvim]: installing neovim packages"
sudo pacman -S --needed neovim python3

echo " -- [nvim]: installing vim-plug"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo " -- [nvim]: copying neovim configuration to ~/.config"
cp -rv $REPO_DIR/dots/nvim ~/.config

echo " -- [nvim]: installing plugins"
nvim +'PlugInstall --sync' +qa
nvim +'COQdeps' +qa

echo " -- [nvim]: installing lsp servers"
sudo pacman -S --needed clang
