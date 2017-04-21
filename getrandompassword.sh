#!/bin/bash

# 随机生成10个8位的密码
# 1. 首位大写字母
# 2. 中间六位大小写字母数字随机组合
# 3. 第八位为数字
for (( i = 0; i < 10; i++ ))
do
	# 随机生成500个字符 | 只取大写字母 | 取第一个字符
	A=`head -c 500 /dev/urandom | tr -dc a-zA-Z | tr [a-z] [A-Z] | head -c 1`
	# 随机生成500个字符 | 去英文大小写字符及数字 | 取6个
	B=`head -c 500 /dev/urandom | tr -dc a-z0-9A-Z | head -c 6`
	# 去第二位随机数字，第一位随机性不高，大多是1或2，所以取第二位
	C=`echo $RANDOM | cut -c 2`
	echo $A$B$C
done
