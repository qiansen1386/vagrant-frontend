vagrant-frontend
===============

> ### NOTE: Deprecated!!
After trying so many solutions, I think none of the approaches are ideal, details explained @ [Frontend Learning Note 3 - Vagrant, VM & Shell](http://qiansen1386.github.io/post/2016/04/frontend-learning-note-3/).
Right now I am looking for the possibilities of directly coding inside the virtual machine. May have drawbacks also, but certainly feasible. The story on this new topic may be listed in episode 4/5 of this series. (The No.4 is already planed and half way done.)

A minimal vagrant file for front end development

Support: Windows 7 + virtualbox

Getting Started
----------------

1. Install [vagrant](https://www.vagrantup.com/downloads.html), make sure you can access it from Terminal/CMD/git-bash/any command-line tool you prefer (Obviously)
2. Put this Vagrantfile under the root directory of your project.
3. Run `vagrant plugin install vagrant-vbguest` (Optional)
4. Make sure your have a NPM project.json file in your project folder, specifying all the packages you want to install.
5. Now please start webpack-dev-server from `vagrant ssh`. *I assume that you use webpack, so I have opened 2 webpack-specified ports for you, you are welcome.*

Warning
-------

To be clear, **I am also a newbie**, afterall this is just my own dog food. Hence you have to use with care. According to my experience, there are 3 main drawbacks.

1. The initialization will be very very slow. Because I would like to use a plain OS image + provision scripts, So you have to bare with the slow installation.
2. The feature is pretty limited. For example, there is no certificate protection like laravel/homestead, and there is no DB, as it claims, it is only for frontend development.
3. Lack of testing. Seriously, it is only tested locally on Windows 7. What I can say is I tested every single line of it, but I cannot guarantee whether it is gonna work on your environment or not.

Bug Report
----------

I believe my code and comments are straight-forward enough. Check with [Stack Overflow](http://stackoverflow.com/questions/tagged/vagrant) or [Official Doc](https://www.vagrantup.com/docs/) if needed.

If you spot any bugs, a new issue tickets is very very welcome.
However please don't directly throw me enquires, as I may not answer u correctly.
Have fun~

Credit
--------
This project has referenced many popular vagrant configurations, including:

* https://github.com/drmyersii/vagrant-node-env
* https://github.com/laravel/homestead
* https://github.com/robertkowalski/vagrant-nvm
