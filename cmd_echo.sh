#!/bin/bash

# echo命令默认会换行输出
echo Logname is $LOGNAME

# -e选项表示使用转义序列来控制输出的效果
echo -e "Hello \c"
echo "$LOGNAME"

# -n选项表示不输出换行符
echo -n "Hello "
echo "World"
