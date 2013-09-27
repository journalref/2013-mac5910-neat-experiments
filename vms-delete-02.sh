#!/bin/sh

for i in {1..2}
do
    nova delete `printf ubuntu%02d $i`
done
