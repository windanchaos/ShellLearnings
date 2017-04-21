#!/bin/bash

function readdir()
{
	for file in `ls $1`
	do
		if [ -d $1"/"$file ]; then
			readdir $1"/"$file
		else
			echo $1"/"$file
		fi
	done
}

readdir $1
