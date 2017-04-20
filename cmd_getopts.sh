#!/bin/bash

echo "raw args:" $*

while getopts ":a:bc" opt
do
		case $opt in
				a)
						echo $
