#!/bin/bash

# get all filename in specified path
# usage: ./for.sh .

path=$1
files=$(ls $path)
for file in $files
do
    echo $file
done
