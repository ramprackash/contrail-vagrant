#!/bin/bash

# Setup root passwd
echo "root:c0ntrail123" | sudo chpasswd
#Enable root ssh login 
sed -i 's/^PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config
sudo service ssh restart

dpkg -i /sm-shared-folder/bin/server-manager-installer.deb
cp /shared-folder/.bash_profile /root/.
cp /shared-folder/.vimrc /root/.
mkdir -p /root/.vim/.swp /root/.vim/.backup /root/.vim/.undo
#apt-get -y install vim

#cd /opt/contrail/contrail_server_manager
#./setup.sh --all --hostip=192.168.1.10 --smlite
