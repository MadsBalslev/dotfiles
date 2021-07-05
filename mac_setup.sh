# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
#               Installation of HomeBrew and programs                         #
###############################################################################

echo "Hello $(whoami)! Let's get you set up."

echo "mkdir -p $(HOME)/dev"
mkdir -p "$(HOME)/dev"

echo "Setting up xcode. This might take a while..."
xcode-select --install

echo "installing homebrew"
# install homebrew https://brew.sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "brew installing stuff"
# zsh: Instead of bash
# tree: really handy for listing out directories in text
# jq: A lightweight and flexible command-line JSON processor
brew install zsh tree jq git python3 pipenv hub zsh-syntax-highlighting zsh-autosuggestions tldr

echo "Installed Python version ${python3 --version}"

echo "Setting default shell to zsh"
chsh -s /bin/zsh

echo "installing node (via n-install)"
curl -L https://git.io/n-install | bash

echo "node --version: $(node --version)"
echo "npm --version: $(npm --version)"

echo "installing oh my zsh"
# Install Oh My Zsh
curl -L http://install.ohmyz.sh | sh

echo "installing apps with brew cask"
brew cask install alfred discord iterm2 spectacle firefox-developer-edition \
spotify steam transmission google-chrome visual-studio-code insomnia intellij-idea \
dashlane notion microsoft-office vlc

brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono

#Installing som global npm packages
npm install -g vue-cli

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

brew install jesseduffield/lazygit/lazygit
brew install lazygit

git config --global user.name "Mads Balslev"
git config --global user.email "madspbalslev@gmail.com"
git config --global color.ui auto

echo "Generating an RSA token for GitHub"
mkdir -p ~/.ssh
ssh-keygen -t rsa -b 4096 -C "madspbalslev@gmail.com"
echo "Host *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/id_rsa" | tee ~/.ssh/config
eval "$(ssh-agent -s)"
echo "run 'pbcopy < ~/.ssh/id_rsa.pub' and paste that into GitHub"

echo "cloning dotfiles"
git clone git@github.com:MadsBalslev/dotfiles.git "${HOME}/dotfiles"
ln -s "${HOME}/dotfiles/mads.zsh-theme" "${HOME}/.oh-my-zsh/themes/mads.zsh-theme"
ln -s "${HOME}/dotfiles/.zshrc" "${HOME}/.zshrc"

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