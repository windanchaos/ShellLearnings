#!/bin/bash

function dots() {
	# print a dot every 5 seconds by default
	seconds=${1:-5}
	while true
	do
			sleep $seconds
			echo -n '.'
	done
}

# 使用&符号使dots运行在后台
dots 10 &
# 通过$!获取dots的进程pid
BG_PID=$!

# 当用户按Ctrl+C来发送中断信号INT时，执行kill命令
# 防止脚本中断后dots仍在后台运行
trap "kill -9 $BG_PID" INT

# do the real job here
sleep 150
kill $BG_PID
echo

