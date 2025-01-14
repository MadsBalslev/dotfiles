# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

eval "$(/opt/homebrew/bin/brew shellenv)"

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

alias gcg="git config --edit --global"
alias gcl="git config --edit --local"
alias s="kitten ssh"

eval "$(starship init zsh)"
source "$HOME/.rye/env"
eval "$(/opt/homebrew/bin/mise activate zsh)"


# bun completions
[ -s "/Users/mads/.bun/_bun" ] && source "/Users/mads/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/mads/.cache/lm-studio/bin"

# Created by `pipx` on 2024-11-26 10:08:50
export PATH="$PATH:/Users/mads/.local/bin"
