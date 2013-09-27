#!/bin/sh

. /opt/stack/devstack/accrc/demo/demo

for i in {1..2}
do
    nova boot --flavor pico --key_name test \
      --image $(glance index | grep ubuntu-precise | awk '{print $1}') \
      `printf ubuntu%02d $i`
    sleep 5
done
