# The MIT License (MIT)
# Copyright (C) 2016 Paris Qian Sen
# Copyright (c) 2015 Renobit
# Copyright (c) 2015 David R. Myers II (drmyersii)
# Copyright (c) <Taylor Otwell>

# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Inspired by:
# https://github.com/drmyersii/vagrant-node-env
# https://github.com/laravel/homestead

settings = {
  vagrantfile_version: '2',  # To specifiy this config file is compliant Vagrant v2
  box: 'ubuntu/trusty64',    # Base Box (Image in Docker)
  memory: '512',            # Change Memory
  cpus: '1',                # Change CPU
  name: 'frontend-dev-env',  # Change it if you want
  ip: '127.0.0.1',
  port: {
    8080 => 8080, # webpack-dev-server
    9090 => 9090, # webpack backend server
    1337 => 1337  # Node Server
    # The vagrant will automatically add 22 => 2222 for the ssh. Override it if you want.
  },
  synced_folder: {
    # Note: The shared folder guest path must be absolute. Work even for windows, tested on Windows 7.
    './' => '/home/vagrant/frontend-dev-env'
  }
}

Vagrant.configure(settings[:vagrantfile_version]||="2") do |config|
  # SEE MORE @ https://docs.vagrantup.com.

  # Default Official Ubuntu Server 14.04 LTS (Trusty Tahr) builds => Most pupular vagrant box
  config.vm.box = settings[:box]||="ubuntu/trusty64"

  # Create a forwarded port mapping which allows access to a specific port
  settings[:port].each {|key, value|
    puts "Port #{key} forward to #{value}"
    config.vm.network :forwarded_port, guest: key, host: value
  }
  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: settings[:ip] ||= "127.0.0.1"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  settings[:synced_folder].each { |key, value|
    puts "Sync Folder #{key} map to #{value}."
    config.vm.synced_folder key, value
  }

  config.vm.provider "virtualbox" do |vb|
    vb.name = settings[:name] ||= "frontend-dev-env"
    vb.customize ["modifyvm", :id, "--ostype", "Ubuntu_64"]
    # Customize the amount of memory on the VM:
    vb.memory = settings[:memory]
    vb.cpus= settings[:cpus]
    # It is highly recommended to use VB 5.0 and above, then you will have the freedom to choose whether to open GUI or not at anytime.
    # vb.gui = true
  end

  config.vm.provision "shell", inline: <<-SHELL
  #!/bin/bash

  printf "Running Vagrant Provisioning..."

  printf "Updating Box..."
  apt-get update  # make sure the box is fully up to date

  # comment out the line below to disallow the system to upgrade
  apt-get upgrade -y && apt-get dist-upgrade -y

  printf "Installing a few necessary packages..."
  sudo apt-get update # reload the local package database
  sudo apt-get install -y git nodejs npm build-essential libssl-dev

  printf  "Install Node Version Manager"
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash

  printf  "Install & use Node 4.4.2 LTS"
  nvm run 4.4.2 --version
  printf  "Update npm"
  sudo npm update -g

  printf  "Install all missing packages based on package.json"
  # That is right, make sure you have a package.json file in your dev folder, specifying all the npm packages you need.
  sudo npm install
  SHELL

end
