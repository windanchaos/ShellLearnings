#!/bin/bash

# usage: ./cmd_getopt_basic3.sh -b -v -- file file2
# 当脚本遇到双杠时，停止处理选项，并将其余的参数作为命令行参数

while [ -n "$1" ]
do
	case $1 in
		-a) echo "found option: -a";;
		-b) echo "found option: -b";;
		-c) echo "found option: -c";;
		-v) echo "found option: -v";;
		--) shift
		    break;;
		*) echo "not found option: $";;
	esac
	shift
done

count=1
for param in $@
do
	echo "param $count :$param"
	count=$[ $count + 1 ]
done


