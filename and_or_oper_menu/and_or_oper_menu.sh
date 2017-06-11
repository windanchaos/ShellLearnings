#!/bin/bash

path=./scripts

# 条件表达式判断，如果目录不存在，则创建目录
[ ! -d "$path" ] && mkdir $path -p
#menu

# 利用cat命令打印选择菜单，也可以用select语句打印
cat << EOF
    1. [install lamp]
    2. [install lnmp]
    3. [exit]
    please input the num you want: 
EOF

# 接收用户选择的数字
read num

# 判断是否为整数
expr $num + 1 &> /dev/null
# 根据返回值进行判断
[ $? -ne 0 ] && {
    echo "the num you input mnust be {1|2|3}"
    exit 1
}

# 如果用户选择1，则执行lamp安装命令
[ $num -eq 1 ] && {
    echo "start installing LAMP."
    sleep 2;
    # 判断脚本是否可执行，若不可执行则给予提示
    [ -x "$path/lamp.sh" ] || {
        echo "$path/lamp.sh does not exit or can not be execute."
        exit 1
    }

    # 执行安装脚本，工作中建议用source $path/lamp.sh替代，此处是练习-x的判断
    $path/lamp.sh

    #source $path/lamp.sh
    exit $?
}

# 如果用户选择2，则执行lnmp安装命令
[ $num -eq 2 ] && {
    echo "start installing LNMP."
    sleep 2;
    [ -x "$path/lnmp.sh" ] || {
        echo "$path/lnmp.sh does not exist or can not be execute."
        exit 1
    }

    # 执行脚本安装
    $path/lnmp.sh

    # 脚本中执行脚本，使用source比使用sh或不用解释器等更好一些
    #source $path/lnmp.sh
    exit $?
}

# 如果用户输入3，则退出脚本
[ $num -eq 3 ] && {
    echo bye.
    exit 3
}

# 如果用户输入不为1，2，3时，做其他处理
[[ ! $num =~ [1-3] ]] && {
    echo "the num you input must be {1|2|3}"
    echo "Input ERROR"
    exit 4
}
