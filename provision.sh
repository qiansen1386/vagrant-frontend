 #!/bin/bash
  echo "Running Vagrant Provisioning..."
  # Create symlink to /tmp/node_modules instead of saving it in project folder right away
  PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  echo -e "Detected current Project folder is $PROJECT_DIR/"
  echo "Updating Box..."
  sudo apt-get update --fix-missing # make sure the box is fully up to date
  # uncomment the following line to allow the system upgrade
  # sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y
  echo "Installing a few necessary packages..."
  sudo apt-get install -y build-essential libssl-dev
  echo  "Install Node Version Manager"
  wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
  registerNVM="export NVM_DIR="$HOME/.nvm""
  echo $registerNVM >> $HOME/.bashrc
  source $HOME/.bashrc # Refresh PATH
  echo "Install & use Node 4.4.2 LTS"
  NODEVERSION=4.4.2
  nvm install $NODEVERSION
  nvm use $NODEVERSION
  echo "Update npm from 1.*.*/2.*.* to ^3.8.5"
  npm update -g npm
  # Install npm packages
  cd $PROJECT_DIR
  echo  "Install all missing packages based on package.json"
  # That is right, make sure you have a package.json file in your dev folder, specifying all the npm packages you need.
  sudo npm install --no-bin-links
  sudo npm i -g webpack webpack-dev-server
  echo "Run webpack-dev-server"
  webpack-dev-server
