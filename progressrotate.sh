#!/bin/bash

function rotate()
{
	INTERVAL=0.5
	RCOUNT="0"
	echo -n "Processing "
	while :
	do
			(( RCOUNT = RCOUNT + 1 ))
			case $RCOUNT in
					1)
						   	echo -e '-\b\c'
							sleep $INTERVAL
							;;
					2)
							echo -e '\\\b\c'
							sleep $INTERVAL
							;;
					3)
							echo -e '|\b\c'
							sleep $INTERVAL
							;;
					4)
							echo -e '/\b\c'
							sleep $INTERVAL
							;;
					*)
							RCOUNT=0
							;;
			esac
	done
}
rotate &
BG_PID=$!
trap "kill -9 $BG_PID" INT
ROTATE_PID=$!

sleep 15
kill -9 $ROTATE_PID
echo
