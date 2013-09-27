#!/bin/sh

# --- Anton's answer: https://groups.google.com/forum/#!topic/openstack-neat/PKz2vpKPMcA

# 1.
/opt/stack/2013-mac5910-neat-experiments/vms-boot-02.sh

# 2.
/opt/stack/spe-2013-experiments/disable-distributor.sh

# 3.
cd /opt/stack/spe-2013-experiments && python workload-distributor.py full-utilization-02

# 4.

