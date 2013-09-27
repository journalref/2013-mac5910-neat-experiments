#!/bin/sh

# Clean logs
cd /opt/stack/openstack-neat && sudo ./all-clean-logs.sh

# Start Neat
cd /opt/stack/openstack-neat && sudo ./all-start.sh
