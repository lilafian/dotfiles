if [[ "$FROM_INSTALL_SH" != "1" ]]; then
    echo "You are not running from the install.sh script! You will not recieve a log or final execution time."
    echo "Press any key to continue."
    read -n1
fi

if [[ "$(cat /etc/os-release | head -n 1)" != "NAME=\"Arch Linux\"" ]]; then
    echo "You are not using Arch Linux! If you are using an Arch based distribution, you can continue just fine. Otherwise, the script is very likely to break!"
    echo "Continue anyways? (y/N)"
    read -n1 NONARCH_CONTINUE
    if [[ "$NONARCH_CONTINUE" != "y" ]]; then
        exit
    fi
fi

if [ ! -f /bin/sudo ]; then
    echo -e "\033[91m -- Sudo is not installed! To use another privelege escalation tool, please modify the installer scripts and remove this check from install.sh."
    echo -ne "\tor, continue anyway? (y/N)\033[0m"

    read -n1 NOSUDO_CONTINUE
    if [[ "$NOSUDO_CONTINUE" != "y" ]]; then
        exit
    fi
fi

REPO_DIR=$(pwd)

VERSION="2.0.0"

clear

echo -n "LilafDots v$VERSION Installer - Module selection
Separate specific modules with commas (NO SPACES!), use 'exit' to exit, or use 'all' to install all modules (default)
Examples: nvim,yay,zsh

Available modules:
alacritty    Install the terminal emulator (Alacritty) and configuration
fonts        Install nerd fonts
hyprland     Install the WM/compositor (Hyprland) and configuration
nvim         Install the code editor (Neovim) and configuration
wallpapers   Install the default wallpapers (located in ~/.local/share/lilafdots/wallpapers)
yay          Install the AUR helper (Yay)
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
    MODULE_SELECTION="alacritty,fonts,hyprland,nvim,wallpapers,yay,zsh"
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

echo -e "\n -- Running pre-install script..."
sh $REPO_DIR/installers/pre_install.sh $REPO_DIR

echo " -- Running module installers..."
for MODULE in "${MODULES[@]}"; do
    echo " -- Running install script for module $MODULE"
    sh $REPO_DIR/installers/$MODULE.sh $REPO_DIR
 
    EXIT_CODE=$?

    if [ $EXIT_CODE != 0 ]; then
        echo -ne "\033[91m -- Failed to run install script for module $MODULE (exited with $ERROR_CODE)! Continue? (y/N)\033[0m"
        read -n1 MODFAIL_CONTINUE
        if [[ "$MODFAIL_CONTINUE" != "y" ]]; then
            exit
        fi
        echo ""
    fi
done

if [ -f /usr/bin/lolcat ]; then
    echo " -- Install complete!" | lolcat -a -d 50
fi

less post_install.txt
