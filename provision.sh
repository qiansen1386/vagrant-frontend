 #!/bin/bash
  echo "Running Vagrant Provisioning..."
  # Create symlink to /tmp/node_modules instead of saving it in project folder right away
  PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  echo -e "Detected current Project folder is $PROJECT_DIR/"
  mkdir '/tmp/node_modules'
  chown -R vagrant:vagrant /tmp/node_modules
  ln -s '/tmp/node_modules' "$PROJECT_DIR/node_modules"
  echo "Updating Box..."
  sudo apt-get update --fix-missing # make sure the box is fully up to date
  # uncomment the following line to allow the system upgrade
  # sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y
  echo "Installing a few necessary packages..."
  sudo apt-get install -y nodejs npm build-essential libssl-dev
  echo  "Install Node Version Manager"
  wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | sh
  registerNVM="export NVM_DIR="$HOME/.nvm""
  echo $registerNVM >> ~/.profile
  source ~/.profile # Refresh PATH
  echo "Install & use Node 4.4.2 LTS"
  NODEVERSION=4.4.2
  nvm install $NODEVERSION --version
  nvm use $NODEVERSION
  echo "Update npm from 1.*.*/2.*.* to ^3.8.5"
  npm update -g npm
  # Install npm packages
  cd $PROJECT_DIR
  echo  "Install all missing packages based on package.json"
  # That is right, make sure you have a package.json file in your dev folder, specifying all the npm packages you need.
  sudo npm install
  echo "Run webpack-dev-server"
  webpack-dev-server
