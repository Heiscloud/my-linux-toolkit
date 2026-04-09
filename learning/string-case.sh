#!/bin/bash

# string case-check

read -p "Please enter a string -> " str

if [[ "$str" =~ ^[a-z\ ]+$ ]]; then
	echo "lowercase string."
elif [[ "$str" =~ ^[A-Z\ ]+$ ]]; then
	echo "uppercase string."
elif [[ "$str" =~ ^[A-Za-z\ ]+$ ]]; then
	echo "mixed string."
else
	echo "invalid string."
fi
