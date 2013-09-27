#!/bin/sh

# Clean the logs
cd /opt/stack/openstack-neat && sudo ./all-clean-logs.sh

# Start OpenStack Neat
cd /opt/stack/openstack-neat && sudo ./all-start.sh

# Call VMs creation script
#./vms-boot-02.sh
