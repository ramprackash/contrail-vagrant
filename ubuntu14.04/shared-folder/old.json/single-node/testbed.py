from fabric.api import env

#Management ip addresses of hosts in the cluster
host1 = 'root@192.168.1.20'

#External routers if any
#for eg.
#ext_routers = [('mx1', '10.204.216.253')]
ext_routers = []

#Autonomous system number
router_asn = 64512

#Host from which the fab commands are triggered to install and provision
host_build = 'root@192.168.1.11'

#Role definition of the hosts.
env.roledefs = {
    'all': [host1],
    'contrail-controller': [host1],
    'openstack': [host1],
    'contrail-compute': [host1],
    'contrail-analytics': [host1],
    'contrail-analyticsdb': [host1],
    'build': [host_build],
}

#Hostnames
env.hostnames = {
    'all': ['server1']
}

# Passwords of each host
# for passwordless login's no need to set env.passwords,
# instead populate env.key_filename in testbed.py with public key.
env.passwords = {
    host1: 'c0ntrail123',
    host_build: 'c0ntrail123'
}

# SSH Public key file path for passwordless logins
# if env.passwords is not specified.
#env.key_filename = '/root/.ssh/id_rsa.pub'

#For reimage purpose
env.ostypes = {
    host1:'ubuntu'
}

env.kernel_upgrade=False
env.container = {
    'keystone_ip': "192.168.1.20",
    'keystone_admin_password': "c0ntrail123"
}
cloud_orchestrator="openstack"
manage_neutron=False
config_ip_list=['192.168.1.20']
env.keystone = {
    'ip': "192.168.1.20",
    'admin_password': "c0ntrail123"
}
external_rabbitmq_servers=['192.168.1.20']
contrail_compute_mode="bare_metal"
env.openstack = {
    'manage_amqp': "true"
}
