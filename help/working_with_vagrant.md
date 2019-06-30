# Vagrant

[Vagrant](https://www.vagrantup.com/intro/index.html) is a tool that helps us set up a virtual machine (VM) for our development work, so that everyone is running their code in an identical environment and has all the necessary packages installed. This saves us tons of time that might be wasted on installation problems, OS / platform differences, questions like "Why does that command work on my PC but gives an error yours?", etc.

When we use Vagrant for Rails development, your Rails server will run _inside_ the Vagrant VM. Any Rails terminal commands you need to run, will also be run inside the VM. But you'll use your normal code editor (on your "host" machine, not in the Vagrant VM) to edit code, and you'll load pages in your normal web browser on your host machine. (I recommend Chrome.)

To learn more about Vagrant, see https://www.vagrantup.com/intro/index.html.


## Installing Vagrant

Follow these steps to set up Vagrant so that we can get started right away in the workshop.

  * Install Vagrant. (TODO: Link)
  * Install VirtualBox. (TODO: link)
  * On your computer, create a new folder to contain this Vagrant environment and all of your Rails projects. Call this folder "vagrant" or "web_projects" or something easy to type (no spaces) since you'll often need to navigate to it in your terminal. All of your Rails projects will live inside this folder.
  * In this repo's `vagrant/` folder, you'll find two files named `Vagrantfile` and `vagrant_provision.sh`. Download both of them to your new vagrant folder.
  * Open your Terminal. Change directory to this vagrant folder. That command will look different depending on your OS and your folder name, but on my Windows PC, the command is: [TODO]
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


## Using multiple tabs

I'll often encourage you to open multiple terminal tabs or windows; for example, in one tab you might have the Rails server running, while in another tab you open the console to troubleshoot something. Keep in mind that each time you open a new tab, you'll need to run `vagrant ssh` again, then `cd` into the correct project folder, before you can run Ruby or Rails commands.


## Cheatsheet of useful commands

  * `vagrant up` - start up the VM. Downloads and provisions it if necessary. (First make sure you're in your Vagrant folder.)
  * `vagrant ssh` - log into your VM so you can run commands inside it. Must be started up first.
  * While you're SSH'd into the Vagrant VM, run `exit` to log out and return to your "host" terminal.
  * `vagrant halt` - shut down the Vagrant VM (so it doesn't keep using up your computer's memory). Start it up again by running `vagrant up`.
  * `vagrant destroy` - shut down and permanently delete this VM. Files in your synced project folder won't be deleted, but other than that, the VM will be fully destroyed. Recreate it by running `vagrant up`.
