# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
#               Installation of HomeBrew and programs                         #
###############################################################################

echo "Hello $(whoami)! Let's get you set up."

echo "mkdir ~/dev"
mkdir ~/dev

echo "installing homebrew & xcode dev tools"
# install homebrew https://brew.sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "brew installing stuff"
# zsh: Instead of bash
# tree: really handy for listing out directories in text
# jq: A lightweight and flexible command-line JSON processor
brew install jq git tldr neovim tmux

echo "installing node (via nvm)"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

echo "installing oh my zsh"
# Install Oh My Zsh
curl -L http://install.ohmyz.sh | sh

echo "Custom ZSH plugins"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


echo "installing apps with brew"
brew tap homebrew/cask-versions
brew install alfred discord iterm2 spectacle firefox-developer-edition \
spotify steam transmission google-chrome visual-studio-code insomnia vlc

brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono

###############################################################################
#                          Set Mac settings                                   #
###############################################################################
echo "Changing some settings now"

#Show Library folder:
chflags nohidden ~/Library

#Show path bar:
defaults write com.apple.finder ShowPathbar -bool true

#Show status bar:
defaults write com.apple.finder ShowStatusBar -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true


###############################################################################
#                          Configure GIT                                      #
###############################################################################
echo "Configuring some git settings"

git config --global user.name "Mads Balslev"
git config --global user.email "madspbalslev@gmail.com"
git config --global color.ui auto

echo "Generating an RSA token for GitHub"
mkdir ~/.ssh
ssh-keygen -t rsa -b 4096 -C "madspbalslev@gmail.com"
echo "Host *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/id_rsa" | tee ~/.ssh/config
eval "$(ssh-agent -s)"
echo "run 'pbcopy < ~/.ssh/id_rsa.pub' and paste that into GitHub"

echo "cloning dotfiles"
git clone git@github.com:MadsBalslev/dotfiles.git ~/dotfiles
ln -s ~/dotfiles/mads.zsh-theme ~/.oh-my-zsh/themes/mads.zsh-theme
ln -s ~/dotfiles/.zshrc ~/.zshrc

###############################################################################
# Kill affected applications                                                  #
###############################################################################
for app in "Activity Monitor" \
"Address Book" \
"Calendar" \
"cfprefsd" \
"Contacts" \
"Dock" \
"Finder" \
"Mail" \
"Messages" \
"Photos" \
"Safari" \
"SystemUIServer" \
"iCal"; do
  killall "${app}" &> /dev/null
done

echo "Done. Note that some of these changes require a logout/restart to take effect."
printf "TODO:\n\
install: \n\
  Spark mail (App Store) \n
  Notability (App Store) \n
  Scroll Reverser (Web) \n
\n\
login to literally everything \n\
"
