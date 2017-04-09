#!/bin/bash

# scriptname: select.sh
# Ctrl+C to quit

PS3="Select a program to execute: "
select program in 'ls -F' pwd date
do
		$program
done
