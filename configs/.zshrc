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
)

source $ZSH/oh-my-zsh.sh

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Load separated zsh config
#for file in "$HOME/.config/zsh/config/"*.zsh; do
#	[ -r "$file" ] && [ -f "$file" ] && source "$file";
#done;
#unset file;

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi


# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi


# Turn off beeping noice
unsetopt BEEP

# shell integrations
# eval "$(zoxide init --cmd cd zsh)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)


autoload -Uz compinit && compinit
complete -C /usr/bin/syncthing syncthing
complete -C /usr/bin/spicetify spicetify

# +-------------------+
# |      ALIASES      |
# +-------------------+

alias l="eza -1 --icons=auto" # long list
alias ls="eza --icons=auto" # short list
alias ll="eza -lha --icons=auto --sort=name --group-directories-first" # long list all
alias tree="tree -a -l -C -I '.git' --gitignore --dirsfirst"

alias v="nvim"
alias suv="sudo nvim"

alias rm="rm -rfv"
alias cp="cp -r"
alias mv="mv -iv"
alias t="touch"
alias cat="bat --style=plain"

alias pacsu="sudo pacman -Syu"  # update
alias paci="sudo pacman -S"     # install
alias pacrc="sudo pacman -Sc"   # clear cache
alias pacrr="sudo pacman -Rs"   # remove pkg with unsed deps
alias pacss="sudo pacman -Ss"   # search
alias paccc="sudo pacman -Scc"  # empty whole cache

alias proj="cd ~/my-projects/"

alias ssh="kitty +kitten ssh" # when ssh from my kitty terminal
alias zf="zathura --fork"
alias cls="clear"
alias ga="gitalias"

# Get week number
alias week='date +%V'

# Print each PATH entry on a separate line
alias echopath='echo -e ${PATH//:/\\n}'

alias cdff='cd $(fd --type d . | fzf --preview "exa --long --icons --color=always {}")'
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'

alias img="viewnior"

alias monz-posql="psql -d m0nz_db -U m0nz -W"

# +-------------------+
# |      Functions    |
# +-------------------+

# yt-dlp
dl-yt () {
    if [[ $# -lt 3 ]] || [[ "$1" == "-h" ]]; then
        echo "Usage: dl-yt [ resolution ] [ type v | p ] [url..]"
        echo "Types:"
        echo "\tv = video"
        echo "\tp = playlist"
        return 1
    fi

    local resolution=$1
    local vtype=$2
    local format="bestvideo[height<=${resolution}][ext=mp4]+bestaudio[ext=m4a]"

    if [[ $vtype == "p" ]]; then
        yt-dlp -f "$format" -o "%(playlist)s/%(title)s.%(ext)s" "$3"
    else
        yt-dlp -f "$format" -o "%(title)s.%(ext)s" "$3"
    fi
}
_dl-yt(){
    local state
    local -a line

    _arguments \
        '1:resolution:(360 480 720 1080)' \
        '2:type:(v p)' \
        '3:url:_urls'
}
compdef _dl-yt dl-yt


# call neovide
vv(){
    neovide $@ & disown
}


# Extract any archive
extract() {
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
            *)           echo "'$1'cannot be extracted" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}


# Get size of folders / files in current dir
ffsize () {
    du -sh * | sort -h
}


export VISUAL=nvim
export EDITOR=nvim
export TERMINAL=kitty

export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

export PYTHON_AUTO_VRUN=true

# binfiles completion setup
export PATH=$PATH:/home/draco/binfiles
source /home/draco/binfiles/.completions/_bin_completions.sh >/dev/null 2>&1
