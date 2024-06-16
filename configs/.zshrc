# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# zsh plugins
# ----------
plugins=(
    python 
    zsh-autosuggestions 
    zsh-syntax-highlighting
    fzf-zsh-plugin
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi


# ALIASES
# -------
alias l="eza -1 --icons=auto" # long list
alias ls="eza --icons=auto" # short list
alias ll="eza -lha --icons=auto --sort=name --group-directories-first" # long list all
alias v="nvim"
alias suv="sudo nvim"
alias c="clear"
alias ga="gitalias"
alias rm="rm -rf"
alias cp="cp -r"
alias sysupdate="sudo pacman -Syu"
alias ssh="kitty +kitten ssh" # when ssh from my kitty terminal
alias cvim="cd ~/.config/nvim/" # goes to nvim config path
alias t="touch"
alias cat="bat --style=plain"
alias proj="cd ~/projects/"
alias zf="zathura --fork"

# yt-dlp
# ------
function dl-yt () {
    if [[ $# -lt 3 ]] || [[ "$1" == "-h" ]]; then
        echo "Usage: dl-yt [ resolution ] [ type v | p ] [url..]"
        echo "types:"
        echo "\tv = video"
        echo "\tp = playlist"
        return 1
    fi

    local resolution=$1
    local dtype=$2
    local format="bestvideo[height<=${resolution}][ext=mp4]+bestaudio[ext=m4a]"

    if [[ $dtype == "p" ]]; then
        yt-dlp -f "$format" -o "%(playlist)s/%(title)s.%(ext)s" "$3"
    else
        yt-dlp -f "$format" -o "%(title)s.%(ext)s" "$3"
    fi
}


# call neovide
# ------------
function vv(){
    neovide $@ & disown
}

# Get current weather for a city
# ------------------------------
function weather() {
    curl -s "wttr.in/$1"
}

# Extract any archive
# ------------------
function extract() {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)   tar xjf $1    ;;
            *.tar.gz)    tar xzf $1    ;;
            *.bz2)       bunzip2 $1    ;;
            *.rar)       unrar x $1    ;;
            *.gz)        gunzip $1     ;;
            *.tar)       tar xf $1     ;;
            *.tbz2)      tar xjf $1    ;;
            *.tgz)       tar xzf $1    ;;
            *.zip)       unzip $1      ;;
            *.Z)         uncompress $1 ;;
            *.7z)        7z x $1       ;;
            *)           echo "Don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# Get size of folders / files in current dir
function ffsize () {
    du -sh * | sort -h
}

# binfiles from (https://github.com/punixcorn/binfiles)
export PATH=$PATH:$HOME/binfiles
source $HOME/binfiles/.completions/_bin_completions.sh >/dev/null 2>&1


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Turn off beeping noice
unsetopt BEEP

eval "$(zoxide init zsh)"

export GIT_DISCOVERY_ACROSS_FILESYSTEM=1
