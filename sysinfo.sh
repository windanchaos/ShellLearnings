#!/bin/bash

# -hostname information
echo -e "\e[31;43m***** HOSTNAME INFORMATION *****\e[0m"
#hostnamectl
echo ""

# -filesystem disk space usage
echo -e "\e[31;43m***** FILE SYSTEM DISK SPACE USAGE *****\e[0m"
df -h
echo ""

# -free and used memory
echo -e "\e[31;43m***** FREE AND USED MEMORY *****\e[0m"
free
echo ""

# -system uptime and load
echo -e "\e[31;43m***** SYSTEM UPTIME AND LOAD *****\e[0m"
uptime
echo ""

# -currently logged-in users
echo -e "\e[31;43m***** CURRENTLY LOGGED-IN USERS *****\e[0m"
who
echo ""

# -top 5 memory-consuming processes
echo -e "\e[31;43m***** TOP 5 MEMORY-CONSUMING PROCESSES *****\e[0m"
ps -eo %mem,%cpu,comm --sort=-%mem | head -n 6
echo ""

echo -e "\e[1;32mDone.\e[0m"
