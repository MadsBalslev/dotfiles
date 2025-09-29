# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

eval "$(/opt/homebrew/bin/brew shellenv)"

HOST_NAME=Mads

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/imagemagick@6/bin:$PATH"


plugins=(git zsh-syntax-highlighting zsh-autosuggestions nvm)
source $ZSH/oh-my-zsh.sh

alias zshconfig="$EDITOR ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias lg="lazygit"

alias gcg="git config --edit --global"
alias gcl="git config --edit --local"

eval "$(starship init zsh)"
eval "$(/opt/homebrew/bin/mise activate zsh)"


# bun completions
[ -s "/Users/mads/.bun/_bun" ] && source "/Users/mads/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"

. "$HOME/.local/bin/env"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/mads/.lmstudio/bin"
# End of LM Studio CLI section

eval "$(zoxide init zsh)"

cx() {
  if [[ "$1" == "update" ]]; then
    brew update && brew upgrade codex
  elif [[ "$1" == "version" ]]; then
    codex --version
  else
    # Can add -c model_reasoning_effort='high' to enable high reasoning; removed due to
    # gpt-5-codex having dynamic reasoning effort.
    codex -m gpt-5-codex --search --yolo -c model_reasoning_summary_format=experimental "$@"
  fi
}
