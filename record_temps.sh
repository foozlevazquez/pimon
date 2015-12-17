#!/bin/bash

cd /sys/bus/w1/devices

for F in 28-*; do
    SN=`echo $F | sed 's/^28-...//' | sed 's/...$//'`
    TEMP=`cat $F/w1_slave | /home/ivan/temp.sh`
    echo "temp.${SN}:${TEMP}|g" | nc -u -w0 alcazar 18125
done
