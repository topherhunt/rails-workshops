# Vagrant

[Vagrant](TODO) is a tool that helps us set up a virtual machine (VM) for our development work, so that everyone is running their code in an identical environment and has all the necessary packages installed. This saves us tons of time that might be wasted on installation problems, OS / platform differences, questions like "Why does that command work on my PC but gives an error yours?", etc.

Here's a summary of how we'll use Vagrant:

  * Vagrant runs a virtual Linux OS inside your computer. Start the VM by running `vagrant up`. While it's running, it will use up ~1GB of memory.
  * To run Ruby or Rails commands (e.g. to start the Rails server), first you'll need to _ssh_ into (log into) the Vagrant VM.
  * The "Vagrant folder" is synced between your computer ("host") and the Vagrant VM, so that you can edit code in your favorite text editor (on the host) and those code changes will show up instantly inside the Vagrant VM.
  * Vagrant's network settings are configured so that you can make requests to http://localhost:3000/ in your web browser, and they'll reach the Rails server (if it's currently running).

![Diagram of how we'll use Vagrant](TODO)

To learn more about Vagrant, see https://www.vagrantup.com/intro/index.html.


## Installing Vagrant

Follow these steps to set up Vagrant so that we can get started right away in the workshop.

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


## Using multiple tabs

I'll often encourage you to open multiple terminal tabs or windows; for example, in one tab you might have the Rails server running, while in another tab you open the console to troubleshoot something. Keep in mind that each time you open a new tab, you'll need to run `vagrant ssh` again, then `cd` into the correct project folder, before you can run Ruby or Rails commands.
