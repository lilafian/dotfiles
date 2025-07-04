REPO_DIR=$1

echo "Installing Neovim and configuration..."
sudo pacman -S --needed neovim

echo "Installing Vim-Plug..."
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Copying Neovim configuration to ~/.config/nvim..."
cp -rv $REPO_DIR/dots/nvim ~/.config

echo "Installing Neovim plugins..."
nvim +'PlugInstall --sync' +qa
echo "Installed Neovim plugins!"

echo "Installing LSP for Python, C, C++, and JavaScript..."
sudo pacman -S --needed pyright clang clangd typescript-language-server
echo "Installed LSP!"
echo "Installed Neovim!"
