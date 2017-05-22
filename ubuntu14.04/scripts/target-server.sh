#!/bin/bash

# Setup root passwd
echo "root:c0ntrail123" | sudo chpasswd
#Enable root ssh login 
sed -i 's/^PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config
sudo service ssh restart

#Set hostname with full domain
sed -i '/^127.0.0.1.*$/d' /etc/hosts
hostname=`hostname`
echo "127.0.0.1 localhost" >> /etc/hosts
echo "127.0.0.1 $hostname.sm-domain.com $hostname" >> /etc/hosts
cp /shared-folder/.bash_profile /root/.
#cp /shared-folder/.vimrc /root/.
#apt-get update
#apt-get -y install vim
#mkdir -p /root/.vim/.swp /root/.vim/.backup /root/.vim/.undo

