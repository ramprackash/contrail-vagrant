#!/bin/bash

# Setup root passwd
echo "root:c0ntrail123" | sudo chpasswd
#Enable root ssh login 
sed -i 's/^PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/^PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo service sshd restart

cp /shared-folder/.bash_profile /root/.
cp /shared-folder/.vimrc /root/.
mkdir -p /root/.vim/.swp /root/.vim/.backup /root/.vim/.undo

mkdir ~/.ssh
chmod 700 ~/.ssh
cd ~/.ssh
cp /shared-folder/sm-id_rsa.pub authorized_keys
cat /shared-folder/id_rsa.pub >> authorized_keys
cp /shared-folder/sm-id_rsa.pub ~/.ssh/id_rsa.pub
cp /shared-folder/sm-id_rsa ~/.ssh/id_rsa
chmod 700 ~/.ssh/id_rsa

chmod 600 ~/.ssh/authorized_keys
chown -R root ~/.ssh

sed -i '/^127.0.0.1.*$/d' /etc/hosts
sed -i '/^::1.*$/d' /etc/hosts
hostname=`hostname`
echo "127.0.0.1 $hostname.englab.juniper.net $hostname" >> /etc/hosts
#echo "127.0.0.1 localhost" >> /etc/hosts
rm -f /etc/localtime && ln -s /usr/share/zoneinfo/US/Pacific /etc/localtime

echo "waiting for routes to stabilize..."
sleep 10

ip route delete default via 192.168.121.1 2>&1 >/dev/null
#ip route add 0.0.0.0 via 10.84.22.254 dev eth1

#yum -y install python-pip
#pip install --upgrade pip
#pip install docker-compose==1.9.0
#modprobe ip_vs
#yum -y install vim
#yum -y install kernel
#yum -y update
#reboot -h now

#cd /root && git clone https://github.com/Juniper/contrail-ansible-deployer.git
#git clone https://github.com/ramprackash/contrail-kolla-ansible.git
#cd contrail-kolla-ansible && git checkout deployer


