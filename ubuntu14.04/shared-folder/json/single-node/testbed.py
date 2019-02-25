from fabric.api import env

#Management ip addresses of hosts in the cluster
host1 = 'root@192.168.1.11'

#External routers if any
#for eg.
#ext_routers = [('mx1', '192.168.121.1')]
ext_routers = []

#Autonomous system number
router_asn = 64512

#Host from which the fab commands are triggered to install and provision
host_build = 'root@192.168.1.11'

control_data = {
        host1 : { 'ip': '192.168.10.11/24', 'gw': '192.168.121.1', 'device': 'eth2' }
}

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
    'all': ['server-manager-lite.sm-domain.com']
}

# Passwords of each host
# for passwordless login's no need to set env.passwords,
# instead populate env.key_filename in testbed.py with public key.
env.passwords = {
    host1: 'c0ntrail123',
    host_build: 'c0ntrail123',
}

# SSH Public key file path for passwordless logins
# if env.passwords is not specified.
#env.key_filename = '/root/.ssh/id_rsa.pub'

#For reimage purpose
env.ostypes = {
    host1:'ubuntu',
}

env.openstack = {
    'manage_amqp': "true"
}

env.dpdk = {
   host1: {
       'coremask': '0-2,3',
       'huge_pages': 50
   }
}
