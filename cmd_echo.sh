#!/bin/bash

# echo命令默认会换行输出
echo Logname is $LOGNAME

# -e选项表示使用转义序列来控制输出的效果
# -c选项表示最后不加换行 
echo -e "Hello \c"
echo "$LOGNAME"

# -n选项表示不输出换行符
echo -n "Hello "
echo "World"

# 使用-e选项来显示富文本样式的内容
echo -e "Username is \033[1;4;32m$LOGNAME\033[0m"
