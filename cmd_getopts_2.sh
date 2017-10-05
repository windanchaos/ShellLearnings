#!/bin/bash

while getopts vx:y:z:: ARGS; do
	echo "option: $ARGS"
	case $ARGS in
	v)
		echo "version" ;;
	x)
		echo "parameter: $OPTARG" ;;
	y)
		echo "parameter: $OPTARG" ;;
	z)
		echo "parameter: $OPTARG" ;;
	*)
		echo "invalid option"
	esac
done

#linuxfor@Linuxfor:~/Documents/ShellProjects$ ./cmd_getopts_2.sh -v -x 2 -y 3 -z2
#option: v
#version
#option: x
#parameter: 2
#option: y
#parameter: 3
#option: z
#parameter: 2
#linuxfor@Linuxfor:~/Documents/ShellProjects$ ./cmd_getopts_2.sh -v -x 2 -y 3 -z 2
#option: v
#version
#option: x
#parameter: 2
#option: y
#parameter: 3
#option: z
#parameter: 2
#linuxfor@Linuxfor:~/Documents/ShellProjects$ 

