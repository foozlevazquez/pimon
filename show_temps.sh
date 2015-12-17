#!/bin/bash

cd /sys/bus/w1/devices

while true; do
    for F in 28-*; do
	SN=`echo $F | sed 's/^28-.....//' | sed 's/...$//'`
	echo -n "$SN "
	cat $F/w1_slave | ~/temp.sh ;
    done;
    sleep 60
    echo `date` "#################"
done
