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

# Load separated zsh config
for file in "$HOME/.config/zsh/"*.zsh; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history


# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Turn off beeping noice
unsetopt BEEP

eval "$(zoxide init zsh)"
source <(fzf --zsh)

# binfiles
source $HOME/binfiles/.completions/_bin_completions.sh >/dev/null 2>&1
