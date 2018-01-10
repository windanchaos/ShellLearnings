#!/bin/bash

i=1
while [ $i -le 5 ]
do
		echo i is $i
		i=`expr $i + 1`
done


#!/bin/bash
if [ $1 -gt $2 ]
then echo "$1>$2"
else echo "$2>$1"
fi
# 数字判断一些命令
#-gt是大于的意思,greater than
#-lt是小于,lower than
#-eq是等于,equal
#-ne是不等于 not equal
#-ge是大于等于 greater equal
#-le是小于等于 lower equal