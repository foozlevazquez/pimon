#!/bin/bash

cd /sys/bus/w1/devices

for F in 28-*; do
    SN=`echo $F | sed 's/^28-...//' | sed 's/...$//'`
    NAME=`dig -t txt +noall +answer ${SN}.sensors.local | awk '{print $NF } | sed 's/"//g'`
    TEMP=`grep 't=' ${F}/w1_slave | sed 's/^.*t=//' | awk '{ printf("%f\n", (($1 / 5000.0) * 9.0 ) + 32) }'`
    echo "temp.${NAME}:${TEMP}|g" | nc -u -w0 alcazar 18125
done
