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
# Run those lines on your local PC, LOL.
# If u are using Windows, I highly recommend you to install babun: http://babun.github.io/
# wget --directory-prefix=~/.fonts/ https://raw.githubusercontent.com/powerline/fonts/master/SourceCodePro/Sauce%20Code%20Powerline%20Regular.otf
# echo "export DEFAULT_USER="$(whoami) >>~/.profile
#sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc
#sed -i 's/plugins=(git)/plugins=(git command-not-found node npm nvm)/g' ~/.zshrc