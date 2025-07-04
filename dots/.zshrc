# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="eastwood"

# Case-sensitive completion
CASE_SENSITIVE="true"

# Update automatically without asking
zstyle ':omz:update' mode auto

# Fix pasting
DISABLE_MAGIC_FUNCTIONS="true"

# Command auto-correction
ENABLE_CORRECTION="true"

# Speed up git tracking on slow computers
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Locale/language
export LANG=en_US.UTF-8

# Preferred editor 
export EDITOR="nvim"
export SUDOEDITOR="nvim"

if ! [ "$IS_DRVSES" = "1" ]; then
    fortune | cowsay -f tux
fi

drvses_status() {
  if [ "$IS_DRVSES" = "1" ]; then
      echo "DrvSes($DRVSES_DRIVE)"
  fi
}

# This is NOT for updating the config from GitHub. This is for putting all of the dotfiles in a central location so that they can be uploaded to GitHub (or another service).
update_dots() {
    DOTS_PATH=$1
    if [ -z "$DOTS_PATH" ]; then
        DOTS_PATH="$HOME/misc/dotfiles/dots"
    fi
    echo "Copy dotfiles into $DOTS_PATH? (Y/n)"
    read -k 1 update_continue
    if [ "$update_continue" = "n" ]; then
        return
    fi

    cp -rv ~/.zshrc $DOTS_PATH
    cp -rv ~/.config/hypr $DOTS_PATH
    cp -rv ~/.config/alacritty $DOTS_PATH
    cp -rv ~/.local/share/lilafdots/wallpapers $DOTS_PATH
    cp -rv ~/.config/waybar $DOTS_PATH
    cp -rv ~/.config/nvim $DOTS_PATH
    cp -rv ~/.config/fuzzel $DOTS_PATH
    mkdir -p $DOTS_PATH/vesktop/settings
    cp -rv ~/.config/vesktop/settings.json $DOTS_PATH/vesktop
    cp -rv ~/.config/vesktop/settings/settings.json $DOTS_PATH/vesktop/settings
    cp -rv ~/.config/mako $DOTS_PATH
}

update_zsh_drvses_integration() {
    sed -i.bak "s/PROMPT='\$(g/PROMPT='\\\$(drvses_status)\$(g/g" ~/.oh-my-zsh/themes/eastwood.zsh-theme
}

reload_shell() {
    clear
    exec zsh
}

eval "$(zoxide init zsh --cmd cd)"
