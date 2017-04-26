#!/bin/bash

JOBS=$(cat /proc/cpuinfo | grep "processor" | wc -l)
echo "CPU JOBS: "$JOBS
