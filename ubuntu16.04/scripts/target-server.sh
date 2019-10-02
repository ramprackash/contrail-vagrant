#!/bin/bash

# Setup root passwd
echo "root:c0ntrail123" | sudo chpasswd
#Enable root ssh login 
sed -i 's/^PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/^PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo service sshd restart
apt-get -y install python


#cp /shared-folder/.bash_profile /root/.
#cp /shared-folder/.vimrc /root/.
#mkdir -p /root/.vim/.swp /root/.vim/.backup /root/.vim/.undo
#
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

#sed -i '/^127.0.0.1.*$/d' /etc/hosts
#sed -i '/^::1.*$/d' /etc/hosts
#hostname=`hostname`
#echo "127.0.0.1 $hostname.englab.juniper.net $hostname" >> /etc/hosts
##echo "127.0.0.1 localhost" >> /etc/hosts
#rm -f /etc/localtime && ln -s /usr/share/zoneinfo/US/Pacific /etc/localtime
#
##Set hostname with full domain
#sed -i '/^127.0.0.1.*$/d' /etc/hosts
#hostname=`hostname`
#echo "127.0.0.1 localhost" >> /etc/hosts
#echo "127.0.0.1 $hostname.sm-domain.com $hostname" >> /etc/hosts
#cp /shared-folder/.bash_profile /root/.
#cp /shared-folder/.vimrc /root/.
#echo "waiting for routes to stabilize..."
#sleep 10
#
#sed -i 's/dns-nameserver/#dns-nameserver/g' /etc/network/interfaces
#service networking restart
#ip route delete default via 192.168.121.1 2>&1 >/dev/null
#dhclient eth2 -r
#dhclient eth2
#apt-get update
#apt-get -y install vim git
#mkdir -p /root/.vim/.swp /root/.vim/.backup /root/.vim/.undo
#
