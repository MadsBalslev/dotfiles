########################
#       ZSH Setup     #
#######################
# Install ZSH
sudo apt install zsh -y

# Change shell to ZSH
chsh -s $(which zsh) 
touch ~/.zshrc

#Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/MadsBalslev/dotfiles.git ~/.dotfiles
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

mv ~/.dotfiles/mads.zsh-theme ~/.oh-my-zsh/themes
mv ~/.dotfiles/.zshrc_wsl ~/.zshrc

source ~/.zshrc

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
