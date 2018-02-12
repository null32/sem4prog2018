#!/bin/bash

read n
for (( c=0 ; c<n ; c++ ))
do
	read a
	if [ ! -z "$(echo "$a" | grep -xE "[_\.][0-9]+[a-zA-Z]*_?")" ]
	then
		echo "VALID"
	else
		echo "INVALID"
	fi
done
