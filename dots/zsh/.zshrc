export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="eastwood"


CASE_SENSITIVE="true"
zstyle ':omz:update' mode auto      # update automatically without asking
DISABLE_MAGIC_FUNCTIONS="true"
ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

function updatedots() {
    DOTSDIR=$1
    if [ "$DOTSDIR" = "" ]; then
        DOTSDIR="/home/lilaf/programming/dev.lilaf/dotfiles/dots"
    fi
    echo "Putting dots into $DOTSDIR"
    
    if [ ! -d "$DOTSDIR" ]; then
        echo "$DOTSDIR does not exist. Press ENTER to create and continue or ^C to exit."
        read -rsn 1
    fi

    mkdir -p $DOTSDIR

    # zsh
    mkdir -p $DOTSDIR/zsh
    cp -rv ~/.zshrc $DOTSDIR/zsh/.zshrc

    # hypr*
    cp -rv ~/.config/hypr $DOTSDIR  

    # nvim
    cp -rv ~/.config/nvim $DOTSDIR

    # alacritty
    cp -rv ~/.config/alacritty $DOTSDIR

    # wallpapers
    cp -rv ~/.local/share/wallpapers $DOTSDIR

    # fuzzel
    cp -rv ~/.config/fuzzel $DOTSDIR

    # mako
    cp -rv ~/.config/mako $DOTSDIR

    # librewolf
    mkdir -p $DOTSDIR/librewolf
    cp -v ~/.librewolf/*-default/chrome/userChrome.css $DOTSDIR/librewolf
}

# maybe use this idk
function date_colored() {
    # date +"%a %b %d %Y - %I:%M:%S %p"
    echo -n "\033[91;1m"
    date +"%a" | tr -d "\n"
    echo -n "\033[92;22m"
    date +" %b %d" | tr -d "\n"
    echo -n "\033[0m"
    date +" %Y -" | tr -d "\n"
    echo -n "\033[93;1m"
    date +" %I:%M:%S" | tr -d "\n"
    echo -n "\033[96;22m"
    date +" %p"
}

function shell_startup() {
    date +"%a %b %d %Y - %I:%M:%S %p"
    echo "\033[91;1m$USER\033[0m on \033[92;1m$(cat /etc/hostname)\033[0m"
}

function converth264() {
    INPUT=$1
    OUTPUT=$2
    ffmpeg -i $INPUT -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p -c:a copy $OUTPUT
}

shell_startup

eval "$(zoxide init zsh --cmd cd)"
