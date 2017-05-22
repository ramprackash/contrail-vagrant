#!/bin/bash

# Setup root passwd
echo "root:c0ntrail123" | sudo chpasswd
#Enable root ssh login 
sed -i 's/^PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config
sudo service ssh restart

ifconfig eth0
apt-get update
apt-get -y install vim
#apt-get -y install nfs-common
#mkdir -p /github-build
#sudo mount 10.160.0.152:/contrail/contrail /github-build
dpkg -i /sm-shared-folder/bin/server-manager-installer.deb
#dpkg -i /github-build/R4.0/${sm_build_num}/ubuntu-14-04/mitaka/artifacts/contrail-server-manager-installer_4.0.0.0-${sm_build_num}~mitaka_all.deb

cd /opt/contrail/contrail_server_manager
./setup.sh --all --hostip=192.168.1.10

cp /shared-folder/.bash_profile /root/.
cp /shared-folder/.vimrc /root/.
mkdir -p /root/.vim/.swp /root/.vim/.backup /root/.vim/.undo

service contrail-server-manager restart
server-manager add image -f /shared-folder/json/package.json
