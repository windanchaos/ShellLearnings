#!/bin/bash

# usage: ./cmd_getopt_basic4.sh -a -b 66 -c -- file file2
# 处理带参数的选项

while [ -n "$1" ]
do
	case $1 in
		-a) echo "found option: -a";;
		-b) param="$2"
		    echo "found option: -b, with param: $param"
		    shift 1;;
		-c) echo "found option: -c";;
		--) shift
		    break;
	esac
	shift
done

count=1
for param in "$@"
do
	echo "param $count: $param"
	count=$[ $count + 1 ]
done

