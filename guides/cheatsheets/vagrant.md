# Cheatsheet: Command line / terminal / Vagrant


## Setup

  * Install Vagrant. (TODO: Link)
  * Install VirtualBox. (TODO: link)
  * Download my `Vagrantfile` from [TODO: link]. Save it in a new folder called "vagrant". This will be your "Vagrant folder", the parent folder containing all your Rails projects.
  * Open your Terminal. Change directory to this vagrant folder.
  * Run `vagrant up` to download and start the Vagrant VM. The first-time download will take 10+ minutes.
  * Once it's started, run `vagrant ssh` to log into the VM. You'll log in at the `/vagrant` folder which is synced to your host's Vagrant folder.
  * Type `exit` to stop the SSH session and return to your host terminal.


## How to log into your Vagrant VM

Open your Terminal client and navigate to your Vagrant folder. That command will look different depending on a) what OS (operating system) you're using, and b) where your Vagrant folder lives.

```
# Windows example:
c:\> cd Documents\my_vagrant_folder

# Mac OSX example:
$ cd ~/Sites/my_vagrant_folder
```

Start the Vagrant VM:

```bash
$ vagrant up
```

Then log into the VM using the `ssh` command:

```bash
$ vagrant ssh
  TODO - output
```

Once you've SSH'd in successfully, you're ready to start working on Rails sites!



## Useful commands

  * `vagrant up` - start up the VM. Downloads and provisions it if necessary. (First make sure you're in your Vagrant folder.)
  * `vagrant ssh` - log into your VM so you can run commands inside it. Must be started up first.
  * While you're SSH'd into the Vagrant VM, run `exit` to log out and return to your "host" terminal.
  * `vagrant halt` - shut down the Vagrant VM (so it doesn't keep using up your computer's memory). Start it up again by running `vagrant up`.
  * `vagrant destroy` - shut down and permanently delete this VM. Files in your synced project folder won't be deleted, but other than that, the VM will be fully destroyed. Recreate it by running `vagrant up`.


## Using multiple tabs

I'll often encourage you to open multiple terminal tabs or windows; for example, in one tab you might have the Rails server running, while in another tab you open the console to troubleshoot something. Keep in mind that each time you open a new tab, you'll need to run `vagrant ssh` again before you can run Ruby or Rails commands.
