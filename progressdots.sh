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

dots 10 &
BG_PID=$!

trap "kill -9 $BG_PID" INT

# do the real job here
sleep 150
kill $BG_PID
echo

