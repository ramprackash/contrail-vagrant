#!/bin/bash

# Setup root passwd
echo "root:c0ntrail123" | sudo chpasswd
#Enable root ssh login 
sed -i 's/^#PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo service sshd restart

cp /shared-folder/.bash_profile /root/.
cp /shared-folder/.vimrc /root/.
mkdir -p /root/.vim/.swp /root/.vim/.backup /root/.vim/.undo

mkdir ~/.ssh
chmod 700 ~/.ssh
cd ~/.ssh
cp /shared-folder/id_rsa.pub authorized_keys
cp /shared-folder/sm-id_rsa.pub ~/.ssh/id_rsa.pub
cp /shared-folder/sm-id_rsa ~/.ssh/id_rsa

chmod 600 ~/.ssh/authorized_keys
chown -R root ~/.ssh

#sed -i '/^127.0.0.1.*$/d' /etc/hosts
hostname=`hostname`
#echo "127.0.0.1 localhost" >> /etc/hosts
#echo "127.0.0.1 $hostname.sm-domain.com $hostname" >> /etc/hosts

#yum install -y epel-release

#yum -y install centos-release-openstack-pike
#yum -y install centos-release-openstack-ocata
yum -y install vim git ansible
#yum -y install ansible-2.3.1.0

#yum -y install python-pip
#pip install --upgrade pip
#pip install docker-compose==1.9.0
#modprobe ip_vs


cd /root && git clone https://github.com/Juniper/contrail-ansible-deployer.git
git config --global user.email "rammohan@juniper.net"
git config --global user.name "Ramprakash"

#if [ ${hostname} == 'aio' ]; then
#  yum -y install kernel-3.10.0-693.21.1.el7.x86_64
#  yum update
#  reboot -h now
#fi
