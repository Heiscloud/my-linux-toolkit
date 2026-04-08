#!/bin/bash

# string case-check

echo -n "Please enter a string -> "
read str

if [[ "$str" =~ ^[a-z\ ]+$ ]]; then
	echo "lowercase string."
elif [[ "$str" =~ ^[A-Z\ ]+$ ]]; then
	echo "uppercase string."
elif [[ "$str" =~ ^[A-Za-z\ ]+$ ]]; then
	echo "mixed string."
else
	echo "invalid string."
fi
