# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

eval "$(/opt/homebrew/bin/brew shellenv)"

HOST_NAME=Mads

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions nvm asdf)
source $ZSH/oh-my-zsh.sh

alias zshconfig="nvim ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias ls="colorls"
alias mux="tmuxinator"

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export EDITOR="nvim"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash


export PATH="/Users/mads/dev/aau/p8/flutter/bin:$PATH"

eval "$(starship init zsh)"
