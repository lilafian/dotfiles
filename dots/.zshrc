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

age() {
    unit=$1
    if [ -z "$unit" ]; then
        unit="full"
    fi
    if [[ "$unit" == "days" ]]; then
        if [[ -z "$AGE_DAYS_OVERRIDE" ]]; then
            echo -n $(( ( $(date +%s) - $(date -d "$(stat / | awk '/Birth: /{print $2 " " substr($3,1,8)}')" +%s) ) / 86400 ))
        else
            echo -n "$AGE_DAYS_OVERRIDE"
        fi
    elif [[ "$unit" == "months" ]]; then
        echo -n $(($(age days) / 30))
    elif [[ "$unit" == "years" ]]; then
        echo -n $(($(age days) / 365))
    elif [[ "$unit" == "full" ]]; then
        total_days=$(age days)
        years=$(( total_days / 365 ))
        rem_days=$(( total_days % 365 ))
        months=$(( rem_days / 30 ))
        days=$(( rem_days % 30 ))
        
        if [[ "${years}" != 0 ]]; then
            echo -n "${years} years, ${months} months, ${days} days"
        elif [[ "${months}" != 0 ]]; then
            echo -n "${months} months, ${days} days"
        elif [[ "${days}" == 1 ]]; then
            echo -n "$(age days) day"
        else
            echo -n "$(age days) days"
        fi
    else
        echo -n "Unknown unit: $unit"
    fi
}

osname() {
    OSNAME=$(cat /etc/os-release | head -n2 | tail -n1 | cut -c14- | rev | cut -c2- | rev)
    OSCOLOR=$(cat /etc/os-release | head -n5 | tail -n1 | cut -c13- | rev | cut -c2- | rev)

    echo "\e[${OSCOLOR}m${OSNAME}\e[0m"

}

minfo() {
    echo "Using $(osname)"
    echo -n "System is "
    age | lolcat --force
    echo " old"
}

shell_start_display() {
    paste <(fortune | cowsay -f tux) <(echo "\n$(minfo)") | column -s $'\t' -t
}

sync_wall_limine() {
    USERHOMENOTROOT=$HOME
    sudo cp "$USERHOMENOTROOT/.local/share/lilafdots/wallpapers/$1.png" /boot/limine-wall.png
}

if ! [ "$IS_DRVSES" = "1" ]; then
    shell_start_display
fi

eval "$(zoxide init zsh --cmd cd)"
