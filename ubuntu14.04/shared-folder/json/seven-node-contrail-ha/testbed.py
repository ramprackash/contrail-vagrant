from fabric.api import env

os_username = 'admin'
os_password = 'contrail123'
os_tenant_name = 'admin'

server1 = 'root@192.168.1.21'
server2 = 'root@192.168.1.22'
server3 = 'root@192.168.1.23'
server4 = 'root@192.168.1.24'
server5 = 'root@192.168.1.25'
server6 = 'root@192.168.1.26'
server7 = 'root@192.168.1.27'

#ext_routers = [('mx1', '10.204.216.253')]
ext_routers = []

router_asn = 64512

host_build = 'root@192.168.1.11'
env.roledefs = {
    'all': [server1, server2, server3, server4, server5, server6, server7],
    'contrail-controller': [server1, server2, server3],
    'openstack': [server5],
    'contrail-compute': [server6, server7],
    'contrail-analytics': [server1, server2, server3],
    'contrail-analyticsdb': [server1, server2, server3], 
    'contrail-lb': [server4], 
    'build': [host_build],
}

env.openstack_admin_password = 'contrail123'

env.hostnames = {
     'all': ['server1', 'server2', 'server3', 'server4', 'server5', 'server6', 'server7']
}

env.password = 'c0ntrail123'
env.passwords = {
    server1: 'c0ntrail123',
    server2: 'c0ntrail123',
    server3: 'c0ntrail123',
    server4: 'c0ntrail123',
    server5: 'c0ntrail123',
    server6: 'c0ntrail123',
    server7: 'c0ntrail123',
    host_build: 'c0ntrail123'
}

env.ostypes = {
    server1:'ubuntu',
    server2:'ubuntu',
    server3:'ubuntu',
    server4:'ubuntu',
    server5:'ubuntu',
    server6:'ubuntu',
    server7:'ubuntu'
}

minimum_diskGB = 32

control_data = {
    server1 : { 'ip': '192.168.10.21/24', 'gw' : '192.168.10.1', 'device': 'eth2' },
    server2 : { 'ip': '192.168.10.22/24', 'gw' : '192.168.10.1', 'device': 'eth2'  },
    server3 : { 'ip': '192.168.10.23/24', 'gw' : '192.168.10.1', 'device': 'eth2' },
    server4 : { 'ip': '192.168.10.24/24', 'gw' : '192.168.10.1', 'device': 'eth2' },
    server5 : { 'ip': '192.168.10.25/24', 'gw' : '192.168.10.1', 'device': 'eth2' },
    server6 : { 'ip': '192.168.10.26/24', 'gw' : '192.168.10.1', 'device': 'eth2' },
    server7 : { 'ip': '192.168.10.27/24', 'gw' : '192.168.10.1', 'device': 'eth2' },
}

static_route  = {
    server7 : [{ 'ip': '77.77.2.0', 'netmask' : '255.255.255.0', 'gw':'77.77.1.254', 'intf': 'eth2' },
             { 'ip': '77.77.3.0', 'netmask' : '255.255.255.0', 'gw':'77.77.1.254', 'intf': 'eth2' }],
    server6 : [{ 'ip': '77.77.1.0', 'netmask' : '255.255.255.0', 'gw':'77.77.3.254', 'intf': 'eth2' },
             { 'ip': '77.77.2.0', 'netmask' : '255.255.255.0', 'gw':'77.77.3.254', 'intf': 'eth2' }]
}

env.kernel_upgrade=False
cloud_orchestrator="openstack"
env.container = {
    'keystone_ip': "192.168.1.25",
    'keystone_admin_password': "contrail123"
}
manage_neutron=False
env.keystone = {
    'ip': "192.168.1.25",
    'admin_password': "contrail123"
}
#external_rabbitmq_servers=['77.77.1.10']
contrail_compute_mode="bare_metal"
env.openstack = {
    'manage_amqp': "true"
}
env.interface_rename = False 
multi_tenancy = True
do_parallel = True
env.encap_priority =  "'VXLAN','MPLSoUDP','MPLSoGRE'"
#env.enable_lbaas = True
env.test_repo_dir='/root/contrail-test'
minimum_diskGB = 32


