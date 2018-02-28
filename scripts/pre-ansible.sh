#!/bin/bash
echo '-----------------------Run update-------------------------'
sudo apt update
#sudo apt upgrade -y
echo '-----------------------Install software-properties-common and python-software-properties-------------------------'
sudo apt install software-properties-common python-software-properties -y
echo '-----------------------Install ansible repository-------------------------'
sudo apt-add-repository ppa:ansible/ansible
echo '-----------------------Run update-------------------------'
sudo apt update
echo '-----------------------Install ansible-------------------------'
sudo apt install ansible -y
echo '-----------------------Install pyvsphere-------------------------'
#https://www.saltycrane.com/blog/2010/02/how-install-pip-ubuntu/
sudo apt-get install python-pip python-dev build-essential -y
sudo pip install --upgrade pip 
sudo pip install --upgrade virtualenv
sudo pip install pysphere
echo 'Because I did this on windows we copy the inventory file to a directory and fix permissions - this is a hack'
cp /vagrant/hosts /var/tmp/hosts
chmod -x /var/tmp/hosts
echo '-----------------------Configure ansible to ignore host_key_checking-------------------------'
echo '[defaults]' > /etc/ansible/ansible.cfg
echo 'host_key_checking = False' >> /etc/ansible/ansible.cfg