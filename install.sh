if [[ "$(cat /etc/os-release | head -n 1)" != "NAME=\"Arch Linux\"" ]]; then
    echo "You are not using Arch Linux! If you are using an Arch based distribution, you can continue just fine. Otherwise, the script is very likely to break!"
    echo "Continue anyways? (y/N)"
    read -n1 NONARCH_CONTINUE
    if [[ "$NONARCH_CONTINUE" != "y" ]]; then
        exit
    fi
fi

REPO_DIR=$(pwd)
START_DELAY=5

clear
echo -n "lilafDots Installer - Module selection
Separate specific modules with commas, use 'exit' to exit, or use 'all' to install all modules (default)
Examples: nvim,waybar,zsh

Available modules:
alacritty    Install the terminal emulator (Alacritty) and configuration
drvses       Install the drive session manager (DrvSes) and shell integration
fonts        Install nerd fonts
fuzzel       Install the app launcher (Fuzzel) and configuration
hyprland     Install the WM/compositor (Hyprland) and configuration
nvim         Install the code editor (Neovim) and configuration
vesktop      Install the internet messenger (Vesktop/Discord) and configuration
wallpapers   Install the default wallpapers (located in ~/.local/share/lilafdots/wallpapers)
waybar       Install the status bar (Waybar) and configuration
yay          Install the AUR helper (Yay)
yazi         Install the file manager (Yazi)
zen          Install the web browser (Zen)
zsh          Install the shell (Zsh), configuration, and utilities

Enter your selection > "
read MODULE_SELECTION

if [[ "$MODULE_SELECTION" == "exit" ]]; then
    echo "Goodbye!"
    exit
fi

if [ -z "$MODULE_SELECTION" ]; then
    MODULE_SELECTION="all"
fi

if [[ "$MODULE_SELECTION" == "all" ]]; then
    MODULE_SELECTION="alacritty,drvses,fonts,fuzzel,hyprland,nvim,vesktop,wallpapers,waybar,yay,yazi,zen,zsh"
fi

IFS="," read -ra MODULES <<< "$MODULE_SELECTION"

clear

echo "Selected modules:"
for MODULE in "${MODULES[@]}"; do
    echo "$MODULE"
done
echo -n "Install these modules? (Y/n)"
read -n1 INSTALL_CONTINUE
if [[ "$INSTALL_CONTINUE" == "n" ]]; then
    exec sh $0 $@
fi

echo "Running lilafDots install script from $REPO_DIR. Press Ctrl+C in the next $START_DELAY seconds to cancel or do nothing to continue."

for i in $(seq $START_DELAY); do
    sleep 1s
    echo -n "."
done
echo "!"

mkdir -p ~/.config

for MODULE in "${MODULES[@]}"; do
    sh $REPO_DIR/installers/$MODULE.sh $REPO_DIR
    
    if [ $? != 0 ]; then
        echo -n "Failed to run install script for module $MODULE! (Does it exist?) Continue? (y/N)"
        read -n1 MODFAIL_CONTINUE
        if [[ "$MODFAIL_CONTINUE" != "y" ]]; then
            exit
        fi
        echo ""
    fi
done

sudo pacman -S --needed lolcat

echo "Install complete!" | lolcat -a -d 50

less post_install.txt
