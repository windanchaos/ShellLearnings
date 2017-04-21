#!/bin/bash

function getchar()
{
	# 关闭屏幕回显
	stty cbreak -echo
	dd if=/dev/tty bs=1 count=1 2> /dev/null
	stty -cbreak echo
}

#printf "please input your password: "
echo -n "please input your password: "

while true
do
	ret=`getchar`
	if [ "$ret"x = x ]; then
		echo
		break
	fi
	str="$str$ret"
	#printf "*"
	echo -n "*"
done

echo "your password is: $str"
