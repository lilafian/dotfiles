# $1 is the install type (x or wayland)
INSTALL_TYPE=$1

REPO_DIR=$(pwd)
START_DELAY=5

echo "Running from $REPO_DIR and installing '$INSTALL_TYPE' profile, press Ctrl+C in the next $START_DELAY seconds to cancel or do nothing to continue"

for i in $(seq $START_DELAY); do
    sleep 1s
    echo -n "."
done
echo "!"

if [ $INSTALL_TYPE = "x" ]; then
    echo "Installing X profile (i3)"

    echo "Installing X server"
    sudo pacman -S --needed xorg-server xorg-xinit

    echo "Copying .xinitrc file to home directory"
    cp -v $REPO_DIR/x/.xinitrc ~

    echo "Installing i3 and utilities"
    sudo pacman -S --needed i3-wm i3status i3lock xss-lock

    echo "Copying i3 configuration files"
    cp -rv $REPO_DIR/x/i3 ~/.config
elif [ $INSTALL_TYPE = "wayland" ]; then
    echo "Installing Wayland profile (Hyprland)"
    
    echo "Installing Hyprland and utilities"
    sudo pacman -S --needed hyprland hyprpaper waybar

    cp -rv $REPO_DIR/wayland/* ~/.config
else
    echo "Invalid profile specified. Valid arguments are 'x' and 'wayland'. Please rerun using 'sh install.sh [PROFILE]'"
    exit
fi

# universal things
echo "Creating home directory structure"
mkdir -p ~/projects
mkdir -p ~/forks
mkdir -p ~/cloned
mkdir -p ~/misc
mkdir -p ~/media/images

echo "Moving wallpaper and lockscreen to ~/media/images"
cp -v $REPO_DIR/wall2-rosepine.jpg ~/media/images
cp -v $REPO_DIR/lock.png ~/media/images

echo "Copying .zshrc file to home directory"
cp -v $REPO_DIR/.zshrc ~

echo "Installing Terminus font"
sudo pacman -S --needed terminus-font

echo "Installing Neovim"
sudo pacman -S --needed neovim
echo "Installing Vim-Plug"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo "Copying Neovim configuration files"
mkdir -p ~/.config/nvim/lua/$(whoami)
cp -v $REPO_DIR/nvim/init.lua ~/.config/nvim
cp -v $REPO_DIR/nvim/lua/lilaf/settings.lua ~/.config/nvim/lua/$(whoami)

echo "Installing yay"
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ..
rm -rf yay-bin

echo "Installing LibreWolf"
yay -S librewolf-bin

echo "Installing st"
git clone https://git.suckless.org/st
cd st
cp -v $REPO_DIR/x/st/config.h .
sudo make clean install
cd ..
rm -rf st

# display finished message
cat $REPO_DIR/post_install.txt | less

if [ $INSTALL_TYPE = "x" ]; then
    startx
else
    Hyprland
fi
