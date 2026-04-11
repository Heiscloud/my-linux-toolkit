#!/bin/bash

# read-menu: a menu driven system information program

clear
echo " 
Please Select:

1. Display System Information 
2. Display Disk Space
3. Display Home Space Utilization
4. Display Network Info
0. Quit
"

read -p "Enter selection [0-4] -> "

# validate input, a single digit [0-4]
if [[ "$REPLY" =~ ^[0-4]$ ]]; then

# using elif to handle input selection 
	if [[ "$REPLY" == 0 ]]; then
		echo "Program terminated"
	elif [[ "$REPLY" == 1 ]]; then
		echo "Hostname: $HOSTNAME"
		uptime
	elif [[ "$REPLY" == 2 ]]; then
		df -h
	elif [[ "$REPLY" == 3 ]]; then

# check if user is root (ID = 0)
		if [[ "$(id -u)" -eq 0 ]]; then
			echo "Home Space Utilization (All Users)"
			du -sh /home/*
		else 
			echo "Home Space Utilization ($USER)"
			du -sh "$HOME"
		fi
	elif [[ "$REPLY" == 4 ]]; then
		echo "Display Network Info"
		ip --brief addr
fi

# Handle invalid input
else
	echo "Invalid entry." >&2
	exit 1
fi
