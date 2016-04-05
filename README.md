vagrant-frontend
===============
A minimal vagrant file for front end development

Getting Started
----------------

1. Install [vagrant](https://www.vagrantup.com/downloads.html), make sure you can access it from Terminal/CMD/git-bash/any command-line tool you prefer (Obviously)
2. Put this Vagrantfile under the root directory of your project.
3. Run `vagrant plugin install vagrant-vbguest` (Optional)
4. Make sure your have a NPM project.json file in your project folder, specifying all the packages you want to install.
5. Now please start webpack-dev-server from `vagrant ssh`. *I assume you use webpack, so I have opened 2 webpack-specified port for you, you are welcome.*

Warning
-------

To be clear, this is my own dog food. 
**I am also a newbie**, so use it with care. 
If you spot any bugs, a new issue tickets are very very welcome. 
However please don't directly throw me enquires, as I may not answer u correctly.
I believe my code and comments are straight-forward enough. Check with [Stack Overflow](http://stackoverflow.com/questions/tagged/vagrant) or [Official Doc](https://www.vagrantup.com/docs/) if needed.
Have fun~

Credit
--------
This project has referenced many popular vagrant configurations, including:

* https://github.com/drmyersii/vagrant-node-env
* https://github.com/laravel/homestead
