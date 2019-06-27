# Cheatsheet: Vagrant


## Commands

  * `vagrant up` - start up the VM. Downloads and provisions it if necessary. (First make sure you're in your Vagrant folder.)
  * `vagrant ssh` - log into your VM so you can run commands inside it. Must be started up first.
  * While you're SSH'd into the Vagrant VM, run `exit` to log out and return to your "host" terminal.
  * `vagrant halt` - shut down the Vagrant VM (so it doesn't keep using up your computer's memory). Start it up again by running `vagrant up`.
  * `vagrant destroy` - shut down and permanently delete this VM. Files in your synced project folder won't be deleted, but other than that, the VM will be fully destroyed. Recreate it by running `vagrant up`.
