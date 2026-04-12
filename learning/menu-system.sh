#!/bin/bash

# read-menu: a menu driven system information program

DELAY=5 # Number of seconds to display results

while true; do
clear
	cat <<- _EOF_ 
		Please Select:

		1. Display System Information 
		2. Display Disk Space
		3. Display Home Space Utilization
		4. Display Network Info
		0. Quit

	_EOF_
	read -p "Enter selection [0-4] -> "

# using elif to handle input selection
	if [[ "$REPLY" =~ ^[0-4]$ ]]; then
		if [[ "$REPLY" == 1 ]]; then
			echo "Hostname: $HOSTNAME"
			uptime
			sleep "$DELAY"
			continue
		elif [[ "$REPLY" == 2 ]]; then
			df -h
			sleep "$DELAY"
			continue
		elif [[ "$REPLY" == 3 ]]; then

# check if user is root (ID = 0)
		if [[ "$(id -u)" -eq 0 ]]; then
			echo "Home Space Utilization (All Users)"
			du -sh /home/*
		else 
			echo "Home Space Utilization ($USER)"
			du -sh "$HOME"
			sleep "$DELAY"
			continue
		fi
		elif [[ "$REPLY" == 4 ]]; then
			echo "Display Network Info"
			ip --brief addr
			sleep "$DELAY"
			continue
	fi
	if [[ "$REPLY" == 0 ]]; then
		break
	fi
# Handle invalid input
		else
			echo "Invalid entry."
			sleep "$DELAY"
		fi
done
echo "Program terminated."

