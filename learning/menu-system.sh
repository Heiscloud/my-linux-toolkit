#!/bin/bash

# read-menu: a menu driven system information program

DELAY=5 # Number of seconds to display results

while true; do
clear
	cat <<- _EOF_ 
		Please Select:

		A. Display System Information 
		B. Display Disk Space
		C. Display Network Info
		D. Display Home Space Utilization
		Q. Quit

	_EOF_
	read -p "Enter selection [A, B, C, D or Q] -> "

# using case statements to handle the multiple input selections neatly
	case "$REPLY" in
		a|A)
			echo "Hostname: $HOSTNAME"
			uptime
			sleep "$DELAY"
			;;
		b|B)
			echo "Disk Space" 
			df -h
			sleep "$DELAY"
			;;
		c|C)
			echo "Display Network Info"
			ip --brief addr
			sleep "$DELAY"
			;;
# check if user is root (ID = 0)
		d|D)
			if [[ "$(id -u)" -eq 0 ]]; then
				echo "Home Space Utilization (All Users)"
				du -sh /home/*
			else 
				echo "Home Space Utilization ($USER)"
				du -sh "$HOME"
			fi
				sleep "$DELAY"
			;;
# Handle invalid input selections
		q|Q)
			echo "Program terminated."
			exit 0
			;;
		*)
			echo "Invalid entry."	
			sleep 2
			;;
	esac
done

