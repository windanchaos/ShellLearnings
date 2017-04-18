#!/bin/bash

# eval命令执行两步操作
# 1. 执行变量替换
# 2. 执行替换后的命令串

welcome="cat welcome.txt"

# cat welcome.txt
echo $welcome

# Hello world and hello me!
eval $welcome
