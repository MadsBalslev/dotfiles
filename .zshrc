export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/tcl-tk/lib"
export CPPFLAGS="-I/usr/local/opt/tcl-tk/include"
export PKG_CONFIG_PATH="/usr/local/opt/tcl-tk/lib/pkgconfig"

HOST_NAME=Mads

source ~/.nvm/nvm.sh
nvm use --lts

# Path to your oh-my-zsh installation.
export ZSH="/Users/mads/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="mads"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"


plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

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

