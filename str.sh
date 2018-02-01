#!/bin/bash

# 字符串长度
welcome="hello world"
echo length of \"$welcome\" is ${#welcome}

# 判断字符串为空的方法有三种：
if [ "$str" =  "" ] 
if [ x"$str" = x ]
if [ -z "$str" ] （-n 为非空

#空格，是字符。不属于空的范畴。

#添加空格，需在空格前加\
#sed 生效需加-i
#sed 的动作i,需区别
for rpc in ${WEBENTS_MK[@]} ;do
        num=`grep -n "</profiles>" ${GIT_HOME}/${rpc}/pom.xml|awk -F ":" '{print $1}'`
sed -i ${num}'i \        <profile>\
            <id>nst2</id>\
            <properties>  \
                <profiles.active>nst2</profiles.active>  \
            </properties>\
        </profile>' ${GIT_HOME}/${rpc}/pom.xml