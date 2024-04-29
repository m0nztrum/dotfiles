# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"


#      ___  __    _  _   __  __  _  _  ___ 
#     (  ,\(  )  ( )( ) / _)(  )( \( )/ __)
#      ) _/ )(__  )()( ( (/\ )(  )  ( \__ \
#     (_)  (____) \__/  \__/(__)(_)\_)(___/
plugins=(
    git 
    python 
    zsh-autosuggestions 
    zsh-syntax-highlighting
    fzf-zsh-plugin
    zsh-256color
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi


#       __    __    ____    __    ___  ____  ___ 
#      /__\  (  )  (_  _)  /__\  / __)( ___)/ __)
#     /(__)\  )(__  _)(_  /(__)\ \__ \ )__) \__ \
#    (__)(__)(____)(____)(__)(__)(___/(____)(___/

alias l="eza -1 --icons=auto" # long list
alias ls="eza --icons=auto" # short list
alias ll="eza -lha --icons=auto --sort=name --group-directories-first" # long list all
alias ld="eza -1D --icons=auto" # long list dirs
alias v="nvim"
alias suv="sudo nvim"
alias c="clear"
alias ga="gitalias"
alias rm="rm -rf"
alias cp="cp -r"
alias up="sudo pacman -Syu"
alias ssh="kitty +kitten ssh" # when ssh from my kitty terminal
alias cvim="cd ~/.config/nvim/" # goes to nvim config path
alias t="touch"
alias cat="bat --style=plain"
alias proj="cd ~/Projects/"


# binfiles from (https://github.com/punixcorn/binfiles)
export PATH=$PATH:$HOME/binfiles
source $HOME/binfiles/.completions/_bin_completions.sh >/dev/null 2>&1


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


unsetopt BEEP

eval "$(zoxide init zsh)"
eval "$(thefuck --alias)"
