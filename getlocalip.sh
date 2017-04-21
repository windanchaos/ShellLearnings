#!/bin/bash

IP=`ifconfig eth0 | grep 'inet addr' | sed 's/^.*addr://g' | awk '{print $1}'`
MSK=`ifconfig eth0 | grep 'inet addr' | sed 's/^.*Mask://g'`

echo "$IP / $MSK"
