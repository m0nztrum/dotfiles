# +-------------------+
# |      ALIASES      |
# +-------------------+

alias l="eza -1 --icons=auto" # long list
alias ls="eza --icons=auto" # short list
alias ll="eza -lha --icons=auto --sort=name --group-directories-first" # long list all
alias tree="tree -a -l -C -I '.git' --gitignore --dirsfirst"

alias v="nvim"
alias suv="sudo nvim"
alias cvim="cd ~/.config/nvim/" # goes to nvim config path

alias rm="rm -rfv"
alias cp="cp -r"
alias mv="mv -iv"
alias t="touch"
alias cat="bat --style=plain"

alias pacsu="sudo pacman -Syu"  # update
alias paci="sudo pacman -S"     # install
alias pacrc="sudo pacman -Sc"   # clear cache

alias proj="cd ~/my-projects/"

alias ssh="kitty +kitten ssh" # when ssh from my kitty terminal
alias zf="zathura --fork"
alias cls="clear"
alias ga="gitalias"

# Get week number
alias week='date +%V'

# Print each PATH entry on a separate line
alias echopath='echo -e ${PATH//:/\\n}'

alias c='cd $(fd --type d . | fzf --preview "exa --long --icons --color=always {}")'
