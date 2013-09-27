#!/bin/sh

# Start DevStack on Master
#./devstack/stack.sh

# Sync /etc/hosts
sudo scp /etc/hosts compute01:/etc/hosts
sudo scp /etc/hosts compute02:/etc/hosts
sudo scp /etc/hosts compute03:/etc/hosts

# Start DevStack on compute nodes
#ssh imecompute01 './devstack/stack.sh'
#ssh imecompute02 './devstack/stack.sh'
#ssh imecompute03 './devstack/stack.sh'

# Apply config
cd /opt/stack/openstack-neat/ && sudo python setup.py install

# Sync config to compute nodes
cd /opt/stack/openstack-neat/ && sudo ./compute-copy-conf.py

# Load the admin credentials
. /opt/stack/devstack/accrc/admin/admin

# Create the flavor used on the experiments
nova flavor-create pico 7 128 0 1

# Load the demo credentials
. /opt/stack/devstack/accrc/demo/demo

# Create the image
glance image-create --name ubuntu-precise-server-i386 --disk-format=raw --container-format=bare --file /var/lib/nova/instances/precise-server-cloudimg-i386-disk1.img

# Create an ssh key
sudo modprobe nbd
nova keypair-add test > /opt/stack/2013-mac5910-neat-experiments/test.id_rsa

# Allow ping and ssh on the default security group
nova secgroup-add-rule default tcp 22 22 0.0.0.0/0
nova secgroup-add-rule default icmp -1 -1 0.0.0.0/0
