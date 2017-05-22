source /etc/contrail/openstackrc
wget https://launchpad.net/cirros/trunk/0.3.0/+download/cirros-0.3.0-x86_64-disk.img
glance image-create --name 'cirros' --visibility public --container-format ovf --disk-format qcow2 --file ./cirros-0.3.0-x86_64-disk.img
neutron net-create testvn_1
neutron subnet-create testvn_1 30.30.31.0/24 --name test_sub_1
image_id=$(nova image-list | grep cirros| grep -oh "[a-z0-9]*-[a-z0-9]*-[a-z0-9]*-[a-z0-9]*-[a-z0-9]*")
net_id=$(nova net-list | grep testvn_1| grep -oh "[a-z0-9]*-[a-z0-9]*-[a-z0-9]*-[a-z0-9]*-[a-z0-9]*")
nova boot --flavor 1 --nic net-id=$net_id --image $image_id vm105
nova list
nova boot --flavor 1 --nic net-id=$net_id --image $image_id vm106
