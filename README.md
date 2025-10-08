>[!NOTE]
> these are old and need to be updated (but usable)! this branch will be separated once i update so that these can be accessed as well as the new ones.

# lilaf's dotfiles
These are my modular dotfiles for Hyprland, Zsh, and some other things. You can choose a list of modules, or install the full dots.

## Modular?
These dots are modular, meaning that each part of them is almost entirely independent of each other. For example, you can install the Neovim config without installing the rest of the config, or you can install the Waybar config and keep your own Hyprland config.

## List of modules
```
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
```
The installers for each module are located in `installers`. You can use custom modules (for forks) by just adding them to the list above in the `install.sh` script and adding a corresponding script in `installers`. There is no check for module existence, but it will fail gracefully if a module installer is not found.

## Hyprland essential keybinds
You can find more keybinds in `~/.config/hypr/hyprland.conf`.
- Super+A: Open terminal
- Super+W: Open browser
- Super+R: Open application launcher
- Super+Alt+Shift+W: Switch wallpaper
- Super+F: Float window
- Super+Arrow: Move focus
- Super+S: Swap split side
- Super+D: Swap split direction
- Super+LeftClickDrag: Move floating window
- Super+RightClickDrag: Resize window
