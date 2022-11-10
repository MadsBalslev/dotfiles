ln -s /mnt/c/dev

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
sudo apt install curl -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/MadsBalslev/dotfiles.git ~/.dotfiles
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

ln -s ~/.dotfiles/mads.zsh-theme ~/.oh-my-zsh/themes
ln -s ~/.dotfiles/.zshrc_wsl ~/.zshrc

mkdir -p ~/.config/nvim

ln -s ~/.dotfiles/config/nvim/init.vim ~/.config/nvim/init.vim

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
git config --global autocrlf false

########################
#      Node Setup     #
#######################
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

########################
#      Ruby Setup     #
#######################
sudo apt-get update
sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(~/.rbenv/bin/rbenv init - zsh)"' >> ~/.zshrc

source ~/.zshrc

rbenv install 3.1.2
########################
#      Rails Setup    #
#######################
echo "gem: --no-document" > ~/.gemrc
gem install bundler
gem install rails

rbenv rehash
######################
#   Install stuff   #
####################
sudo apt install neovim

# Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +'PlugInstall --sync' +qa
