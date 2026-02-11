# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

eval "$(/opt/homebrew/bin/brew shellenv)"

HOST_NAME=Mads

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="code"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/imagemagick@6/bin:$PATH"
export PATH="/Users/mads/.dotnet/tools:$PATH"


plugins=(git zsh-syntax-highlighting zsh-autosuggestions nvm mise starship zoxide)
source $ZSH/oh-my-zsh.sh

alias zshconfig="$EDITOR ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias lg="lazygit"

alias gcg="git config --edit --global"
alias gcl="git config --edit --local"

alias tx="tmuxinator"

eval "$(starship init zsh)"
eval "$(/opt/homebrew/bin/mise activate zsh --shims)"


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

# Load secrets if file exists
if [ -f ~/.secrets ]; then
  source ~/.secrets
fi

eval "$(zoxide init zsh)"

cx() {
  if [[ "$1" == "update" ]]; then
    brew update && brew upgrade codex
  elif [[ "$1" == "version" ]]; then
    codex --version
  # elif other agrument passed, pass it to codex
  elif [[ -n "$1" ]]; then
    codex "$@"
  else
    # Can add -c model_reasoning_effort='high' to enable high reasoning; removed due to
    # gpt-5-codex having dynamic reasoning effort.
    codex -m gpt-5.2-codex-max --enable web_search_request --yolo -c model_reasoning_summary_format=experimental "$@"
  fi
}

ccv() {
  if [[ "$1" == "update" ]]; then
    brew upgrade --cask claude-code
  elif [[ "$1" == "version" ]]; then
    claude --version
  elif [[ "$1" == "plan" ]]; then
    if [[ -z "$2" ]]; then
      claude --permission-mode plan
    else
      claude --permission-mode plan -p "$2"
    fi
  else
    claude --dangerously-skip-permissions "$@"
  fi
}

dpt() {
  local project_dir="/Users/mads/dev/trifork/X9/misc/misconsite/docker-pull-tool"
  local output_dir="/Users/mads/dev/trifork/X9/Images"
  local gitlab_url="git.jaguar.trifork.netic.dk:5050"

  # Check arguments
  if [[ -z "$1" ]]; then
    echo "Usage: dpt <project:branch|tag>"
    return 1
  fi

  # Check token
  if [[ -z "$GITLAB_TOKEN" ]]; then
    echo "❌ Missing GITLAB_TOKEN. Please export it before running."
    return 1
  fi

  # Ensure output directory exists
  if [[ ! -d "$output_dir" ]]; then
    echo "📁 Creating output directory: $output_dir"
    mkdir -p "$output_dir" || { echo "❌ Failed to create $output_dir"; return 1; }
  fi

  # Move into project directory
  cd "$project_dir" || { echo "❌ Failed to cd into $project_dir"; return 1; }

  # Run the Docker Pull Tool
  uv run dpt.py "$gitlab_url/$1" \
    -o "$output_dir" \
    --api-token "$GITLAB_TOKEN"
}

# Added by Antigravity
export PATH="/Users/mads/.antigravity/antigravity/bin:$PATH"

# Added by get-aspire-cli.sh
export PATH="$HOME/.aspire/bin:$PATH"
