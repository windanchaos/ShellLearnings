#!/bin/bash

# usage: 
# ./cmd_getopt_2.sh -ac
# ./cmd_getopt_2.sh -a -b hello -cd file file2

set -- `getopt -q ab:c "$@"`

while [ -n "$1" ]
do
	case $1 in
		-a) echo "found option: -a";;
		-b) param="$2"
		    echo "found option: -b, with param: $param"
		    shift;;
		-c) echo "found option: -c";;
		--) shift
		    break;;
		*) echo "not found option: $1";;
	esac
	shift
done

count=1
for param in "$@"
do
	echo "param $count: $param"
	count=$[ $count + 1 ]
done
