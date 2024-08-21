# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(pyenv init -)"

HOST_NAME=Mads

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/imagemagick@6/bin:$PATH"


plugins=(git zsh-syntax-highlighting zsh-autosuggestions nvm asdf)
source $ZSH/oh-my-zsh.sh

alias zshconfig="$EDITOR ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias lg="lazygit"


eval "$(starship init zsh)"

eval "$(~/.local/bin/mise activate zsh)"

