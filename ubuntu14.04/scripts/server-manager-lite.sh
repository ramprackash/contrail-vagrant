#!/bin/bash

# Setup root passwd
echo "root:c0ntrail123" | sudo chpasswd
#Enable root ssh login 
sed -i 's/^PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config
sudo service ssh restart

dpkg -i /sm-shared-folder/bin/server-manager-installer.deb
mkdir -p /root/.vim/.swp /root/.vim/.backup /root/.vim/.undo
cp /shared-folder/.vimrc /root/.
apt-get -y install vim
/opt/contrail/contrail_server_manager/provision_containers.sh -t /shared-folder/json/single-node/testbed.py -c /sm-shared-folder/bin/contrail-cloud-docker_4.0.0.0-3073-mitaka.tgz --cluster-id cluster1 -ip 192.168.1.11 -d sm-domain.com
#cp /shared-folder/.bash_profile /root/.

#cd /opt/contrail/contrail_server_manager
#./setup.sh --all --hostip=192.168.1.10 --smlite
