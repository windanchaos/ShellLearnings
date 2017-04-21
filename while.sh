#!/bin/bash

while read line; do
	name=`echo $line | awk -F '=' '{print $1}'`
	value=`echo $line | awk -F '=' '{print $2}'`
	case $name in
		"username")
			username=$value
			;;
		"password")
			password=$value
			;;
		"permission")
			permission=$value
			;;
		*)
			;;
	esac
done < config.cfg

echo "username=$username"
echo "password=$password"
echo "permission=$permission"
