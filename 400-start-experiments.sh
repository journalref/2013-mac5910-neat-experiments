#!/bin/sh

# --- Anton's answer: https://groups.google.com/forum/#!topic/openstack-neat/PKz2vpKPMcA

# 1.
/opt/stack/2013-mac5910-neat-experiments/vms-boot-02.sh

# 2.
/opt/stack/spe-2013-experiments/disable-distributor.sh

# 3.
cd /opt/stack/spe-2013-experiments && python workload-distributor.py full-utilization-02

# 3.1 --- Merged with Anton's answer: https://groups.google.com/forum/#!topic/openstack-neat/yZlsCo9814U
# The workload-starter.py script should be deployed, configured with the server IP, and automatically started in the VM image on boot. This way you can create a single image, and then create multiple instances which will automatically request the server for the workload. Then, with the workload-distributor.py script you can distribute workload traces to all the VMs at the same time.
cd /opt/stack/spe-2013-experiments && python workload-starter.py 143.107.45.200 7

# 4.

