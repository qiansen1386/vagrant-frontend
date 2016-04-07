#!/bin/bash
# Install Zsh
sudo apt-get install -y zsh
# Install Oh-my-zsh
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
# change sh
sudo chsh -s /bin/zsh vagrant
# copy .zshrc
sudo cp /home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
# Configuration
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="wezm"/g' ~/.zshrc
sed -i 's/plugins=(git)/plugins=(git command-not-found node npm nvm)/g' ~/.zshrc