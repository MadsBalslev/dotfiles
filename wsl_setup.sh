ln -s /mnt/c/dev
cp -r /mnt/c/Users/madsp/.ssh ~/.
chmod 700 ~/.ssh/id_ed25519

sudo apt update && sudo apt upgrade

########################
#       ZSH Setup     #
#######################
# Install ZSH
sudo apt install zsh -y

# Change shell to ZSH
chsh -s $(which zsh) 
touch ~/.zshrc

#Install Oh-My-Zsh
sudo apt-get install curl -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/MadsBalslev/dotfiles.git ~/.dotfiles
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

mv ~/.dotfiles/mads.zsh-theme ~/.oh-my-zsh/themes
mv ~/.dotfiles/.zshrc_wsl ~/.zshrc

source ~/.zshrc

sed -i '1s/^/bash -c zsh\n/' ~/.bashrc

########################
#       Git Setup     #
#######################
# Install latest version of git
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git -y
git config --global user.name "Mads Balslev"
git config --global user.email madspbalslev@gmail.com
git config --global init.defaultBranch main
git config --global color.ui auto

########################
#       NVM Setup     #
#######################
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.zshrc
nvm install --lts
nvm use --lts

npm install --global yarn

########################
#      Ruby Setup     #
#######################
sudo apt-get update
sudo apt install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev sqlite3 libsqlite3-dev libxslt-dev -y
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-installer | bash

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
source ~/.zshrc

rbenv install 3.0.2
rbenv global 3.0.2

########################
#      Rails Setup    #
#######################
echo "gem: --no-document" > ~/.gemrc
gem install bundler
gem install rails