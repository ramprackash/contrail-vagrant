#!/bin/bash

set -e

mkdir ~/.ssh
chmod 700 ~/.ssh
cd ~/.ssh
cp /tmp/vagrant.pub authorized_keys
chmod 600 ~/.ssh/authorized_keys
chown -R vagrant ~/.ssh

# Add vagrant account to sudoers
echo " " >> /etc/sudoers
echo "# User rules for vagrant" >> /etc/sudoers
echo "vagrant ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
echo " " >> /etc/sudoers
visudo -c

# Setup Sudoers
# Comment for rsync to work.
sudo sed -i -r 's/^Defaults .*requiretty/#Defaults requiretty/' /etc/sudoers
