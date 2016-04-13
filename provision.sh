#!/bin/bash
 echo "Running Vagrant Provisioning..."
 PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
 echo -e "Detected current Project folder is $PROJECT_DIR/"
 cd $PROJECT_DIR
 echo  "Install Node Version Manager"
 wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
 echo "source $HOME/.nvm/nvm.sh" >> $HOME/.profile
 source $HOME/.profile
 echo "Install & use Node 4.4.2 LTS"
 NODEVERSION=4.4.2
 nvm install $NODEVERSION
 nvm use $NODEVERSION
 echo "Update npm from 1.*.*/2.*.* to ^3.8.5"
 npm update -g npm
 # Install npm packages
 echo  "Install all missing packages based on package.json"
 # That is right, make sure you have a package.json file in your dev folder, specifying all the npm packages you need.
 sudo npm install --no-bin-links
 sudo npm i -g webpack webpack-dev-server
 echo "Run webpack-dev-server"
 webpack-dev-server
