export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

HOST_NAME=Mads

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="mads"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"


plugins=(git zsh-syntax-highlighting zsh-autosuggestions nvm)

source $ZSH/oh-my-zsh.sh

function mkcd()
{
	mkdir $1 && cd $1
}

# Example aliases
alias zshconfig="code ~/.zshrc"

# Git aliases
alias gaa="git add ."
alias gcm="git commit -m"
alias gpsh="git push origin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
