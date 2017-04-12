#!/bin/bash

# scriptname: nosy

echo -e "Are you happy? \c"
# 从标准输入读取一行并赋值给变量answer
read answer
echo "$answer is the right response."
echo -e "What is your full name? \c"
# 将输入的第一个词赋给变量first，第二个词赋给变量middle，将其余的都赋给变量last
read first middle last
echo "Hello $first"
# 选项-n表示不换行，echo命令默认是换行的
echo -n "Where do you work? "
# 从标准输入读取一行并赋给内置变量REPLY
read
echo I guess $REPLY keeps you busy!
# 打印提示符，等待输入，并将输入赋给内置变量REPLY
read -p "Enter your job title: "
echo "I thought you might be an $REPLY."
echo -n "Who are your best friends? "
# Melvin Tim Ernesto
# 读入一组词，依次赋给数组friends
read -a friends
# 显示friends数组的第3个元素，数组下标从0开始
echo "Say hi to ${friends[2]}."
