#!/bin/sh

# REQUIREMENTS

# NFS:
sudo service rpcbind start
sudo mkdir -p /var/lib/nova/instances
sudo mount -o hard,intr,noatime 10.7.22.10:/nova-instances /var/lib/nova/instances

# Clean logs
cd /opt/stack/openstack-neat && sudo ./all-clean-logs.sh

# --- Anton's Thesis steps

# 1. Clone/pull OpenStack-neat
cd /opt/stack/openstack-neat/; git pull

# 2. Install dependencies
sudo /opt/stack/openstack-neat/setup/deps-fedora-devstack.sh
sudo /opt/stack/openstack-neat/setup/deps-fedora-devstack-nfs.sh

# 3. Edit neat.conf

# 4. Install OpenStack-Neat
sudo python /opt/stack/openstack-neat/setup.py install

# 5.
sudo /opt/stack/openstack-neat/compute-clone-neat.py

# 6.
sudo /opt/stack/openstack-neat/compute-install-deps.py
sudo /opt/stack/openstack-neat/compute-install-neat.py

# 7.
sudo /opt/stack/openstack-neat/compute-copy-conf.py

# 8.
cd /opt/stack/openstack-neat && sudo ./all-start.sh




# Call VMs creation script
#./vms-boot-02.sh
