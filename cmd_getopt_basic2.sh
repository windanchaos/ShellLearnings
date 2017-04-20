#!/bin/bash

# ./cmd_getopt_basic2.sh -a -b -c -g

while [ -n "$1" ]
do
        case $1 in
                -a) echo "found option: -a";;
                -b) echo "found option: -b";;
                -c) echo "found option: -c";;
                *) echo "not support option: -g";;
        esac
        shift
done

