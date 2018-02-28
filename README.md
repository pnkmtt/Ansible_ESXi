# Ansible provisioning ESXi Class
Basic class on Ansible using ESXi.

## Introduction

We will be using ansible to interact with ESXI, demostrating the power of Ansible to configure and control hosts within that virtual envrioment.

In order to do this we need not only ESXI working in VirtualBox but also a host we can run ansible from.


## Installing the Windows development Environment

To install our windows working environment we should follow the below sections in order:

1. Installing Git
2. Installing Virtualbox
3. Installing Putty
4. Installing Vagrant
4. Installing ESXI on VirtualBox


### Installing Git

Download Git command line setup from [https://github.com/git-for-windows/git/releases](https://github.com/git-for-windows/git/releases), and then run it.

Alternative: [https://git-scm.com/download/win](https://git-scm.com/download/win)

You may need to update your PATH so that you can find git on the command line. On windows 10 go to this URL for help:  [https://www.java.com/en/download/help/path.xml](https://www.java.com/en/download/help/path.xml)

### Installing VirtualBox


You need now to download VirtualBox, use the following link to download the latest release of VirtualBox [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)

The setup here is somewhat long, but if you just click “Next” without any changes, it will be fine.

### Installing Vagrant

First, you need to download Vagrant setup from [http://www.vagrantup.com/downloads.html](http://www.vagrantup.com/downloads.html), and then run it.

The setup wizard is straightforward -- it will ask you to accept the license agreement and the path to install. Since you will need to use command line, you may want to choose a short path. For example in our case, we will use `D:\Vagrant`. The installer may ask you to restart at the end of setup.

### Installing Putty

You now need to download and install Putty. Use the following link to download the latest release of Putty [https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)

### Installing ESXI on VirtualBox

Setps Copied from the following URL, I pulled the parts to insure that the data is checked in, but you should visit the link for complete data: https://medium.com/@zedr/setting-up-the-vsphere-hypervisor-on-virtualbox-78d401bcd581

Download the free vSphere Hypervisor ISO from VMware’s website. Select verson 6.0, as the latest 6.5 doesn’t currently work on VirtualBox. You will need to log in with a valid VMware account.  https://my.vmware.com/group/vmware/evalcenter?p=free-esxi6

Run VirtualBox and create a new virtual machine. Name it ESXi (or whatever you prefer), select Linux as its type, and Other Linux (64-bit) as the version.

The virtual machine will need at least 4GB of memory.

Create a new virtual hard disk: select VDI as its file type and Fixed size its storage type. Size the disk according to your use case; I went with 20GB.

We will need to make a few additional tweaks to the configuration of the newly created virtual machine. Right click on it and select Settings (CTRL+S) from the menu.

Select System→Processor and assign two CPUs.

Next, select the Network tab and configure Adapter 1. Select Host-only adapter and one of the vboxnet networks, most likely vboxnet0.Expand the Advanced section and select Intel PRO/1000 MT Server (82545EM) as the Adapter Type and Allow All for the Promiscuous Mode.

Finally, mount the vSphere Hypervisor ISO in the Storage tab. Select the Empty optical drive and Choose the Virtual Optical Disk File by clicking on the CD icon on the right.

Select the VMware-VMvisor-Installer ISO you just downloaded, and it will replace the Empty disk in the Storage Tree.
Click OK to exit the Settings window and return to the VirtualBox main window. Start the VM. The installer will start and, after a few seconds, you will be presented with a screen having a grey and yellow background.

After all the modules load successfully, a black screen will appear asking you if you wish to continue.

If you have no objections, accept the EULA by pressing F11. Select the ATA VBOX HARDDISK as the target installation disk and press Enter.

Choose an appropriate keyboard layout and set the root password for administrating the Hypervisor (and don’t forget it!). The installation program will perform a final system scan and probably log about Hardware Virtualization not being a feature of the CPU; you can ignore it.
Finally, confirm your intention to install the software by pressing F11 when prompted. If everything goes well, the installation program will report a success and ask you to remove the CD and reboot. You can do that by clicking on Devices→Optical Drives→Remove disk from optical drive.

After rebooting the same set of loading screens we saw during the installation process will show up again. Eventually the Hypervisor services will be brought online and the system will be ready to accept commands.

### Download the class material via git

From a new or existing directory (i.e. `C:\Users\Panik\Downloads`) on the command line, run this command: `git clone https://github.com/pnkmtt/Ansible_ESXi`

This will download the Ansible files and allow us to create your new VirtualBox VM in a directory called Ansible_ESXi.

Once the clone has completed, `cd` to the target directory, For example `cd C:\User\panik\Downloads\Ansible_ESXi`

## Creating an Ansible Hosts within Virtual Box

To create the Ansible host we run `vagrant up` from our git clone directory.

This will create an asible host that we can then use to address the running esxi server within virtualbox.



## Creating your ESXi VM

Now that we have everything installed we need to download the required ESXI files.


### Download the class material via git

From a new or existing directory (i.e. `C:\Users\Panik\Downloads`) on the command line, run this command: `git clone https://github.com/pnkmtt/Ansible_ESXi`

This will download the Ansible files and allow us to create your new VirtualBox VM in a directory called Ansible_ESXi.

Once the clone has completed, `cd` to the target directory, For example `cd C:\User\panik\Downloads\Ansible_ESXi`





