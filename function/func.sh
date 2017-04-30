#!/bin/bash

# usage: ./func.sh .


function get_modules_path()
{
    for file in `ls $1`
    do
        if [ -d $1"/"$file ]
        then
            get_modules_path $1"/"$file
        else
            if [ $file = "Android.mk" ]
            then
                echo $1"/"$file
            fi
        fi
    done
}

function module_specify()
{
    list=`get_modules_path $1`
    for f in $list
    do
        echo $f
    done
}

module_specify $1
