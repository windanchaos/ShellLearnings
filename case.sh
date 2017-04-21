#!/bin/bash

clear
echo -n "enter your choice [y/n]: "
read choice
case $choice in
	y|Y|YES|yes)
		echo "your choice is: $choice"
		;;
	n|N|NO|no)
		echo "your choice is: $choice"
		;;
esac
